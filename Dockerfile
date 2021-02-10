FROM telegraf:1.17-alpine

RUN apk update && \
    apk upgrade && \
    apk add vnstat jq fail2ban && \
    rm -rf /var/cache/apk/*

