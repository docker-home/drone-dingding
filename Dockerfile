FROM alpine:3.5

RUN apk add --no-cache curl

ADD enterpoint.sh /bin/
RUN chmod +x /bin/enterpoint.sh
ENTRYPOINT /bin/enterpoint.sh