cmake_minimum_required(VERSION 3.19)
project(Praticas C)

set(CMAKE_C_STANDARD 11)

include_directories(/opt/pic32mx/include/)

add_executable(Praticas
        Guiao_7/Parte1/ex1/ex1.c
        Guiao_7
        Guiao_8
        Guiao_9
        )
