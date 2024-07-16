FROM osrf/ros:humble-desktop-full
ARG ROS_PYTHON_VERSION=3

SHELL [ "bin/bash", "-c" ]


#install build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-colcon-common-extensions
RUN apt install -y git 
RUN git clone https://github.com/kaleo22/PoseTransform.git 
	#&& mv PoseTransform/ PoseTransform/src/PoseTransform 
RUN apt-get install -y python3-rosdep 
	#&& apt install -y apt-utils \
	#&& apt install -y python-rosdep \
	#&& apt install -y python-rosinstall-generator \
	#&& apt install -y python-vcstool \
	#&& apt install -y python-rosinstall \
	#&& apt install -y build-essential \
	#&& apt install -y cmake

RUN cd PoseTransform/ \
	&& rosdep update \
        && rosdep install --from-paths src --ignore-src -r -y --rosdistro=foxy 
	#&& rosdep install --from-paths cali_ws/src/apriltag_ros -r -y --rosdistro=melodic \
	#&& apt update && apt upgrade -y 
RUN source /opt/ros/foxy/setup.bash \
	&& cd PoseTransform/ \ 
	&& colcon build
    

#Set up the entrypoint
COPY ./docker/entrypoint_PoseTransform.sh /
ENTRYPOINT [ "/entrypoint_PoseTransform.sh" ]
CMD [ "bash" ]
