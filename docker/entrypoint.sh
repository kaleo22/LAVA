#!/bin/bash

set -e

source /opt/ros/humble/setup.bash
source /ros_ws/peak_cam/install/setup.bash


export ROS_DOMAIN_ID=10


exec "$@"