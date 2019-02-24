# drone-dingding

test on drone 0.8.9

## Usage:

Put following lines in your .drone.yml

    pipeline:
      notify:
        image: wuyue/drone-dingding
        secrets: [DING_DING_WEBHOOK_URL]
      build:
        ....
      notify:
        image: wuyue/drone-dingding
        secrets: [DING_DING_WEBHOOK_URL]
        when:
          status: [success, failure]

Set dingding Incoming Webhook URL for notifications
 
    $ export DRONE_SERVER=https://www.test-drone.com
    $ export DRONE_TOKEN=<GET YOUR TOKEN AT https://www.test-drone.com/account>
    $ drone secret add --repository <your-repository> --image='wuyue/drone-dingding' --name DING_DING_WEBHOOK_URL --value https://oapi.dingtalk.com/robot/send?access_token=<your_access_token>

Base On: [drone-stack](https://github.com/songsterr/drone-slack)