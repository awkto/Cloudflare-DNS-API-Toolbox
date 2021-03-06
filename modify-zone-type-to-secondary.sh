#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)

domain=$1

#get domain IDs for zone \
domainID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$domain" \
	-H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
	-H "Content-Type: application/json" |jq .result[].id -r) \

curl -s -X PATCH "https://api.cloudflare.com/client/v4/zones/$domainID" \
	-H "X-Auth-Email: $CF_API_EMAIL" \
	-H "X-Auth-Key: $CF_API_KEY" \
	-H "Content-Type: application/json" \
	--data '{"type":"secondary"}' \
	| jq .
