.DEFAULT_GOAL := build-dev

.PHONY: update-submodules
update-submodules:
	git submodule update --init --recursive

.PHONY: build-dev
build-dev: update-submodules
	docker build -t zedcam .

.PHONY: run-dev
run-dev: build-dev update-submodules
	docker run -it -v $$(pwd):/app zedcam

.PHONY: catkin-build
catkin-build: build-dev update-submodules
	docker run -v $$(pwd):/app zedcam bash -c "cd catkin_ws && catkin build"
