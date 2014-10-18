LinkedList = ->
  @head = null
  @count = 0

LinkedList.prototype.pushNode = (datum) ->
  return @head = new Node(datum, null, null) if !@head

  @fastForward()
  @head.next = new Node(datum, @head, null)

LinkedList.prototype.popNode = ->
  return undefined if !@head

  @fastForward()
  datum = @head.datum
  @head = @head.last
  @head.next = null
  datum

LinkedList.prototype.unshiftNode = (datum) ->
  return @head = new Node(datum, null, null) if !@head

  @rewind()
  @head.last = new Node(datum, null, @head)

LinkedList.prototype.shiftNode = () ->
  return undefined if !@head

  @rewind()
  datum = @head.datum
  @head = @head.next
  @head.last = null if @head
  datum

LinkedList.prototype.deleteNode = (datum) ->
  @rewind()
  @head = @head.next while @head.next && @head.datum != datum
  @head.next.last = @head.last if @head.next
  @head.last.next = @head.next if @head.last
  @head = @head.next || @head.last

LinkedList.prototype.countNodes = () ->
  return 0 if !@head

  count = 1
  @rewind()
  while @head.next
    count += 1
    @head = @head.next
  count

LinkedList.prototype.fastForward = ->
  @head = @head.next while @head.next

LinkedList.prototype.rewind = ->
  @head = @head.last while @head.last

Node = (@datum, @last, @next) ->

module.exports = LinkedList
