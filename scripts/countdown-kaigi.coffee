# Description:
#   浜松Ruby会議01開催までの日数を数える
#
# Commands:
#   hubot image me <query> - The Original. Queries Google Images for <query> and returns a random top result.

cronJob = require('cron').CronJob

kaigiDate = new Date "2015-03-28 09:00:00 +0900"

restDaysGreet = () ->
  now = new Date
  diff = kaigiDate.getTime() - now.getTime()
  days = parseInt(diff/(24*60*60*1000), 10)
  return nil if days < 0
  return "浜松Ruby会議まであと #{days}日です"

module.exports = (robot) ->
  # 定期実行
  cronjob = new cronJob('0 0 18 * * 6', () =>
    greet = restDaysGreet()
    envelope = room: "#kaigi01"
    robot.send envelope, greet
  )
  cronjob.start()

  # チャットへの返答でも答えられる
  robot.respond /浜松Ruby会議01$/, (msg) ->
    greet = restDaysGreet()
    if greet
      msg.send greet
