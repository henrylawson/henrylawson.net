var ChartHelper = (function() {

  function resizeForNarrowWindow(chart) {
    if (document.body.clientWidth < 900) {
      chart.setMargins('10%', '10%%', '10%', '35%');
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

      var prevCallback = window.onresize;
      window.onresize = function() {
        resizeForNarrowWindow(chart);
        chart.draw(0, true);
        if (typeof(prevCallback) === 'function') {
          prevCallback();
        }
      };
    }
  };
})();
