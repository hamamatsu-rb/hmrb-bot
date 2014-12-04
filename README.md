[![Build Status](https://travis-ci.org/misogi/hmrb-bot.svg?branch=master)](https://travis-ci.org/misogi/hmrb-bot)

# 浜松Ruby bot

浜松 Ruby チャット(現在はSlack)に生息するbotです。

# 使ってみよう

## できること

以下の切っ掛けで、hubot に何か言わせたり、何かさせたり出来ます。

- チャットに単語が登場したとき
- bot 宛にメンションがあったとき
- webhook が叩かれたとき（たぶん）

できることは

- coffeescript(JS)でできる事
- Redis でデータを覚えておく

## 動かす

node, npm のインストールが必要です。

```
brew install node
npm install
```

ローカルで動かすことが出来ます。

    bin/hubot

## 作ってみましょう

scripts/ 以下に .coffee ファイルを作成します。
他のスクリプトを参考にしましょう。

スクリプト作りの参考はこちら
https://github.com/github/hubot/blob/master/docs/scripting.md

## デプロイ

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

参考:
http://nanapi.co.jp/blog/2014/06/04/slack_with_hubot/

Slack 側で、Integration(外部連携)の登録をします。

Slack 側で、トークンが発行されるので、環境変数として heroku 側に登録します。
