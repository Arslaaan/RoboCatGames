#!/bin/bash

sudo cmake --build ./RoboCat/cmake-build-debug --target install --config Debug
sudo cmake --build ./RoboCatServer/cmake-build-debug --target RoboCatServer
sudo cmake --build ./RoboCatClient/cmake-build-debug --target RoboCatClient

./RoboCatServer/cmake-build-debug/RoboCatServer 45000 &
pid0=$!

cd ./RoboCatClient/cmake-build-debug/

./RoboCatClient 127.0.0.1:45000 Player1 &
pid1=$!

./RoboCatClient 127.0.0.1:45000 Player2 &
pid2=$!

sleep 10
kill -KILL $pid0
kill -KILL $pid1
kill -KILL $pid2