# countdown-kaigi.coffee

describe 'greet', ->
  it 'can show days reft', ->
    greet = restDaysGreet()
    result = greet()
    expect(result).toBe 5
