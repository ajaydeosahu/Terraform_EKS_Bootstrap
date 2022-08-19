#!/bin/bash
aws ec2 authorize-security-group-ingress --group-id ${MOUNT_TARGET_GROUP_ID} --protocol tcp --port 2049 --cidr ${CIDR_BLOCK}
SUBNETS=${subnets}
export IFS=',' 
for subnet in $SUBNETS
do
    echo "creating mount target in" $subnet
    aws efs create-mount-target --file-system-id ${FILE_SYSTEM_ID} --subnet-id $subnet --security-groups ${MOUNT_TARGET_GROUP_ID}
done