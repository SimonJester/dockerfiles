#!/usr/bin/env bash

date > log.log

#TODO: Grab the path from arg 0 and cd to that subdirectory.
#TODO: Make sure the path works even if it goes through a symlink.
#TODO: What happens if this script is run 2x in a row -- image name conflict?
sudo docker build -t="eth_cpp_dapp_dev_img" . 2>&1 |tee -a log.log
date >> log.log

#TODO: Provide a way of determining if the build failed. If it passed, do the next command.
sudo docker create -ti --name eth_cpp_dapp_dev eth_cpp_dapp_dev_img /bin/bash

#TODO: Provide a way of determining if the create failed. If it passed, echo the following.
#TODO: Create another script that does nothing but start the docker container, and right here we can inform the user how to call the script instead of the long command below.
echo To run the Docker container from the bash prompt:
echo   sudo docker start -ai eth_cpp_dapp_dev

