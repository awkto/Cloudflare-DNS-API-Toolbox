#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-email-id)
export CF_API_KEY=$(cat .cloudflare-token)

#NOTE : this adds the domain as type:SECONDARY under the FREE PLAN
curl -s -X POST -H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
    -H "Content-Type: application/json" \
    "https://api.cloudflare.com/client/v4/zones" \
    --data '{"account": {"id": "2099d679a66900a90bd05fbf0faf5469"}, "name":"'$1'","type":"secondary","plan": {"id": "0feeeeeeeeeeeeeeeeeeeeeeeeeeeeee", "name": "free"}}' \
    | jq .success


#    --data '{"account": {"id": "2099d679a66900a90bd05fbf0faf5469"}, "name":"'$1'","type":"secondary","plan": {"id": "94f3b7b768b0458b56d2cac4fe5ec0f9", "name": "Enterprise Website"}}'
#    --data '{"account": {"id": "2099d679a66900a90bd05fbf0faf5469"}, "name":"'$1'","type":"secondary"}}'

