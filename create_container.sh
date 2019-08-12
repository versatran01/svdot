#!/bin/bash
xhost +local:root
nvidia-docker run -it \
  -p 0.0.0.0:7222:7222 \
  --name="ubuntu18" \
  --privileged \
  --env="DISPLAY=$DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --runtime=nvidia \
  --ipc=host nvidia/cuda:10.1-cudnn7-runtime \
  bash

