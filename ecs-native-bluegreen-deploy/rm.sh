#!/bin/bash
# 20_ecs
rain rm ecs-native-bluegreen-deploy-20-ecs -y

# 10_alb
rain rm ecs-native-bluegreen-deploy-10-alb -y

# 00_parameter
rain rm ecs-native-bluegreen-deploy-00-parameter -y