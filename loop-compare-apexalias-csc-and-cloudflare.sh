#!/bin/bash
# NOTE : This script expects an argument, which should be a filename that contains a list of domains
#        Each domain in that list will be processed one at a time

domainlist=$1

for domainpair in $(cat $domainlist | grep -v \#);do \
	domain=$(echo $domainpair | awk -F, {'print $1'}); \
	apextarget=$(echo $domainpair | awk -F, {'print $2'}); \
#	./get-zone-apex-records-of-type.sh $domain $apextarget ; \
#	./get-zone-records-of-type.sh $domain ; \
#	./get-zone-apex-records.sh $domain | jq '.[] | {type, content}'
#	./get-zone-apex-cname-records.sh $domain |jq .[].content;\
	cloudflaretarget=$(./get-zone-apex-cname-records.sh $domain | jq -r .content); \
	echo "Domain : $domain" ;\
	echo "  CSC Ultra  ApexAlias = $apextarget"; \
	echo "  Cloudflare ApexAlias = $cloudflaretarget"; \
	echo " "; \
done
