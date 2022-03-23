#!/bin/bash
# NOTE : This script expects an argument, which should be a filename that contains a list of domains
#        Each domain in that list will be processed one at a time

domainlist=$1

for domainpair in $(cat $domainlist);do \
	domain=$(echo $domainpair | awk -F, {'print $1'}); \
	apextarget=$(echo $domainpair | awk -F, {'print $2'}); \
	echo "Domain is $domain and Target is $apextarget" ; \
	./add-cname-at-apex.sh $domain $apextarget ; \
done
