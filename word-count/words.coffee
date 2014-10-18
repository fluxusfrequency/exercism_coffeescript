class Words
  constructor: (words) ->
    @words = words.toLowerCase().match(/\w+/g)

    @count = {}

    for word in @words
      @count[word] = @count[word] + 1 || 1

module.exports = Words