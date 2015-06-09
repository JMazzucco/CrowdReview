// $(function() {
//   var width = 960,
//       height = 500,
//       radius = Math.min(width, height) / 2;

//   var color = d3.scale.ordinal()
//       .range(["#0092B9", "#86AD00", "#F2B705", "#D97904", "#BC3603", "#d0743c", "#ff8c00"]);

//   var arc = d3.svg.arc()
//       .outerRadius(radius - 10)
//       .innerRadius(0);

//   var pie = d3.layout.pie()
//       .sort(null)
//       .value(function(d) { return d.population; });

//   var svg = d3.select("body").append("svg")
//       .attr("width", width)
//       .attr("height", height)
//     .append("g")
//       .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

//   // d3.csv("/data.csv", function(error, data) {
//   // d3.json("/data.json", function(error, data) {
//   d3.json("/metrics/cohorts", function(error, data) {

//     data.forEach(function(d) {
//       d.population = +d.population;
//     });

//     var g = svg.selectAll(".arc")
//         .data(pie(data))
//       .enter().append("g")
//         .attr("class", "arc");

//     g.append("path")
//         .attr("d", arc)
//         .style("fill", function(d) { return color(d.data.age); });

//     g.append("text")
//         .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
//         .attr("dy", ".35em")
//         .style("text-anchor", "middle")
//         .text(function(d) { return d.data.age; });

//   });


// })
