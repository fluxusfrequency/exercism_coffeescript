Array.prototype.accumulate = (fn) ->
  (fn(item) for item in this)

