
module.exports = (robot) ->
  robot.respond /(コンコルド|concorde)( me)$/i, (msg) ->
    msg.send "https://www.youtube.com/watch?v=UYqS9os51gs"
