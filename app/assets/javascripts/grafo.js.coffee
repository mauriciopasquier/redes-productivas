jQuery ->
  svg   = d3.select("svg")
  svgGroup = svg.append("g").attr("transform", "translate(5,5)")

  dibujar $('#dot')[0].value
