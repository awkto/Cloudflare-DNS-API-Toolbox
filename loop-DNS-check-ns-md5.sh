#!/bin/bash

#MD5 for Cloudflare and CSC NS records (target)
#0617414fee3e217474d496dc7ac9104a

#MD5 for just Cloudflare NS records
#b590d63fe8f2a16b2c826512e8c27f41

domainlist=$1
resolver=$2

for domain in $(cat $domainlist );do \
	echo "NS record MD5sum is " \
	$(dig NS +short $domain @$resolver \
		|sort \
		|md5sum
	) \
	" for domain : " \
	$domain ;
done
