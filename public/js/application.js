(function() {

  (function(a) {
    var b, c, d, _results;
    b = function() {};
    c = "assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(",");
    d = void 0;
    _results = [];
    while (!!(d = c.pop())) {
      _results.push(a[d] = a[d] || b);
    }
    return _results;
  })(function() {
    try {
      console.log();
      return window.console;
    } catch (a) {
      return (window.console = {});
    }
  });

}).call(this);
