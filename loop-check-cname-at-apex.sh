#!/bin/bash
# NOTE : This script expects an argument, which should be a filename that contains a list of domains
#        Each domain in that list will be processed one at a time

domainlist=$1

echo "Note : Please be patient, the complete output will be shown all at once in order to format into columns"

for domain in $(cat $domainlist);do \
#	./get-zone-apex-records-of-type.sh $domain $apextarget ; \
#	./get-zone-records-of-type.sh $domain ; \
#	./get-zone-apex-records.sh $domain | jq '.[] | {type, content}'
#	./get-zone-apex-cname-records.sh $domain |jq .[].content;\
	cloudflaretarget=$(./get-zone-apex-cname-records.sh $domain | jq -r .content); \
	echo -e "Domain : $domain \t\t Target : $cloudflaretarget"  ;\
#	echo "  CSC Ultra  ApexAlias = $apextarget"; \
#	echo "  Cloudflare ApexAlias = $cloudflaretarget"; \
#	echo " "; \
done | column -t
