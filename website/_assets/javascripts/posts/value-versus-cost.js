OnLoad.call(function() {
  var svg = dimple.newSvg("#value-versus-cost", '100%', '500');
  var data = [
    { 'Cost': 'Low', 'Value': 'Low' },
    { 'Cost': 'Low', 'Value': 'High' },
    { 'Cost': 'High', 'Value': 'Low' },
    { 'Cost': 'High', 'Value': 'High' },
  ];
  var chart = new dimple.chart(svg, data);

  var x = chart.addCategoryAxis('x', 'Value');
  x.addOrderRule(['Low', 'High']);
  ChartHelper.setAxisStyle(x);

  var y = chart.addCategoryAxis('y', 'Cost');
  y.addOrderRule(['Low', 'High']);
  ChartHelper.setAxisStyle(y);

  var series = chart.addSeries('Type', dimple.plot.bubble);

  ChartHelper.draw(chart);
});

