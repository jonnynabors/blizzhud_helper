FROM alpine:latest

RUN apk add curl zip

COPY libs/ embeds.xml BlizzHUD* .