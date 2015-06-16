var OnLoad = (function() {
  var callbacks = [];
  return {
    call: function(callback) {
      callbacks.push(callback);
    },
    execute: function() {
      for (var i = 0; i < callbacks.length; i++) {
        callbacks[i]();
      }
    }
  };
})();
