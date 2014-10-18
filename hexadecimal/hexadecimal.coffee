class Hexadecimal
  constructor: (@hex) ->

  toDecimal: ->
    powers = @powersOfSixteen()
    places = @parsedDigits(@hex)
    products = []
    
    for power, i in powers
      return 0 if not places[i]
      products.push(power * places[i])
      
    return products.reduce (x, y) -> x + y

  powersOfSixteen: ->
    powers = []
    for digit, i in @hex
      powers.push(Math.pow(16, i))
    return powers

  normalize: (digit) ->
    return digit if digit.match(/\d+/)
    return @conversions[digit]

  parsedDigits: ->
    return @hex.split('').reverse().map (digit) => @normalize(digit);

  conversions: {
    "a": 10,
    "b": 11,
    "c": 12,
    "d": 13,
    "e": 14,
    "f": 15
  }

module.exports = Hexadecimal