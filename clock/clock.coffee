Clock = (hour, minutes = "00") ->
  @hour = hour
  @minutes = Number(minutes)

Clock.prototype.toString = ->
  "#{pad(@hour)}:#{pad(@minutes)}"

Clock.prototype.plus = (step) ->
  @minutes = @minutes + step
  while @minutes > 59
    @hour += 1
    @minutes -= 60
  while @hour > 23
    @hour -= 24
  @toString()

Clock.prototype.minus = (step) ->
  @minutes = @minutes - step
  while @minutes < 0
    @hour -= 1
    @minutes += 60
  while @hour < 0
    @hour += 24
  @toString()

Clock.prototype.equals = (other) ->
  @hour == other.hour && @minutes == other.minutes


Clock.at = (hour, minutes) ->
  new Clock(hour, minutes)


pad = (digit) ->
  return "0#{digit}" if digit.toString().length == 1
  digit

module.exports = Clock
