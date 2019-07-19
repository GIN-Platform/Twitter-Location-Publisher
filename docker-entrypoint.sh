#!/bin/bash
set -e

echo "${@}" | base64 -d > /root/.twurlrc
curl ipinfo.io > ipinfo

COUNTRY=$(cat ipinfo | jq -r '.country')
REGION=$(cat ipinfo | jq -r '.region')
CITY=$(cat ipinfo | jq -r '.city')

echo "${CITY} (${REGION}, ${COUNTRY})"
twurl -d "status=A new job ran in ${CITY} (${REGION}, ${COUNTRY}) ~ $(date)" /1.1/statuses/update.json