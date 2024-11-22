xterm -hold -e "source /opt/ros/foxy/setup.bash; fast-discovery-server -i 0 -x /var/tmp/husarnet-dds/fastdds-ds-server.xml; export ROS_DOMAIN_ID=10; export RMW_IMPLEMENTATION=rmw_fastrtps_cpp; export RMW_IMPLEMENTATION=rmw_fastrtps_cpp; export FASTRTPS_DEFAULT_PROFILES_FILE=/var/tmp/husarnet-fastdds-ds-client.xml; export DISCOVERY_SERVER_PORT=11888; husarnet-dds singleshot" &
xterm -hold -e "cd LAVA/docker; docker-compose up" 