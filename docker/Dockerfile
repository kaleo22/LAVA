FROM osrf/ros:humble-desktop
ARG ROS_PYTHON_VERSION=3

SHELL [ "bin/bash", "-c" ]


#install build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions
#     rm -rf /var/lib/apt/lists/
RUN git clone https://github.com/kaleo22/peak_cam.git
RUN apt-get install -y python3-rosdep
RUN rosdep update \
    && rosdep install --from-paths peak_cam/src --ignore-src -y --rosdistro=humble
RUN colcon build
#install dependencies
#RUN apt-get update \
#    && rm -rf /var/lib/apt/lists/*

#build source
#RUN mkdir -p /peak_cam/src
WORKDIR /~/peak_cam


#    && rosdep update/*
#
#RUN /bin/bash -c "source /opt/ros/humble/setup.sh && colcon build"
#ENV SHELL /bin/bash
# Use Cyclone DDS as middleware
#RUN apt-get update && apt-get install -y --no-install-recommends \
 #ros-humble-rmw-cyclonedds-cpp
#ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp


################################################
# Overlay Image for ROS HUMBLE IDS PEAK DRIVER #
################################################
#FROM base AS overlay
 

# Create an overlay Colcon workspace
#RUN mkdir -p /peak_cam/src
#WORKDIR /peak_cam

#COPY ./peak_cam/ ./src/peak_cam_node.cpp/
#COPY ./peak_cam ./params/settings/cam1.yaml
#COPY ./peak_cam ./params/settings/cam2.yaml
#COPY ./peak_cam ./params/settings/cam3.yaml
#COPY ./peak_cam ./params/settings/cam4.yaml
#COPY ./peak_cam ./params/intrinsics/default_camera_info.yaml
#COPY ./peak_cam ./launch/peak_cam.launch.py
#RUN source /peak_cam_docker/install/setup.bash \
# #&& rosdep install --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} -y \
# #&& colcon build --symlink-install
# 
# Set up the entrypoint
COPY ./docker/entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "bash" ]
