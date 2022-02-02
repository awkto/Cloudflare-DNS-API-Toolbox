#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-email-id)
export CF_API_KEY=$(cat .cloudflare-token)

#get domain IDs for zone \
domainID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$1" \
  -H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
  -H "Content-Type: application/json" |jq .result[].id -r) \

#check which primary masters are linked to zone \
curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$domainID/secondary_dns" \
    -H "X-Auth-Email: $CF_API_EMAIL" \
    -H "X-Auth-Key: $CF_API_KEY" \
    -H "Content-Type: application/json" \
    | jq '.result | {name,primaries}'


#    --data '{"id":"$domainID","name":"$1","primaries":["2c1daa50f50b40e685cfc47b5c920005","ecdc951a986344db9ee581543e559e06"],"auto_refresh_seconds":86400}'\


