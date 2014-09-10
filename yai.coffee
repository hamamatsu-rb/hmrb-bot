# Description:
#   hello world
#
# Commands:
#   hubot やい

module.exports = (robot) ->
  robot.respond /やい$/i, (msg) ->
    msg.send "やい"
