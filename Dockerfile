FROM alpine

ENV REPODEST /packages
ENV PACKAGER Glider Labs <team@gliderlabs.com>

VOLUME ["/package"]
RUN apk -U add alpine-sdk \
  && adduser -G abuild -g "Alpine Package Builder" -s /bin/sh -D builder \
  && echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  && rm -rf /var/cache/apk/* \
  && sudo mkdir /packages /build \
  && sudo chown -R builder /package /packages /build

USER builder

WORKDIR /build

COPY start.sh /
ENTRYPOINT ["/start.sh"]
