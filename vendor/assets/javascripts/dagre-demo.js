function spline(points) {
  return d3.svg.line()
    .x(function(d) { return d.x; })
    .y(function(d) { return d.y; })
    .interpolate("linear")
    (points);
}

function graphToURL() {
  return [window.location.protocol, '//',
          window.location.host,
          window.location.pathname,
          '?graph=', encodeURIComponent(inputGraph.value),
          '&style=', encodeURIComponent(inputStyle.node().value)].join('');
}

function dibujar(dot) {
  var svg = d3.select("svg");
  var svgGroup = svg.append("g").attr("transform", "translate(5,5)");
  var result;
/*
  if (oldInputGraphValue !== inputGraph.value || oldInputStyleValue !== inputStyle.node().value) {
    inputGraph.setAttribute("class", "");
    oldInputGraphValue = inputGraph.value;
    oldInputStyleValue = inputStyle.node().value;
    try { */
      result = dagre.dot.toObjects(dot)
      result.edges.forEach(function(e) { if (!e.label) { e.label = ""; } });
/*    } catch (e) {
      inputGraph.setAttribute("class", "error");
    }
  }
*/
  if (result) {
    // TODO why is inputStyle.text or inputStyle.html not working here?
    //graphStyle.html(inputStyle.node().value);
    //graphLink.attr("href", graphToURL());

    svgGroup.selectAll().remove();

    // Get the data in the right form
    var graphNodes = result.nodes;
    var graphEdges = result.edges;

    // Clear everything out
    // TODO: support incremental updates
    svgGroup.selectAll("g").remove();

    // `nodes` is center positioned for easy layout later
    var nodes = svgGroup
      .selectAll("g .node")
      .data(graphNodes)
      .enter()
        .append("g")
          .attr("class", "node")
          .attr("id", function(d) { return "node-" + d.id; })
          .each(function(d) { d.nodePadding = 10; });

    var edges = svgGroup
      .selectAll("g .edge")
      .data(graphEdges)
      .enter()
        .append("g")
          .attr("class", "edge")
          .attr("id", function(d) { return "edge-" + d.id; })
          .each(function(d) { d.nodePadding = 0; })
          .append("path")
            .attr("marker-end", "url(#arrowhead)");

    // Append rectangles to the nodes. We do this before laying out the labels
    // because we want the text above the rectangle.
    var nodesAndEdges = svgGroup.selectAll("g .node, g .edge");

    var nodeRects = nodes.append("rect");

    // Append labels
    var labels = nodesAndEdges
      .append("g")
      .attr("class", "label")
      .classed("inline-html", function(d) { return d.label[0] === "<"; });

    var labelRects = labels.append("rect");

    var foLabels = nodesAndEdges.selectAll("g .label.inline-html")
      .append("foreignObject")
      // TODO find a better way to get the dimensions for foriegnObjects
      .attr("width", "100000");

    foLabels
      .append("xhtml:div")
      .style("float", "left")
      .html(function(d) { return d.label; })
      .each(function(d) {
        d.foWidth = this.clientWidth;
        d.foHeight = this.clientHeight;
        d.nodePadding = 0;
      });

    foLabels
      .attr("width", function(d) { return d.foWidth; })
      .attr("height", function(d) { return d.foHeight; });

    nodesAndEdges.selectAll("g .label:not(.inline-html)")
      .append("text")
        .attr("text-anchor", "left")
          .append("tspan")
          .attr("dy", "1em")
          .text(function(d) { return d.label; });

    // We need width and height for layout.
    labels.each(function(d) {
      var bbox = this.getBBox();
      d.bbox = bbox;
      if (d.label.length) {
        d.width = bbox.width + 2 * d.nodePadding;
        d.height = bbox.height + 2 * d.nodePadding;
      } else {
        d.width = d.height = 0;
      }
    });

    nodeRects
      .attr("x", function(d) { return -(d.bbox.width / 2 + d.nodePadding); })
      .attr("y", function(d) { return -(d.bbox.height / 2 + d.nodePadding); })
      .attr("width", function(d) { return d.width; })
      .attr("height", function(d) { return d.height; });

    labelRects
      .attr("x", function(d) { return -d.nodePadding; })
      .attr("y", function(d) { return -d.nodePadding; })
      .attr("width", function(d) { return d.width; })
      .attr("height", function(d) { return d.height; });

    labels
      .attr("transform", function(d) { return "translate(" + (-d.bbox.width / 2) + "," + (-d.bbox.height / 2) + ")"; });

    dagre.layout()
      .nodes(graphNodes)
      .edges(graphEdges)
      .debugLevel(2)
      .run();

    nodes.attr("transform", function(d) { return "translate(" + d.dagre.x + "," + d.dagre.y +")"; });

    edges.attr("d", function(e) {
      var points = e.dagre.points;
      var source = dagre.util.intersectRect(e.source.dagre, points.length > 0 ? points[0] : e.source.dagre);
      var target = dagre.util.intersectRect(e.target.dagre, points.length > 0 ? points[points.length - 1] : e.source.dagre);
      points.unshift(source);
      points.push(target);
      return spline(points);
    });

    svgGroup
      .selectAll(".edge g.label")
      .attr("transform", function(e) {
        var mp = e.dagre.points[Math.floor(e.dagre.points.length / 2)];
        var xDelta = -e.bbox.width / 2;
        var yDelta = -e.bbox.height / 2;
        return "translate(" + (mp.x + xDelta) + "," + (mp.y + yDelta) + ")";
      });

    // Resize the SVG element
    var svgBBox = svg.node().getBBox();
    svg.call(d3.behavior.zoom().on("zoom", function redraw() {
      svgGroup.attr("transform",
            "translate(" + d3.event.translate + ")"
            + " scale(" + d3.event.scale + ")");
    }));
  }
}
