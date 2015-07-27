FROM alpine

ENV PACKAGER_PRIVKEY /builder/abuild.rsa
ENV REPODEST /packages
ENV PACKAGER Glider Labs <team@gliderlabs.com>

VOLUME ["/package"]
RUN apk -U add alpine-sdk \
  && adduser -G abuild -g "Alpine Package Builder" -s /bin/sh -D builder \
  && echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  && rm -rf /var/cache/apk/* \
  && sudo mkdir /packages \
  && sudo chown -R builder /package /packages

USER builder

WORKDIR /package

COPY start.sh /
ENTRYPOINT ["/start.sh"]
