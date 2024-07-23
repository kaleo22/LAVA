#!/bin/bash

set -e

source /opt/ros/humble/setup.bash
source /cali_ws/install/setup.bash

export ROS_DOMAIN_ID=10

export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export FASTRTPS_DEFAULT_PROFILES_FILE=/var/tmp/husarnet-fastdds-ds-client.xml
export DISCOVERY_SERVER_PORT=11888
husarnet-dds singleshot

exec "$@"
