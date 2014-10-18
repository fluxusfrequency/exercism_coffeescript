class Anagram
  constructor: (@word) ->

  match: (collection) ->
    candidate.toLowerCase() for candidate in collection when @isAnagram(candidate)

  isAnagram: (candidate) ->
    @notSameWord(candidate) && @lettersMatch(candidate)

  notSameWord: (candidate) ->
    @word.toLowerCase() != candidate.toLowerCase()

  lettersMatch: (candidate) ->
    arrayEqual @parsedWord(@word), @parsedWord(candidate)

  parsedWord: (input) ->
    input.toLowerCase().split('').sort()

arrayEqual = (a, b) ->
  a.length is b.length and a.every (elem, i) -> elem is b[i]

module.exports = Anagram