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

#Starts Cloudflare process to validate the zone again (checks authority and NS records at registrar)
curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zoneid/activation_check" \
	-H "X-Auth-Email: $CF_API_EMAIL" \
	-H "X-Auth-Key: $CF_API_KEY" \
	-H "Content-Type: application/json" \
	| jq .



