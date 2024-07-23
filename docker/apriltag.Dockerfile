
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
	
RUN curl -s https://install.husarnet.com/install.sh | sudo bash \
	&& RELEASE="v1.3.5" \
	&& ARCH="amd64" \
	&& sudo curl -L https://github.com/husarnet/husarnet-dds/releases/download/$RELEASE/husarnet-dds-linux-$ARCH -o /usr/local/bin/husarnet-dds \
	&& sudo chmod +x /usr/local/bin/husarnet-dds

RUN source /opt/ros/humble/setup.bash \
	&& cd cali_ws/ \ 
	&& colcon build
    

#Set up the entrypoint
COPY ./docker/entrypoint_cali.sh /
ENTRYPOINT [ "/entrypoint_cali.sh" ]
CMD [ "bash" ]
#CMD ["sleep","3600"]# 
