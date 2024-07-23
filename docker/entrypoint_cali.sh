#!/bin/bash

set -e

source /opt/ros/humble/setup.bash
source /cali_ws/install/setup.bash

export ROS_DOMAIN_ID=10

exec "$@"
