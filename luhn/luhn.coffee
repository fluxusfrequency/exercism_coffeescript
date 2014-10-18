class Luhn
  constructor: (input) ->
    @number = input
    @digits = @number.toString().split('')
    @checkDigit = @checkDigit()
    @addends = @addends()
    @checksum = @checksum()
    @valid = @valid()

  @create: (number) ->
    if new Luhn(number).valid
      return number
    else
      return @findCheck(number)

  @findCheck: (number) ->
    for n in [0..9]
      test = new Luhn(number * 10 + n)
      return test.number if test.valid

  addends: ->
    collector = []
    for digit, i in @digits.reverse()
      if @isEven(i)
        collector.push(parseInt(digit))
      else
        candidate = parseInt(digit * 2)
        collector.push(@correctIfOverTen(candidate))
    return collector.reverse()

  checksum: ->
    return @addends.reduce (x, y) -> x + y

  valid: ->
    return @checksum % 10 == 0

  isEven: (index) ->
    (index + 2) % 2 == 0

  correctIfOverTen: (n) ->
    n -= 9 if n >= 10
    return n

  checkDigit: ->
    parseInt((@digits)[@digits.length - 1])


module.exports = Luhn