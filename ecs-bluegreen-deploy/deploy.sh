#!/bin/bash
# 00_parameter
rain deploy 00_parameter.yml ecs-bluegreen-deploy-00-parameter -y --config ./params/00_parameter-params.yml

# 10_alb
rain deploy 10_alb.yml ecs-bluegreen-deploy-10-alb -y

# 20_ecs
# ユーザデータの作成
export cluster_name=sample-ecs-cluster
cat ./template/userdata.sh.template | envsubst > ./userdata.sh
rain deploy 20_ecs.yml ecs-bluegreen-deploy-20-ecs -y

# 30_code_pipeline
# S3アップロード用リソース作成
export MSYS2_ARG_CONV_EXCL="*" # GitBashで "/" がパス変換されてしまうのを抑止
export task_role=$(aws ssm get-parameter --name "/ecs-bluegreen-deploy/IAMRoleEcsTaskArn" --with-decryption --query "Parameter.Value" --output text)
export task_execution_role=$(aws ssm get-parameter --name "/ecs-bluegreen-deploy/IAMRoleEcsTaskExecutionArn" --with-decryption --query "Parameter.Value" --output text)
cat ./template/task_definition.json.template | envsubst > ./config/task_definition.json
cd config
zip -r ../config.zip .
cd ..

rain deploy 30_code_pipeline.yml ecs-bluegreen-30-code-pipeline -y --experimental
