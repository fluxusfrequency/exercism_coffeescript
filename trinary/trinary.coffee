class Trinary
  constructor: (@trinary) ->

  toDecimal: ->
    return 0 if @invalid()

    reversed = @reversedDigits()

    sum = 0
    for digit, i in @trinary
      sum += Math.pow(3, i) * parseInt(reversed[i])
    sum

  reversedDigits: ->
    @trinary.split('').reverse();

  invalid: ->
    @trinary.match(/\D+/g)

module.exports = Trinary
