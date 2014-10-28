module.exports = (robot) ->
  robot.hear /(chuck norris|チャックノリス|チャック・ノリス)/i, (msg) ->
    msg.http("http://api.icndb.com/jokes/random")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).value.joke
