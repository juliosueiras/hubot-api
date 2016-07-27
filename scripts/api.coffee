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
#   hubot api get <api endpoint> <any parameters (e.g. name=juliosueiras)> - API Call to UnivJobs using GET method
#   hubot api post <api endpoint> <any data (pass as json)> - API Call to UnivJobs using POST method
#
# Author:
#   juliosueiras

module.exports = (robot) ->

  robot.hear /hubot api get (.*)/i, (res) ->
    console.log(res.match)
    robot.http("https://eoymxx-univjobs-back-staging-univjobs.runnableapp.com/api/#{res.match[1]}/")
      .header('Content-Type', 'application/json')
      .get() (err, result, body) ->
        if(err)
          console.log(err)
          res.send err
          return

        res.send "https://eoymxx-univjobs-back-staging-univjobs.runnableapp.com/api/#{res.match[1]}"
        res.send "```\n#{body}```"
        return

  robot.hear /hubot api post (.*) {(.*)}/i, (res) ->
    console.log(res.match)
    robot.http("https://eoymxx-univjobs-back-staging-univjobs.runnableapp.com/api/#{res.match[1]}/")
      .header('Content-Type', 'application/json')
      .post("{#{res.match[2]}}") (err, result, body) ->
        if(err)
          console.log(err)
          res.send err
          return

        res.send "https://eoymxx-univjobs-back-staging-univjobs.runnableapp.com/api/#{res.match[1]} with #{res.match[2]}"
        body = JSON.stringify(JSON.parse(body),null,2);  

        res.send "```\n#{body}```"
        return
