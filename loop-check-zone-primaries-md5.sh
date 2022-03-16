#!/bin/bash
# NOTE : This script expects an argument, which should be a filename that contains a list of domains
#        Each domain in that list will be processed one at a time

domainlist=$1


echo "Target md5 for valid config is : 3b3b4d289cb543affbb0457e3acd09b0"

for domain in $(cat $domainlist);do \
	./check-zone-primaries-md5.sh $domain ; \
done

echo "Target md5 for valid config is : 3b3b4d289cb543affbb0457e3acd09b0"
