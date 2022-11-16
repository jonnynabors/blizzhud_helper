FROM alpine:latest

RUN apk add curl zip

COPY libs libs/
COPY embeds.xml BlizzHUD* .