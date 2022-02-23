#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)
domain=$1

#FIRST to get zone ID
zoneid=$(
		curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$domain" \
		  -H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
		  -H "Content-Type: application/json" \ |jq .result[].id -r
	)

#POST zones/:identifier/secondary_dns/force_axfr
curl -s -X POST "https://api.cloudflare.com/client/v4/zones/$zoneid/secondary_dns/force_axfr" \
	-H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
	-H "Content-Type: application/json" \
	| jq .

#    | jq .success


