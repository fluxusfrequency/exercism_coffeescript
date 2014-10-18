class Bob
  hey: (provocation) ->
    message = new Message(provocation)
    return 'Fine. Be that way!' if message.isSilent()
    return 'Whoa, chill out!' if message.isYelling()
    return 'Sure.' if message.isQuestion()
    return 'Whatever.'


class Message
  constructor: (@utterance) ->

  isSilent: ->
    return @utterance.trim().length == 0

  isYelling: ->
    return @hasWords() && @utterance.toUpperCase() == @utterance

  isQuestion: ->
    return @utterance.slice(-1) == '?'

  hasWords: ->
    return @utterance.match(/[a-zA-Z]+/)

module.exports = Bob
