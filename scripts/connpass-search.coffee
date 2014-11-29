# Description:
#   connpass検索
#
# Commands:
#   hubot connpass [keyword]

# 1日のマイクロ秒数
DAY = 1000 * 60 * 60  * 24
# 曜日
weekdays = ["日", "月", "火", "水", "木", "金", "土"]

# 数値を0で埋め、2桁にする
fill_zero = (num) ->
  str = '0' + num
  sliced = str.slice(-2)
  return sliced

# イベント開催期間を文字列に変換
format_period = (start, end) ->
  minute_st = fill_zero start.getMinutes()
  minute_ed = fill_zero end.getMinutes()
  month = start.getMonth() + 1
  weekday = weekdays[start.getDay()]

  period = "#{start.getFullYear()}/#{month}/#{start.getDate()}(#{weekday})" +
    " #{start.getHours()}:#{minute_st}〜#{end.getHours()}:#{minute_ed}"

# イベント1件を文字列に
format_event = (e) ->
  now = new Date
  end_date = new Date(e.ended_at)
  start_date = new Date(e.started_at)
  days_passed = Math.round((end_date.getTime() - now.getTime()) / DAY)

  # 過去のイベントは表示しない
  return null if days_passed < 0

  period = format_period(start_date, end_date)
  return "#{period} #{e.title}\n  #{e.event_url}\n"

# bot へのイベント登録
# APIリファレンス http://connpass.com/about/api/
module.exports = (robot) ->
  robot.respond /connpass (.*)$/, (msg) ->
    url = "http://connpass.com/api/v1/event/?order=2&count=3&keyword=" + msg.match[1]
    robot.http(url)
      .get() (err, res, body) ->
        data = JSON.parse(body)
        events_list = ""
        for event in data.events
          e = format_event event
          events_list += e if e != null
        msg.send events_list
