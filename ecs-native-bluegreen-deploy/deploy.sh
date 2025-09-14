#!/bin/bash
# 00_parameter
rain deploy 00_parameter.yml ecs-native-bluegreen-deploy-00-parameter -y --config ./params/00_parameter-params.yml

# 10_alb
rain deploy 10_alb.yml ecs-native-bluegreen-deploy-10-alb -y

# 20_ecs
rain deploy 20_ecs.yml ecs-native-bluegreen-deploy-20-ecs -y
