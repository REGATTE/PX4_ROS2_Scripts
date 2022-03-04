#! /bin/sh
cd
cd

cd Desktop
# Clone only forked repo
git clone https://github.com/UAV-TECH/PX4-Autopilot.git --recursive
# installs Java JDK 11
bash ./PX4-Autopilot/Tools/setup/ubuntu.sh

# build px4 firmware for FMU_v5x
# this builds a new BUILD folder in PX4-Autopilot root directory and stores the firmware there.
make px4_fmu-v5x_default

cd
cd
