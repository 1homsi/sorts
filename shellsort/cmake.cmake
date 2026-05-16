cmake_minimum_required(VERSION 3.10)
project(ShellSort)

set(ARR 64 34 25 12 22 11 90)
list(SORT ARR)
message(STATUS "Sorted: ${ARR}")
