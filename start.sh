#!/bin/sh
# Copy Keys
sudo cp ~/.abuild/*.pub /etc/apk/keys

# Copy Package to build dir
cp -R /package/* /build
abuild-apk update && abuild $@
