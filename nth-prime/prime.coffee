class Prime
  @nth: (n) ->
    throw "Prime is not possible" if n == 0
    lastPrime = 0
    counter = 0
    while counter < n
      counter += 1 if @isPrime(lastPrime)
      lastPrime += 1
    return lastPrime - 1

  @isPrime: (candidate) ->
    return false if candidate == 1
    return true if candidate == 2
    return false if @isEven(candidate)

    counter = 3
    max = candidate * 0.5 + 1
    while counter < max
      return false if candidate % counter == 0
      counter += 2
    return true

  @isEven: (n) ->
    return n % 2 == 0

module.exports = Prime
