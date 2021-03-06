#!/bin/bash
# NOTE : This script expects an argument, which should be a filename that contains a list of domains
#        Each domain in that list will be processed one at a time
domainlist=$1

for domain in $(cat $domainlist);do \
	echo "Domain Plan is "$(./check-zone-plan.sh $domain | jq .plan.name)" for domain : "$domain; \
done
