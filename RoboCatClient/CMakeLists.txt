cmake_minimum_required(VERSION 3.16)
set(CMAKE_CXX_STANDARD 14)

project(RoboCatClient VERSION 1.0.1 DESCRIPTION "Client part for RoboCatAction game")

include_directories(
        Inc
        ${CMAKE_INSTALL_PREFIX}/include/
)

SET(CMAKE_CXX_FLAGS -g) # for debug

find_package(SDL2 REQUIRED)
find_package(SDL2_image REQUIRED)
find_package(SDL2_ttf REQUIRED)

add_executable(
        ${PROJECT_NAME}
        Src/Client.cpp
        Src/ClientMain.cpp
        Src/GraphicsDriver.cpp
        Src/HUD.cpp
        Src/InputManager.cpp
        Src/MouseClient.cpp
        Src/NetworkManagerClient.cpp
        Src/RenderManager.cpp
        Src/ReplicationManagerClient.cpp
        Src/RoboCatClient.cpp
        Src/RoboCatClientPCH.cpp
        Src/SpriteComponent.cpp
        Src/Texture.cpp
        Src/TextureManager.cpp
        Src/WindowManager.cpp
        Src/YarnClient.cpp
)

target_link_libraries(
        ${PROJECT_NAME}
        SDL2
)

target_link_libraries(
        ${PROJECT_NAME}
        ${CMAKE_INSTALL_PREFIX}/lib/libRoboCatShared.so
        SDL2_ttf
        SDL2_image
)