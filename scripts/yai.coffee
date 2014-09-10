# Description:
#   hello world
#
# Commands:
#   hubot やい

module.exports = (robot) ->
  robot.hear /^やい$/i, (msg) ->
    msg.send "やい"
