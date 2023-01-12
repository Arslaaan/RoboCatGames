cmake_minimum_required(VERSION 3.16)
set(CMAKE_CXX_STANDARD 14)

project(RoboCatShared VERSION 1.0.1 DESCRIPTION "Common library for RoboCatAction game")

find_package(SDL2 REQUIRED)

add_library(${PROJECT_NAME} SHARED
        Src/Engine.cpp
        Src/GameObject.cpp
        Src/GameObjectRegistry.cpp
        Src/InputState.cpp
        Src/MemoryBitStream.cpp
        Src/Mouse.cpp
        Src/Move.cpp
        Src/MoveList.cpp
        Src/NetworkManager.cpp
        Src/RoboCat.cpp
        Src/RoboCatPCH.cpp
        Src/RoboMath.cpp
        Src/ScoreBoardManager.cpp
        Src/SocketAddress.cpp
        Src/SocketAddressFactory.cpp
        Src/SocketUtil.cpp
        Src/StringUtils.cpp
        Src/TCPSocket.cpp
        Src/Timing.cpp
        Src/UDPSocket.cpp
        Src/World.cpp
        Src/Yarn.cpp
        )

set_target_properties(${PROJECT_NAME} PROPERTIES VERSION ${PROJECT_VERSION})

include_directories(
        Inc
)

file(GLOB_RECURSE PUBLIC_HEADER_FILES "Inc/*.h*")
set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER "${PUBLIC_HEADER_FILES}")

target_include_directories(${PROJECT_NAME} PUBLIC Inc)
target_include_directories(${PROJECT_NAME} PRIVATE Src)

target_link_libraries(
        ${PROJECT_NAME}
        SDL2
)

install(TARGETS ${PROJECT_NAME}
        LIBRARY DESTINATION ./lib
        PUBLIC_HEADER DESTINATION ./include)