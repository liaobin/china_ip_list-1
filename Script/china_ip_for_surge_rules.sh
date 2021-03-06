#!/bin/bash

cd /root/china_ip_list/Surge/

CurrentDate=`date +%Y-%m-%d`
echo -e "// China IP" > china_ip_for_surge_rules.txt
echo -n "// Last update: " >> china_ip_for_surge_rules.txt
echo $CurrentDate >> china_ip_for_surge_rules.txt

sed 's/^/IP-CIDR,/g' /root/china_ip_list/china_ip_list > china_ip_for_surge_rules_temp.txt

sed 's/$/,DIRECT/g' china_ip_for_surge_rules_temp.txt >> china_ip_for_surge_rules.txt

rm -rf china_ip_for_surge_rules_temp.txt

mv china_ip_for_surge_rules.txt Rules.conf

/root/china_ip_list/Script/acl.sh
