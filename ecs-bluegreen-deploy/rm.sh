#!/bin/bash
# 30_code_pipeline
rain rm ecs-bluegreen-30-code-pipeline -y --experimental
rm ./config/task_definition.json
rm ./config.zip

# 20_ecs
rain rm ecs-bluegreen-deploy-20-ecs -y
rm ./userdata.sh

# 10_alb
rain rm ecs-bluegreen-deploy-10-alb -y

# 00_parameter
rain rm ecs-bluegreen-deploy-00-parameter -y
