FROM osrf/ros:noetic-desktop
FROM osrf/ros:humble-desktop
ARG ROS_PYTHON_VERSION=3

SHELL [ "bin/bash", "-c" ]


#install build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions
#     rm -rf /var/lib/apt/lists/

# RUN apt-get install -y libqt5multimedia5 \ 
#     && apt-get install -y libqt5multimedia5 \
#     && apt-get install -y qml-module-qtquick-window2 \
#     && apt-get install -y qml-module-qtquick2 \
#     && apt-get install -y qml-module-qtquick-dialogs \
#     && apt-get install -y qml-module-qtquick-controls \
#     && apt-get install -y qml-module-qtquick-layouts \
#     && apt-get install -y qml-module-qt-labs-settings \
#     && apt-get install -y qml-module-qt-labs-folderlistmodel \
#     && apt-get install -y udev \
#     #&& dpkg -i ros_ws/peak_cam/peak_driver/ids-peak_2.9.0.0-48_amd64.deb 
#     && sudo apt update \
#     && apt-get install -y git \
#     && mkdir -p /ros1_bridge/src \
#     && cd /ros1_bridge/src \ 
#     && git clone https://github.com/ros2/ros1_bridge \
#     && cd /ros1_bridge \
#     && apt-get install -y python3-rosdep \
#     && rosdep update \
#     && rosdep install --from-paths ros1_bridge/src --ignore-src -y --rosdistro=noetic \
#     && apt-get install -y ros-humble-rmw \
#     && source /opt/ros/noetic/setup.bash \
#     && colcon build --symlink-install --cmake-force-configure

#test
RUN apt-get install -y libqt5multimedia5 
RUN apt-get install -y qml-module-qtquick-window2 
RUN apt-get install -y qml-module-qtquick2 
RUN apt-get install -y qml-module-qtquick-dialogs 
RUN apt-get install -y qml-module-qtquick-controls 
RUN apt-get install -y qml-module-qtquick-layouts 
RUN apt-get install -y qml-module-qt-labs-settings 
RUN apt-get install -y qml-module-qt-labs-folderlistmodel 
RUN apt-get install -y udev 
#RUN dpkg -i ros_ws/peak_cam/peak_driver/ids-peak_2.9.0.0-48_amd64.deb 
RUN sudo apt update 
RUN apt-get install -y git 
# RUN mkdir -p /ros1_bridge/src 
# RUN cd /ros1_bridge/src ros1_bridge 
RUN git clone https://github.com/ros2/ros1_bridge 
RUN cd /ros1_bridge 
RUN apt-get install -y python3-rosdep 
RUN rosdep update 
RUN rosdep install --from-paths ros1_bridge/src --ignore-src -y --rosdistro=noetic 
#RUN apt-get install -y ros-humble-rmw 
#RUN source /opt/ros/noetic/setup.bash 
RUN colcon build --symlink-install --cmake-force-configure


    #&& colcon build 
ENV GENICAM_GENTL64_PATH=/usr/lib/ids/cti
# RUN source /opt/ros/humble/setup.bash \ 
#     && cd /ros_ws/peak_cam \
#     && colcon build 
    #--packages-skip ros1_bridge
    
#RUN colcon build

CMD ["sleep", "3600"]

#RUN apt install -y ids-peak_2.9.0.0-48_amd64
#RUN colcon build
#install dependencies
#RUN apt-get update \
#    && rm -rf /var/lib/apt/lists/*

#build source
#RUN mkdir -p /peak_cam/src
#WORKDIR /~/peak_cam


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
# COPY ./docker/entrypoint.sh /
# ENTRYPOINT [ "/entrypoint.sh" ]
# CMD [ "bash" ]
