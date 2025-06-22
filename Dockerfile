FROM alpine:latest

RUN apk update && apk add curl unzip bash && \
    curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip -d /tmp/xray && \
    install -m 755 /tmp/xray/xray /usr/local/bin/xray && \
    mkdir -p /etc/xray && \
    mv /tmp/xray/config.json /etc/xray/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
