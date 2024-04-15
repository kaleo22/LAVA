ARG ROS_DISTRO=humble

FROM osrf/ros:${ROS_DISTRO} as base
ENV ROS_DISTRO=${ROS_DISTRO}
SHELL [ "bin/bash", "-c" ]

RUN mkdir -p /peak_cam/src
WORKDIR /peak_cam/src
COPY peak_cam_docker peak_cam_docker/
RUN cd peak_cam_docker
COPY peak_cam_docker/docker/entrypoint.sh / 

WORKDIR /peak_cam
RUN source /opt/ros/humble/setup.bash \
    && apt-get update -y \
    && rosdep install --from-paths src --ignore-src --rosdi \
    && colcon build --symlink-install
ENV SHELL /bin/bash
# Use Cyclone DDS as middleware
RUN apt-get update && apt-get install -y --no-install-recommends \
 ros-${ROS_DISTRO}-rmw-cyclonedds-cpp
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp


################################################
# Overlay Image for ROS HUMBLE IDS PEAK DRIVER #
################################################
FROM base AS overlay
 

# Create an overlay Colcon workspace
RUN mkdir -p /peak_cam/src
WORKDIR /peak_cam
C
COPY ./peak_cam/ ./src/peak_cam_node.cpp/
COPY ./peak_cam ./params/settings/cam1.yaml
COPY ./peak_cam ./params/settings/cam2.yaml
COPY .peak_cam ./params/settings/cam3.yaml
COPY .peak_cam ./params/settings/cam4.yaml
COPY .peak_cam ./params/intrinsics/default_camera_info.yaml
COPY peak_cam ./launch/peak_cam.launch.py
RUN source /peak_cam_docker/install/setup.bash \
 && rosdep install --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} -y \
 && colcon build --symlink-install
 
# Set up the entrypoint
COPY ./docker/entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
