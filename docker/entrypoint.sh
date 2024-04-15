#!/bin/bash

set -e

source /opt/ros/humble/setup.bash
source /peak_cam_docker/peak_cam/install/setup.bash



exec "$@"