module.exports = (robot) ->
  robot.respond /(chack norris|チャックノリス|チャック・ノリス)( me)?/i, (msg) ->
    msg.http("http://api.icndb.com/jokes/random")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).value.joke