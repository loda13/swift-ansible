#!/bin/bash
Url=`grep "X-Storage-Url:" /disk1/swift.txt |awk '{print $3}'`
Token=`grep "X-Auth-Token:" /disk1/swift.txt |awk '{print $3}'`
acl="/ACLcontainer"
doc="/docContainer"

Url=${Url%$'\r'}
echo ${Url}

curl -i ${Url}${acl} -X PUT -H "X-Container-Meta-Author: pulicContrainerList" -H "X-Container-Read: .r:*,.rlistings" -H "X-Auth-Token:${Token}"

curl -i ${Url}${acl} -X PUT -H "X-Container-Meta-Author: pulicContrainerList" -H "X-Container-Read: .r:*,.rlistings" -H "X-Auth-Token:${Token}"
