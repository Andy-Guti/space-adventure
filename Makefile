install: 
	rm -rf build && conan install . --build=missing

build:
	cmake --preset conan-release && \
	cmake --build --preset conan-release

run:
	cmake --build --preset conan-release && ./build/Release/space_adventure
.PHONY: install build 
