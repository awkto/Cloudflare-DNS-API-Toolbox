#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)

domain=$1
record=$3.$1
value=$4
type=$2

#FIRST GET ZONE IDENTIFIER
domainid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$1" \
	-H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
	-H "Content-Type: application/json" \
	| jq .result[].id -r)

echo $domainid


curl -s POST "https://api.cloudflare.com/client/v4/zones/b691901c63c5699abb33783c483fd01c/dns_records" \
	-H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
	-H "Content-Type: application/json" \
	--data '{"type":"'$type'","name":"'$record'","content":"'$value'","ttl":3600,"priority":10,"proxied":false}' \
	| jq .

#	| jq .success
