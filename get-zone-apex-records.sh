#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)

domain=$1



#first get zone id
export zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$domain" \
  -H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
  -H "Content-Type: application/json" \ |jq .result[].id -r)


#fetch all DNS records for a zone
curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zoneid/dns_records?name=$domain" \
	-H "X-Auth-Key: $CF_API_KEY"  \
	-H "X-Auth-Email: $CF_API_EMAIL" \
	-H "Content-Type: application/json" \
	| jq .

