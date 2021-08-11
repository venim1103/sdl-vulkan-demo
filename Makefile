VULKAN_SDK_PATH = $(HOME)/Downloads/Vulkan/macOS/

CFLAGS = -std=c++14 -I. -I$(VULKAN_SDK_PATH)/include
LDFLAGS = -L$(VULKAN_SDK_PATH)/lib -lSDL2 -lvulkan

a.out: *.cpp *.hpp
	g++ $(CFLAGS) -o a.out *.cpp $(LDFLAGS)

.PHONY: run clean

run: a.out
	./a.out
	rm -f a.out

clean:
	rm -f a.out

