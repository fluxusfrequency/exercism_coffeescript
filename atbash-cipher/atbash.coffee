Atbash = {}

generateAlphabet = ->
  a = 'a'.charCodeAt(0)
  z = 'z'.charCodeAt(0)
  (String.fromCharCode(i) for i in [a..z])

ALPHABET = generateAlphabet()

REVERSED = do ->
  generateAlphabet().reverse()

encodeChar = (char) ->
  return char if char.match(/\d+/)
  i = ALPHABET.indexOf(char.toLowerCase())
  REVERSED[i]

Atbash.encode = (phrase) ->
  (encodeChar(c) for c in phrase)
    .join('')
    .match(/.{1,5}/g)
    .join(' ')

module.exports = Atbash
