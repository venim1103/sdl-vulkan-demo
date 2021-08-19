VULKAN_SDK_PATH = $(HOME)/Downloads/Vulkan/macOS/
GLSLC = $(VULKAN_SDK_PATH)/bin/glslc

CFLAGS = -std=c++14 -I. -I$(VULKAN_SDK_PATH)/include
LDFLAGS = -L$(VULKAN_SDK_PATH)/lib -lSDL2 -lvulkan

a.out: *.cpp *.hpp
	$(GLSLC) shaders/*.vert -o shaders/vert.spv
	$(GLSLC) shaders/*.frag -o shaders/frag.spv
	g++ $(CFLAGS) -o a.out *.cpp $(LDFLAGS)

.PHONY: run clean

run: a.out
	./a.out
	rm -f a.out
	rm -f shaders/*.spv

clean:
	rm -f a.out
	rm -f shaders/*.spv

