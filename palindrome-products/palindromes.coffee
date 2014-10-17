class Palindrome
  @isPalindrome: (number) ->
    digits = number.toString().split('').reverse().join('')
    return digits is number.toString()

  constructor: (value) ->
    @value = value
    @factors = @findUniqueFactors()

  findUniqueFactors: ->
    factors = []
    for i in [1..@value]
      factors.push([i, (@value/i)]) if @value % i == 0

    sorted = factors.map (pair) -> pair.sort()
    return sorted.unique()

  factorsInRange: (low, high) ->
    return @factors.filter (pair) ->
      pair.every (factor) -> low <= factor <= high

class Palindromes
  constructor: (options) ->
    @min = options.minFactor || 1
    @max = options.maxFactor
    @palindromes = @generate()

  generate: ->
    palindromes = []
    for i in [@min..@max]
      for j in [@min..@max]
        product = i * j
        palindromes.push(new Palindrome(product)) if Palindrome.isPalindrome(product)
    return palindromes

  largest: ->
    greatestValue = @palindromes.reduce (a, b) -> Math.max a.value, b.value
    palindrome = new Palindrome(greatestValue)
    palindrome.factors = palindrome.factorsInRange(@min, @max)
    return palindrome

  smallest: ->
    palindrome = @palindromes[0]
    palindrome.factors = palindrome.factorsInRange(@min, @max)
    return palindrome

Array::unique = ->
  output = {}
  output[@[key]] = @[key] for key in [0...@length]
  value for key, value of output

module.exports = Palindromes
