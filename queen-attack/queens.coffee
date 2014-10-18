class Queens
  constructor: (positions = {}) ->
    @white = positions['white'] or [0, 3]
    @black = positions['black'] or [7, 3]
    throw "Queens cannot share the same space" if @white == @black

  toString: ->
    (for row in [0..7]
      (for col in [0..7]
        if @isWhiteSquare(row, col)
          "W"
        else if @isBlackSquare(row, col)
          "B"
        else
          "O"
        ).join(" ")
      ).join("\n")

  canAttack: ->
    sameRow(@white, @black) or sameColumn(@white, @black) or sameDiagonal(@white, @black)

  isWhiteSquare: (row, col) ->
    row == @white[1] and col == @white[0]

  isBlackSquare: (row, col) ->
    row == @black[1] and col == @black[0]

sameColumn = (position1, position2) -> position1[1] == position2[1]

sameRow = (position1, position2) -> position1[0] == position2[0]

sameDiagonal = (position1, position2) -> offset(position1) == offset(position2)

offset = (color) -> Math.abs(color[1] - color[0])

module.exports = Queens