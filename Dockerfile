from ros:melodic-robot
run apt-get update && apt-get install -y python-pip

copy requirements.txt /app/requirements.txt
run pip install -r /app/requirements.txt

copy catkin_ws/src/ /app/catkin_ws/src/
run rosdep install --from-paths /app/catkin_ws/src/

workdir /app