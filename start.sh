#!/bin/sh
sudo cp ~/.abuild/*.pub /etc/apk/keys
abuild-apk update && abuild $@
