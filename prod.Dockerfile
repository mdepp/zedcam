from stereolabs/zed:3.0-devel-jetson-jp4.3
env DEBIAN_FRONTEND=noninteractive
run apt-get update && apt-get install -y curl gnupg lsb-release
run sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
run curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
run apt-get update && apt-get install -y ros-melodic-robot python-pip
run apt-get update && apt-get install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

copy . /app
workdir /app

env ROS_DISTRO=melodic
entrypoint /app/ros_entrypoint.bash

run rosdep init
run rosdep update

run pip install -r requirements.txt
run rosdep install -y --from-paths /app/catkin_ws/src/ --ignore-src /app/catkin_ws/src/
run cd /app/catkin_ws && catkin build

cmd ["sh", "-c", "source /app/devel/setup.bash && roslaunch zedcam zedcam.launch"]
