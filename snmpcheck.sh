#!/bin/bash

echo "SNMPGET"
#snmpget -v <laversion> -c <lacommunaute> <adresseip> <oid>
snmpget -v 2c -c public 192.168.100.14 iso.3.6.1.2.1.1.1.0

echo "-----------"

echo "SNMPWALK"
#snmpwalk -v <laversion> -c <lacommunaute> <adresseip> <oid>
snmpwalk -v 2c -c public 192.168.100.14

