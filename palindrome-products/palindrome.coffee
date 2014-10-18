class Palindrome
  @isPalindrome: (number) ->
    digits = number.toString().split('').reverse().join('')
    return digits is number.toString()

  @uniqueFactors: (value) =>
    starting = @findFactors(value)
    sorted = starting.map (pair) -> pair.sort()
    return sorted.unique()

  @findFactors: (value) ->
    results = []
    for i in [1..value]
      results.push([i, (value / i)]) if value % i == 0
    return results

class Palindromes
  constructor: (bounds) ->
    @max = bounds['maxFactor']
    @min = bounds['minFactor'] || 1
    @range = [@min..@max]
    @palindromes = @generate()

  generate: ->
    palindromes = []
    for i in [@min..@max]
      for j in [@min..@max]
        product = (i * j)
        palindromes.push(product) if Palindrome.isPalindrome(product)
    return palindromes

  largest: =>
    biggest = @generate().reduce (a,b) -> Math.max a, b
    low = @min
    high = @max
    return {
      value: biggest,
      factors: Palindrome.uniqueFactors(biggest).filter (pair) ->
        pair.every (factor) -> low <= factor <= high
    }

  smallest: =>
    littlest = @generate().reduce (a,b) -> Math.min a, b
    low = @min
    high = @max
    return {
      value: littlest,
      factors: Palindrome.uniqueFactors(littlest).filter (pair) ->
        pair.every (factor) -> low <= factor <= high
    }

Array::unique = ->
  output = {}
  output[@[key]] = @[key] for key in [0...@length]
  value for key, value of output

module.exports = Palindromes
