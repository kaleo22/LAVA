#!/bin/bash

set -e

source /opt/ros/humble/setup.bash
source /cali_ws/install/setup.bash

exec "$@"
