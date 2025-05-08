FROM alpine:3.18

RUN apk add --no-cache curl bash helm kubectl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]