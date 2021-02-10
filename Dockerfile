FROM telegraf:1.17-alpine

RUN apk update && \
    apk upgrade && \
    apk add vnstat jq fail2ban && \
    sed -i '\#/var/run/fail2ban/fail2ban.sock#s#/var#/hostfs/var#' /etc/fail2ban/fail2ban.conf && \
    rm -rf /var/cache/apk/*

