# Description:
#   浜松Ruby会議01開催までの日数を数える
#
# Commands:
#   hubot image me <query> - The Original. Queries Google Images for <query> and returns a random top result.

cronJob = require('cron').CronJob

module.exports = (robot) ->
  kaigiDate = new Date "2015-03-28 09:00:00 +0900"
  cronjob = new cronJob('0 0 9 * * 6', () =>
    envelope = room: "#debug"
    now = new Date
    diff = kaigiDate.getTime() - now.getTime()
    days = parseInt(diff/(24*60*60*1000), 10)
    robot.send envelope, "浜松Ruby会議まであと #{days}日じゃよ"
  )
  cronjob.start()
