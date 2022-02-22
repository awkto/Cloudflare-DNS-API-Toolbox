#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)

#note : this adds the new domain as Primary type, under FREE PLAN
curl -s -X POST "https://api.cloudflare.com/client/v4/zones" \
	-H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
	-H "Content-Type: application/json" \
	--data '{"account": {"id": "2099d679a66900a90bd05fbf0faf5469"}, "name":"'$1'","type":"full","plan": {"id": "0feeeeeeeeeeeeeeeeeeeeeeeeeeeeee", "name": "free"}}' \
	| jq .
#    | jq .success
