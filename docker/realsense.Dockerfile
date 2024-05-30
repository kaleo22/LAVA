FROM osrf/ros:humble-desktop-full
ARG ROS_PYTHON_VERSION=3

SHELL [ "bin/bash", "-c" ]

RUN apt-get update && apt-get install -y --no-install-recommends \
python3-colcon-common-extensions
RUN mkdir -p /realsense/src \
&& apt install -y git 
RUN git clone https://github.com/IntelRealSense/realsense-ros.git \
&& mv realsense-ros/ realsense/src/realsense-ros 
RUN apt-get install -y python3-rosdep 
RUN cd realsense/ \
&& rosdep update \
        && rosdep install --from-paths src --ignore-src -r -y --rosdistro=humble  
RUN source /opt/ros/humble/setup.bash \
	&& cd realsense/ \ 
	&& colcon build
CMD ["sleep", "3600"]