.PHONY: build-dev
build-dev:
	docker build -t zedcam .

.PHONY: run-dev
run-dev: build-dev
	docker run -it -v $$(pwd):/app zedcam

.PHONY: catkin-build
catkin-build:
	docker run -v $$(pwd):/app zedcam bash -c "cd catkin_ws && catkin build"
