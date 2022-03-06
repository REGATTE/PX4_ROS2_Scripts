#! /bin/bash

# enable access to xhost from the container
xhost +

if [ $1 = 'build_foxy' ]
then
    docker build -t px4io/px4-dev-ros2-foxy . -f PX4_ROS2-FOXY/Dockerfile_foxy
    docker run --privileged -it --net=host \
	   -v /Users/regatte/Desktop/precision_landing_shaping_RL/shared:/src/shared:rw \
	   -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	   -v /Users/regatte/Desktop/precision_landing_shaping_RL/.bashrc:/root/.bashrc \
           -m="3g" \
           -e DISPLAY \
           --name=RL_foxy px4io/px4-dev-ros2-foxy bash
fi

cp $(xauth info | head -n 1 | cut -d' ' -f9) ~/.Xauthority

# Run docker
if [ $1 = 'run_foxy' ]
then
    docker start RL_foxy
    docker exec -it RL_foxy bash
fi
