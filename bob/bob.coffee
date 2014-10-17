class Bob
  hey: (provocation) ->
    message = new Message(provocation)
    return 'Fine. Be that way!' if message.isSilent()
    return 'Woah, chill out!' if message.isYelling()
    return 'Sure.' if message.isQuestion()
    return 'Whatever.'


class Message
  constructor: (utterance) ->
    @utterance = utterance

  isSilent: ->
    return @utterance.trim().length == 0

  isYelling: ->
    return @utterance.toUpperCase() == @utterance

  isQuestion: ->
    return @utterance[@utterance.length - 1] == '?'

module.exports = Bob
