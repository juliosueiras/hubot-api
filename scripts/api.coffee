# Description:
#   API Call Util for UnivJobs
#
# Dependencies:
#   "hubot-slack": "4.0.1"
#
# Configuration:
#   None
# 
# Commands:
#   hubot get api/<api endpoint> <any parameters (e.g. name=juliosueiras)> - API Call to UnivJobs using GET method
#   hubot post api/<api endpoint> <any data (pass as json)> - API Call to UnivJobs using POST method
#
# Author:
#   juliosueiras

module.exports = (robot) ->

  robot.respond /get (.*)/i, (msg) ->
    console.log(msg.match)
    msg.http("https://eoymxx-univjobs-back-staging-univjobs.runnableapp.com/#{msg.match[1]}/")
      .header('Content-Type', 'application/json')
      .get() (err, result, body) ->
        if(err)
          console.log(err)
          msg.send err
          return

        msg.send "https://eoymxx-univjobs-back-staging-univjobs.runnableapp.com/#{msg.match[1]}"
        msg.send "```\n#{body}```"
        return

  robot.respond /post (.*) {(.*)}/i, (msg) ->
    console.log(msg.match)
    msg.http("https://eoymxx-univjobs-back-staging-univjobs.runnableapp.com/#{msg.match[1]}/")
      .header('Content-Type', 'application/json')
      .post("{#{msg.match[2]}}") (err, result, body) ->
        if(err)
          console.log(err)
          msg.send err
          return

        msg.send "https://eoymxx-univjobs-back-staging-univjobs.runnableapp.com/#{msg.match[1]} with #{msg.match[2]}"
        body = JSON.stringify(JSON.parse(body),null,2);  

        msg.send "```\n#{body}```"
        return
