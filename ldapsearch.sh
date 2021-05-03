#!/bin/bash

UserArray=()
HarvList=($(ldapsearch -x -LLL -b "ou=,dc=,dc=" "(&(cn=)(qclisttype=list))" member -H 'ldap://' | grep -i 'member:' | cut -d ',' -f 1 | cut -d '=' -f 2))

for i in "${HarvList[@]}" do
count=$(mysql -S ${SQLServer} -U ${dbuser} -P ${dbpass} -e "SELECT COUNT (Username) From dbo.<> Where Username='${i}';")
  
  if [[ "$count" > 0 ]] then
  
  else
  
  fi


done

