# Description:
#   put youtube movie that show コンコルド
#
# Commands:
#   hubot concorde me
module.exports = (robot) ->
  robot.respond /(コンコルド|concorde)( me)$/i, (msg) ->
    msg.send "https://www.youtube.com/watch?v=UYqS9os51gs"
