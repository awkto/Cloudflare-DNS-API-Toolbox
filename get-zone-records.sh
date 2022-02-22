#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)

#first get zone id
export zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$1" \
  -H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
  -H "Content-Type: application/json" \ |jq .result[].id -r)

#for domain in $(cat domains.txt); do \
curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zoneid/dns_records" \
	-H "X-Auth-Key: $CF_API_KEY"  \
	-H "X-Auth-Email: $CF_API_EMAIL" \
	-H "Content-Type: application/json" \
	| jq .
