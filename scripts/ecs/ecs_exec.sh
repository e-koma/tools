#!/bin/bash -e

env=feature01
command="/bin/sh"
lanch_type=FARGATE

cluster_name=$(aws ecs list-clusters | jq -rc '.clusterArns[]' | grep dev | grep game | awk -F/ '{ print $2 }')
service_name=$(aws ecs list-services --cluster "$cluster_name" --launch-type "$lanch_type" | jq -rc '.serviceArns[]' | grep "$env" | awk -F/ '{ print $3 }')
task_id=$(aws ecs list-tasks --cluster "${cluster_name}" --service-name "${service_name}" --max-items 1 | jq -r '.taskArns[]' |  awk -F/ '{ print $3 }')
container_name=$(aws ecs describe-tasks --cluster "$cluster_name" --tasks "$task_id" | jq -r '.tasks[].containers[].name' | grep app)

aws ecs execute-command \
  --cluster "${cluster_name}" \
  --task "${task_id}" \
  --container "${container_name}" \
  --command "${command}" \
  --interactive
