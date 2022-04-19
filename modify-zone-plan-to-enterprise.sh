#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)


#get domain IDs for zone \
domainID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$1" \
  -H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
  -H "Content-Type: application/json" |jq .result[].id -r) \

curl -s -X PATCH "https://api.cloudflare.com/client/v4/zones/$domainID" \
     -H "X-Auth-Email: $CF_API_EMAIL" \
     -H "X-Auth-Key: $CF_API_KEY" \
     -H "Content-Type: application/json" \
     --data '{"plan":{"id":"94f3b7b768b0458b56d2cac4fe5ec0f9"}}' \
     | jq .
