#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)
export domain=$1

export zoneID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$domain" \
  -H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
  -H "Content-Type: application/json" \ |jq .result[].id -r)

#echo "zone id is "$zoneID

curl -s -X DELETE "https://api.cloudflare.com/client/v4/zones/$zoneID" \
	-H "X-Auth-Email: $CF_API_EMAIL" \
	-H "X-Auth-Key: $CF_API_KEY" \
	-H "Content-Type: application/json" \
	| jq .
#     | jq .success


