#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)

domain=$1
record=$1
value=$2

#Get zone ID and save in var
domainid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$1" \
        -H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
        -H "Content-Type: application/json" \
        | jq .result[].id -r)

#Call rest API to create APEX CNAME
curl -s POST "https://api.cloudflare.com/client/v4/zones/$domainid/dns_records" \
        -H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
        -H "Content-Type: application/json" \
        --data '{"type":"cname","name":"'$record'","content":"'$value'","ttl":3600,"priority":10,"proxied":false}' \
        | jq .

