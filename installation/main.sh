#! /bin/sh
cd
cd

sudo apt install curl
sudo apt install git

if [[ $(lsb_release -rs) == "20.04" ]]; then
# install pixhawk
    bash /path/to/installation/PX4.sh

    cd
    cd
# install FastRTPS_DDS.sh
    bash /path/to/installation/FastRTPS_DDS.sh

    cd
    cd
# install ROS2_FOXY
    bash /path/to/installation/ros2_foxy.sh
    cd
    cd
    bash /path/to/installation/PX4_WS.sh

else
    echo "Non-compatible version"
    echo "Only use Ubuntu 20.04"
fi 
