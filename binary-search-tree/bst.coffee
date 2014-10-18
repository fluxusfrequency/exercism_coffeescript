class Bst
  constructor: (@data) ->

  each: (callback) ->
    @left.each(callback) if @left
    callback(@data)
    @right.each(callback) if @right
      
  all: ->
    result = []
    result = result.concat(@left.all()) if @left
    result = result.concat([@data])
    result = result.concat(@right.all()) if @right
    return result

  insert: (newData) ->
    if newData <= @data
      @insertLeft(newData)
    else
      @insertRight(newData)

  insertLeft: (data) ->
    @left?.insert(data) || @left = new Bst(data)

  insertRight: (data) ->
    @right?.insert(data) || @right = new Bst(data)
  
module.exports = Bst