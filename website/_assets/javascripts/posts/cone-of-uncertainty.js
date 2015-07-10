OnLoad.call(function() {
  var svg = dimple.newSvg("#cone-of-uncertainty", '100%', 500);
  var data = [
    { 'Type':'Positive', 'Project Stage':'Initial Concept', 'Planning Uncertainty':10},
    { 'Type':'Positive', 'Project Stage':'Discovery', 'Planning Uncertainty':5},
    { 'Type':'Positive', 'Project Stage':'Inception', 'Planning Uncertainty':2.5},
    { 'Type':'Positive', 'Project Stage':'Delivery', 'Planning Uncertainty':1.25},
    { 'Type':'Positive', 'Project Stage':'Completion', 'Planning Uncertainty':0},

    { 'Type':'Negative', 'Project Stage':'Initial Concept', 'Planning Uncertainty':-10},
    { 'Type':'Negative', 'Project Stage':'Discovery', 'Planning Uncertainty':-5},
    { 'Type':'Negative', 'Project Stage':'Inception', 'Planning Uncertainty':-2.5},
    { 'Type':'Negative', 'Project Stage':'Delivery', 'Planning Uncertainty':-1.25},
    { 'Type':'Negative', 'Project Stage':'Completion', 'Planning Uncertainty':0}
  ];
  var chart = new dimple.chart(svg, data);

  var x = chart.addCategoryAxis('x', 'Project Stage');
  x.addOrderRule(['Initial Concept', 'Discovery', 'Inception', 'Delivery', 'Completion']);
  ChartHelper.setAxisStyle(x);

  var y = chart.addMeasureAxis('y', 'Planning Uncertainty');
  ChartHelper.setAxisStyle(y);

  var series = chart.addSeries('Type', dimple.plot.line);
  series.interpolation = 'cardinal';

  ChartHelper.draw(chart);
});
