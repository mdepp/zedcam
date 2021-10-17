from ros:melodic-robot
run apt-get update && apt-get install -y python-pip

copy requirements.txt /app/requirements.txt
run pip install -r /app/requirements.txt

copy catkin_ws/src/zedcam/package.xml /app/catkin_ws/src/zedcam/package.xml
copy submodules/zed-ros-wrapper/ /app/catkin_ws/src/zed-ros-wrapper/
run rosdep install -y --from-paths /app/catkin_ws/src/ --ignore-src /app/catkin_ws/src/

workdir /app