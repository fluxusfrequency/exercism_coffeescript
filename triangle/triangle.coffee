Triangle = (@a, @b, @c) ->
  @sides = [@a, @b, @c]
  @validate()

Triangle.prototype.validate = ->
  throw 'negative sides are illegal' if !@isAllPositive()
  throw 'violation of triangle inequality' if !@meetsTriangleInequality()

Triangle.prototype.isAllPositive = ->
  negatives = @sides.filter (x) -> x < 0
  negatives.length == 0

Triangle.prototype.meetsTriangleInequality = ->
  sorted = @sides.sort()
  sorted[0] + sorted[1] > sorted[2]

Triangle.prototype.isEquilateral = ->
  @a == @b == @c

Triangle.prototype.isScalene = ->
  @a != @b && @a != @c && @b != @c

Triangle.prototype.kind = ->
  return 'equilateral' if @isEquilateral()
  return 'scalene' if @isScalene()
  'isosceles'

module.exports = Triangle
