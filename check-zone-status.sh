#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)

#Fetch the JSON of the entire zone, and filter out name, type, plan.name, plan.id
curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$1" \
     -H "X-Auth-Key: $CF_API_KEY"  \
     -H "X-Auth-Email: $CF_API_EMAIL" \
     -H "Content-Type: application/json" \
      | jq '.result[] | {name,type,status}'
