#!/bin/bash

DIR=$(dirname "$0")
PROJECT_DIR=$DIR/..
SERVICE_DIR=/etc/systemd/system
WORKING_DIR=/usr/local/etc/sobatlpg

sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install -y golang-go libatk1.0-0 libatk-bridge2.0-0 libgtk-3.0 libasound2 libgbm1

sudo rm -rf $SERVICE_DIR/sobatlpg.service
sudo cp $PROJECT_DIR/script/sobatlpg.service $SERVICE_DIR/

sudo mkdir -p $WORKING_DIR
sudo rm -rf $WORKING_DIR/sobatlpg

sudo rm -rf sobatlpg
git clone https://github.com/dickymuliafiqri/sobatlpg
cd sobatlpg
go build -o $WORKING_DIR/sobatlpg ./cmd/sobatlpg/main.go

sudo systemctl daemon-reload
sudo systemctl enable sobatlpg
sudo systemctl start sobatlpg