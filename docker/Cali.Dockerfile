FROM osrf/ros:melodic-desktop
ARG ROS_PYTHON_VERSION=3

SHELL [ "bin/bash", "-c" ]


#install build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions
    RUN mkdir -p /cali_ws 
    RUN git clone https://github.com/AprilRobotics/apriltag.git \
        && mv peak_cam/ cali_ws/peak_cam
    RUN apt-get install -y python3-rosdep
    RUN rosdep update \
        && rosdep install --from-paths ros_ws/peak_cam/src --ignore-src -y --rosdistro=melodic
    RUN apt-get install -y ros-melodic-apriltag \
        && apt update && apt upgrade \
        && source /opt/ros/melodic/setup.bash \
        && colcon build --symlink-install
    

#Set up the entrypoint
COPY ./docker/entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "bash" ]