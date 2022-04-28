#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)
export CF_ACCOUNT_ID=$(cat .accountid)

#NOTE : this adds the domain as type:SECONDARY under the FREE PLAN
curl -s -X POST "https://api.cloudflare.com/client/v4/zones" \
	-H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
	-H "Content-Type: application/json" \
	--data '{"account": {"id": "'$CF_ACCOUNT_ID'"}, "name":"'$1'","type":"secondary","plan": {"id": "0feeeeeeeeeeeeeeeeeeeeeeeeeeeeee", "name": "free"}}' \
	| jq .
#	| jq .success

