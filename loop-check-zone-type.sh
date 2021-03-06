#!/bin/bash
# NOTE : This script expects an argument, which should be a filename that contains a list of domains
#        Each domain in that list will be processed one at a time
domainlist=$1

for domain in $(cat $domainlist);do \
	echo "Zone Type is " \
	$(
		./check-zone-type.sh $domain \
		| jq .type \
	) \
	" for domain "$domain ; \
done
