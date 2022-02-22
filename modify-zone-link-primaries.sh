#!/bin/bash
export CF_API_EMAIL=$(cat .cloudflare-id)
export CF_API_KEY=$(cat .cloudflare-token)
export accountid=$(cat .accountid)

#add each domain in domains.txt
#  curl -s -X POST -H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
#    -H "Content-Type: application/json" \
#    "https://api.cloudflare.com/client/v4/zones" \
#    --data '{"account": {"id": "2099d679a66900a90bd05fbf0faf5469"}, "name":"'$domain'","type":"secondary","plan": {"id": "94f3b7b768b0458b56d2cac4fe5ec0f9", "name": "Enterprise Website"}}' \;
# \

#get domain IDs for zone \
domainID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name=$1" \
	-H "X-Auth-Key: $CF_API_KEY" -H "X-Auth-Email: $CF_API_EMAIL" \
	-H "Content-Type: application/json" |jq .result[].id -r) \


#link CSC primaries to secondary DNS config for each zone \
curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$domainID/secondary_dns" \
	-H "X-Auth-Email: $CF_API_EMAIL" \
	-H "X-Auth-Key: $CF_API_KEY" \
	-H "Content-Type: application/json" \
	--data '{"id":"$domainID","name":"$1","primaries":["2c1daa50f50b40e685cfc47b5c920005","ecdc951a986344db9ee581543e559e06"],"auto_refresh_seconds":86400}'\
	| jq .

