class Beer
  @sing: (max, min = 0) ->
    (@verse(n) for n in [max..min]).join("\n\n") + "\n"

  @verse: (n) ->
      if n is 0 then lastVerse else
        """
        #{pluralizeBottles(n)} of beer on the wall, #{pluralizeBottles(n)} of beer.
        Take #{itOrOne(n)} down and pass it around, #{pluralizeBottles(n-1)} of beer on the wall.
        """

  lastVerse =
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """

  pluralizeBottles = (n) ->
    switch n
      when 1 then "1 bottle"
      when 0 then "no more bottles"
      else "#{n} bottles"

  itOrOne = (n) ->
    if n is 1 then "it" else "one"

module.exports = Beer
