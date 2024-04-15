ARG ROS_DISTRO=humble

ARG FROM_IMAGE=osrf/ros:${ROS_DISTRO}
FROM ${FROM_IMAGE}
ENV ROS_DISTRO=$ROS_DISTRO
ENV ROS_VERSION=2 \
    ROS_PYTHON_VERSION=3
SHELL [ "bin/bash", "-c" ]


#install build tools
RUN apt-get update && apt-get install -y \
      python3-colcon-common-extensions && \
    rm -rf /var/lib/apt/lists/*

#clone source
ARG ROS2_BRANCH=peak_cam
ARG ROS_REPO=git@github.com:kaleo22/peak_cam.git
RUN git clone ${ROS_REPO} -b ${ROS2_BRANCH} \
    && vcs import src < ros2/ros2.repos

#install dependencies
RUN apt-get update && rosdep install -y \
    --from-paths src \
    --ignore-src \
    --skip-keys " \
        fastcdr \
        rti-connext-dds-6.0.1 \
        urdfdom_headers" \
    && rm -rf /var/lib/apt/lists/*

#build source
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
