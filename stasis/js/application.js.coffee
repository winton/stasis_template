# make it safe to use console.log always

((a) ->
  b = ->
  c = "assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(",")
  d = undefined

  while !!(d = c.pop())
    a[d] = a[d] or b
)(
  ->
    try
      console.log()
      return window.console
    catch a
      return (window.console = {})
)