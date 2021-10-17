.PHONY: build
build:
	docker build -t zedcam .

.PHONY: run-dev
run-dev: build
	docker run -it -v $$(pwd):/app zedcam

.PHONY: catkin-build
catkin-build:
	docker run -v $$(pwd):/app zedcam bash -c "cd catkin_ws && catkin build"

.PHONY: rosdep
rosdep:
	rosdep install -y --from-paths /app/catkin_ws/ --ignore-src /app/catkin_ws

