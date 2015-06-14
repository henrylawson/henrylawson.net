var ChartHelper = (function() {

  function resizeForNarrowWindow(chart) {
    if ($(window).width() < 900) {
      chart.setMargins('10%', '10%%', '10%', '30%');
    } else {
      chart.setMargins('10%', '10%%', '10%', '10%');
    }
  }

  return {
    setAxisStyle: function(axis) {
      axis.fontSize = '0.9em';
      axis.fontFamily = 'inherit';
    },
    draw: function(chart) {
      chart.draw();
      resizeForNarrowWindow(chart);
      $(window).resize(function() {
        resizeForNarrowWindow(chart);
        chart.draw(0, true);
      });
    }
  };
})();
