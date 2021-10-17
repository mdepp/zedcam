from stereolabs/zed:3.0-devel-jetson-jp4.3
run apt-get update && apt-get install -y ros-melodic-robot python-pip
run rosdep init

copy . /app
workdir /app
run run rosdep install -y --from-paths /app/catkin_ws/src/ --ignore-src /app/catkin_ws/src/
run catkin build

cmd ["sh", "-c", "source /app/devel/setup.bash && roslaunch zedcam zedcam.launch"]
