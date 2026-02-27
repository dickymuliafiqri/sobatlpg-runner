#!/bin/bash

DIR=$(dirname "$0")
PROJECT_DIR=$DIR/..
SERVICE_DIR=/etc/systemd/system
WORKING_DIR=/usr/local/etc/sobatlpg

sudo apt-get update
sudo apt-get install -y libatk1.0-0 libatk-bridge2.0-0 libgtk-3.0 libasound2 libgbm1

sudo rm -rf $SERVICE_DIR/sobatlpg.service
sudo cp $PROJECT_DIR/script/sobatlpg.service $SERVICE_DIR/

sudo rm -rf $WORKING_DIR
sudo mkdir -R $WORKING_DIR

wget https://github.com/dickymuliafiqri/sobatlpg-runner/releases/download/main/sobatlpg -O $WORKING_DIR/sobatlpg
sudo chmod +x $WORKING_DIR/sobatlpg

sudo systemctl daemon-reload
sudo systemctl enable sobatlpg
sudo systemctl start sobatlpg