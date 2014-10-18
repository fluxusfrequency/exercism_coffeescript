class WordProblem

  constructor: (@question) ->
    @ERROR = {tooComplicated: "ERROR: too complicated!"}

  answer: ->
    throw @ERROR.tooComplicated unless @operators()

    nums = @numbers()
    operators = @operators()

    for operator, i in operators
      if i == 0
        sum = @evaluateExpression(nums[i], nums[i + 1], operator)
      else
        sum = @evaluateExpression(sum, nums[i + 1], operator)
    return sum

  evaluateExpression: (first, second, operand) ->
    return first + second if operand == 'plus'
    return first - second if operand == 'minus'
    return first * second if operand == 'multiplied'
    return first / second if operand == 'divided'

  numbers: ->
    return @question.match(/\-?\d+/g).map (d) -> parseInt(d)

  operators: ->
    return @question.match(/(plus|minus|multiplied|divided)/g)

module.exports = WordProblem