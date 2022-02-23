#!/bin/bash

#MD5 for Cloudflare and CSC  (target)
#0617414fee3e217474d496dc7ac9104a

#MD5 for just Cloudflare
#b590d63fe8f2a16b2c826512e8c27f41

domainlist=$1
resolver=$2

for domain in $(cat $domainlist );do \
	echo "Checking NS for domain "$domain;
	echo "----------------------------------";
	dig NS +short $domain @$resolver | sort;
	echo "----------------------------------";
done
