jQuery ->
  svg   = d3.select("svg")
  svgGroup = svg.append("g").attr("transform", "translate(5,5)")

  $.get("#{this.URL}.dot", (dot) ->
    dibujar dot)
