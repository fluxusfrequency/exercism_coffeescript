class Binary
  constructor: (binaryInput) ->
    @binary = binaryInput

  toDecimal: ->
    return 0 if @invalid()

    powers = @powersOfTwo()
    reversed = @reversedDigits()
    sum = 0

    for digit, i in @binary
      sum += powers[i] * parseInt(reversed[i])
      
    return sum

  powersOfTwo: ->
    powers = []
    for digit, i in @binary
      powers.push(Math.pow(2, i))
    return powers

  reversedDigits: ->
    return @binary.split('').reverse();

  invalid: ->
    return @binary.match(/\D+/g)

module.exports = Binary