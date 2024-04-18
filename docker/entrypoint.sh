#!/bin/bash

set -e

source /opt/ros/humble/setup.bash
source /ros_ws/peak_cam/install/setup.bash
ros2 run ros1_bridge dynamic_bridge --bridge-all-topics




exec "$@"