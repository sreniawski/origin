# !/bin/sh
#
curl -v -H GET -H 'X-Storage-User: Storage-metcsgse00382:testuser1' -H 'X-Storage-Pass: password' https://metcsgse00382.storage.oraclecloud.com/v1 &> auth01.txt

awk '/X-Auth-Token:/{b=$3}END{print b}' auth01.txt

auth01="'X-Auth_Token: $(awk '/X-Auth-Token:/{b=$3}END{print b}' auth01.txt)'"

echo $auth01
echo "curl -i  https://metcsgse00382.storage.oraclecloud.com/v1/Storage-metcsgse00382/DBCScontainer -X PUT -H ‘Content-Length: 0’ -H ${auth01}" > ./list1.sh

echo "curl -i  https://metcsgse00382.storage.oraclecloud.com/v1/Storage-metcsgse00382/JCScontainer -X PUT -H ‘Content-Length: 0’ -H ${auth01}" >> ./list1.sh

echo "curl -i  https://metcsgse00382.storage.oraclecloud.com/v1/Storage-metcsgse00382 -X GET -H ${auth01}" >> ./list1.sh


chmod 744 ./list1.sh
./list1.sh

sleep 100


curl -i -X POST -u oracle:welcome1 -d @DBCS_Provision.json -H "X-ID-TENANT-NAME: metcsgse00382" -H "Content-Type:application/json" https://dbaas.oraclecloud.com/jaas/db/api/v1.1/instances/metcsgse00382
