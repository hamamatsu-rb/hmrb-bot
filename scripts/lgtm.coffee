# Description:
#   LGTM画像を投稿
#
# Commands:
#   lgtm

# DOM検索 参考:
# http://liginc.co.jp/programmer/archives/4848
cheerio = require('cheerio')

module.exports = (robot) ->
  robot.hear /^lgtm$/i, (msg) ->
    msg.http("http://www.lgtm.in/g")
      .get() (err, res, body) ->
        $ = cheerio.load(body)
        msg.send $('#imageUrl').val()
