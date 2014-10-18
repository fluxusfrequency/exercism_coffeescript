WordProblem = require './wordy'

describe 'Word Problem', ->

  it 'add 1', ->
    problem = new WordProblem('What is 1 plus 1?')
    expect(2).toEqual problem.answer()

  it 'add 2', ->
    problem = new WordProblem('What is 53 plus 2?')
    expect(55).toEqual problem.answer()

  it 'add negative numbers', ->
    problem = new WordProblem('What is -1 plus -10?')
    expect(-11).toEqual problem.answer()

  it 'add more digits', ->
    problem = new WordProblem('What is 123 plus 45678?')
    expect(45801).toEqual problem.answer()

  it 'subtract', ->
    problem = new WordProblem('What is 4 minus -12?')
    expect(16).toEqual problem.answer()

  it 'multiply', ->
    problem = new WordProblem('What is -3 multiplied by 25?')
    expect(-75).toEqual problem.answer()

  it 'divide', ->
    problem = new WordProblem('What is 33 divided by -3?')
    expect(-11).toEqual problem.answer()

  it 'add twice', ->
    problem = new WordProblem('What is 1 plus 1 plus 1?')
    expect(3).toEqual problem.answer()

  it 'add then subtract', ->
    problem = new WordProblem('What is 1 plus 5 minus -2?')
    expect(8).toEqual problem.answer()

  it 'subtract twice', ->
    problem = new WordProblem('What is 20 minus 4 minus 13?')
    expect(3).toEqual problem.answer()

  it 'subtract then add', ->
    problem = new WordProblem('What is 17 minus 6 plus 3?')
    expect(14).toEqual problem.answer()

  it 'multiply twice', ->
    problem = new WordProblem('What is 2 multiplied by -2 multiplied by 3?')
    expect(-12).toEqual problem.answer()

  it 'add then multiply', ->
    problem = new WordProblem('What is -3 plus 7 multiplied by -2?')
    expect(-8).toEqual problem.answer()

  it 'divide twice', ->
    problem = new WordProblem('What is -12 divided by 2 divided by -3?')
    expect(2).toEqual problem.answer()

  it 'too advanced', ->
    problem = new WordProblem('What is 53 cubed?')
    expect(-> problem.answer()).toThrow(problem.ERROR.tooComplicated)

  it 'irrelevant', ->
    problem = new WordProblem('Who is the president of the United States?')
    expect(-> problem.answer()).toThrow(problem.ERROR.tooComplicated)
