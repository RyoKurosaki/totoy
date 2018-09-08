# Description:
#   Test
#
# Commands:
#   hubot hello - Say "Hi"

module.exports = (robot) ->
    robot.hear /HELLO$/i, (msg) ->
        msg.send "Hi #{msg.message.user.name}-san"

    robot.hear /who is handsome\?$/i, (msg) ->
        msg.send "Ryo! absolutely."

    robot.hear /uncle$/i, (msg) ->
        msg.send "Jong!"

    robot.hear /baby$/i, (msg) ->
        msg.send "Jhon!"

    robot.hear /hitoshi$/i, (msg) ->
        msg.send "Kawaii♡"
