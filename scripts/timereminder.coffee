cronJob = require('cron').CronJob

module.exports = (robot) ->

    cronjob = new cronJob(
      cronTime: '0 0 11 * * 1-5'
      start:    true
      timeZone: "Asia/Tokyo"
      onTick: ->
        robot.send {room: "#general"}, "Ohayo♡"
    )

    cronjob = new cronJob(
      cronTime: '0 0 20 * * 1-5'
      start:    true
      timeZone: "Asia/Tokyo"
      onTick: ->
        robot.send {room: "#general"}, "Sayonara♡"
    )
