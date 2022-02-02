#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-email-id)
export CF_API_KEY=$(cat .cloudflare-token)

#for domain in $(cat domains.txt); do \
  curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$1" \
     -H "X-Auth-Key: $CF_API_KEY"  \
     -H "X-Auth-Email: $CF_API_EMAIL" \
     -H "Content-Type: application/json" \
      | jq '.result[] | {name,plan: .plan | {name,id}}'
