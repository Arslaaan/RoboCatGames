cmake_minimum_required(VERSION 3.16)
set(CMAKE_CXX_STANDARD 14)

project(RoboCatServer VERSION 1.0.1 DESCRIPTION "Server part for RoboCatAction game")

include_directories(
        Inc
)

find_package(SDL2 REQUIRED CONFIG COMPONENTS SDL2main)
find_package(SDL2_image REQUIRED)
find_package(SDL2_ttf REQUIRED)

add_executable(
        ${PROJECT_NAME}
        Src/ClientProxy.cpp
        Src/MouseServer.cpp
        Src/NetworkManagerServer.cpp
        Src/ReplicationManagerServer.cpp
        Src/RoboCatServer.cpp
        Src/RoboCatServerPCH.cpp
        Src/Server.cpp
        Src/ServerMain.cpp
        Src/YarnServer.cpp
)

target_link_libraries(
        ${PROJECT_NAME}
        SDL2
)

target_link_libraries(
        ${PROJECT_NAME}
        ${CMAKE_INSTALL_PREFIX}/lib/libRoboCatShared.so.1.0.1
        SDL2_ttf
        SDL2_image
)