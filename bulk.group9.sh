#!/bin/bash
#Step 01
#./loop-add-domains.sh ../domains.group9.txt | tee output.01-add-domains.group9.txt
#DONE

#Step 02
#./loop-link-primaries.sh ../domains.group9.txt | tee output.02-link-primaries.group9.txt
#DONE

#Step 03
#./loop-plan-to-enterprise.sh ../domains.group9.txt | tee output.03-plan-enterprise.group9.txt

#Step 04
#TBD

#Step 05
#Done already

#Step 06
./loop-add-cname-at-apex.sh ../domains.group9.apextargets | tee output.04-apex-alias.group9.txt

#Step 07
#TBD via GUI
