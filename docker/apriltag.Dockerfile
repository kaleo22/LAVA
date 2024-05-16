
FROM osrf/ros:humble-desktop-full
ARG ROS_PYTHON_VERSION=3

SHELL [ "bin/bash", "-c" ]


#install build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions
RUN mkdir -p /cali_ws/src \
	&& apt install -y git 
RUN git clone https://github.com/kaleo22/apriltag_ros2.git \
	&& mv apriltag_ros2/ cali_ws/src/apriltag_ros2 
RUN apt-get install -y python3-rosdep 
	#&& apt install -y apt-utils \
	#&& apt install -y python-rosdep \
	#&& apt install -y python-rosinstall-generator \
	#&& apt install -y python-vcstool \
	#&& apt install -y python-rosinstall \
	#&& apt install -y build-essential \
	#&& apt install -y cmake
#CMD ["sleep","3600"]
RUN cd cali_ws/ \
	&& rosdep update \
        && rosdep install --from-paths src --ignore-src -r -y --rosdistro=humble 
	#&& rosdep install --from-paths cali_ws/src/apriltag_ros -r -y --rosdistro=melodic \
	#&& apt update && apt upgrade -y 
RUN source /opt/ros/humble/setup.bash \
	&& cd cali_ws/ \ 
	&& colcon build
    

#Set up the entrypoint
# COPY ./docker/entrypoint_cali.sh /
# ENTRYPOINT [ "/entrypoint_cali.sh" ]
# CMD [ "bash" ]
CMD ["sleep","3600"]# 
