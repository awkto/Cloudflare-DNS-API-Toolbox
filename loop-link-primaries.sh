#!/bin/bash
# NOTE : This script expects an argument, which should be a filename that contains a list of domains
#        Each domain in that list will be processed one at a time

for i in $(cat $1);do \
	./modify-zone-link-primaries.sh $i; \
done
