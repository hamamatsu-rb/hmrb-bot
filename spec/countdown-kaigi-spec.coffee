# countdown-kaigi.coffee

d = require '../scripts/countdown-kaigi.coffee'

describe 'greet', ->
  it 'can show days reft', ->
    greet = d.rest()
    expect(greet).toMatch /浜松/
