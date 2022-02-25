#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)

domain=$1

#get zone object as a json. only includes ZONE object, not the DNS RECORDS
curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$domain" \
	-H "X-Auth-Key: $CF_API_KEY"  \
	-H "X-Auth-Email: $CF_API_EMAIL" \
	-H "Content-Type: application/json" \
	| jq .
