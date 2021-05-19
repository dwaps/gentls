#!/bin/bash

rm -rfv ssl 2>&1 > /dev/null
if [ ! -f "ssl" ]; then mkdir ssl; fi
[[ "${#1}" < 3 ]] && \
echo "The first argument (name of files) must contain at least 2 letters!" && rmdir ssl && \
exit 1
touch ssl/.gitkeep
openssl req -x509 -sha256 -newkey rsa:2048 -days 3650 -nodes -out ssl/$1.crt -keyout ssl/$1.key