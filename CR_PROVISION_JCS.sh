# !/bin/sh
#

curl -i -X POST -u oracle:welcome1 -d @JCS_Provision.json -H "Content-Type:application/vnd.com.oracle.oracloud.provisioning.Service+json" -H "X-ID-TENANT-NAME:metcsgse00382" https://jaas.oraclecloud.com/jaas/api/v1.1/instances/metcsgse00382
