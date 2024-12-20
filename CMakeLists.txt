cmake_minimum_required(VERSION 3.30)

project(space_adventure)

find_package(SDL2 REQUIRED )
find_package(SDL2_image REQUIRED )

file(GLOB space_adventure_SRC CONFIGURE_DEPENDS "src/*.h" "src/*.cpp")
add_executable(space_adventure ${space_adventure_SRC})


# Main SDL library for init
target_link_libraries(${PROJECT_NAME} PRIVATE SDL2::SDL2main SDL2::SDL2-static)

# SDL image to make a surface (aka what we'll render)
target_link_libraries(${PROJECT_NAME} PRIVATE SDL2_image::SDL2_image-static)

file(COPY assets DESTINATION ${CMAKE_BINARY_DIR})