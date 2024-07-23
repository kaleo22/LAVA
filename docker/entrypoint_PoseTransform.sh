#!/bin/bash

set -e

source /opt/ros/foxy/setup.bash
source /pose_transform/install/setup.bash



export ROS_DOMAIN_ID=10

exec "$@"