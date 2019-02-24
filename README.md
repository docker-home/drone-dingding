# drone-dingding

## Usage:

Put following lines in your .drone.yml

    pipeline:
      notify:
        image: wuyue/drone-dingding
      build:
        ....
      notify:
        image: wuyue/drone-dingding
        when:
          status: [ success, failure ]

Set dingding Incoming Webhook URL for notifications
 
    $ export DRONE_SERVER=https://www.test-drone.com
    $ export DRONE_TOKEN=<GET YOUR TOKEN AT https://www.test-drone.com/account>
    $ drone org secret add --skip-verify=true --image='wuyue/drone-dingding' wuyue DING_DING_WEBHOOK_URL https://oapi.dingtalk.com/robot/send?access_token=<your_access_token>

Base On: [drone-stack](https://github.com/songsterr/drone-slack)