#!/bin/bash

set -e

source /opt/ros/humble/setup.bash
source /ros_ws/peak_cam/install/setup.bash



exec "$@"