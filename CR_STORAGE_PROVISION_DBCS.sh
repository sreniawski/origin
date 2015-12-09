# !/bin/sh
#
curl -v -H GET -H 'X-Storage-User: Storage-metcsgse00382:cloud.admin' -H 'X-Storage-Pass: latinCzech+1' https://metcsgse00382.storage.oraclecloud.com/auth/v1.0 &> auth01.txt

awk '/X-Auth-Token:/{b=$3}END{print b}' auth01.txt

auth01="'X-Auth_Token: $(awk '/X-Auth-Token:/{b=$3}END{print b}' auth01.txt)'"

echo $auth01
echo "curl -i  https://storage.us2.oraclecloud.com/v1/Storage-metcsgse00382/DBCScontainer -X PUT -H ‘Content-Length: 0’ -H ${auth01}" > ./list1.sh

echo "curl -i  https://storage.us2.oraclecloud.com/v1/Storage-metcsgse00382/JCScontainer -X PUT -H ‘Content-Length: 0’ -H ${auth01}" >> ./list1.sh

echo "curl -i  https://storage.us2.oraclecloud.com/v1/Storage-metcsgse00382 -X GET -H ${auth01}" >> ./list1.sh


chmod 744 ./list1.sh
./list1.sh

sleep 100


curl -i -X POST -u cloud.admin:latinCzech+1 -d @DBCS_Provision.json -H "X-ID-TENANT-NAME: metcsgse00382" -H "Content-Type:application/json" https://dbaas.oraclecloud.com/jaas/db/api/v1.1/instances/metcsgse00382
