# Description:
#   LGTM画像を投稿
#
# Commands:
#   lgtm

module.exports = (robot) ->
  robot.hear /^lgtm$/i, (msg) ->
    msg.http("http://www.lgtm.in/g")
      .header('accept', 'application/json')
      .get() (err, res, body) ->
        lgtm = JSON.parse(body)
        msg.send(lgtm.imageUrl)
