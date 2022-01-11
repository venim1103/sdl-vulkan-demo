VULKAN_SDK_PATH_MAC = $(HOME)/Downloads/Vulkan/macOS/
VULKAN_SDK_PATH_LINUX = /usr/
VULKAN_SDK_PATH_WINDOWS = /mnt/e/Git/WindowsVulkan/
MINGWSDL2 = /mnt/e/Git/sdl2mingw/

GLSLC_WIN_LINUX = /usr/bin/glslc
GLSLC_MAC = $(VULKAN_SDK_PATH_MAC)/bin/glslc

GPP_UNIX = g++
GPP_WIN = x86_64-w64-mingw32-g++-win32

WINDOWSFLAGS = -D_WIN32 -DVK_USE_PLATFORM_WIN32_KHR

CFLAGS_LINUX = -std=c++14 -I. -I$(VULKAN_SDK_PATH_LINUX)/include
LDFLAGS_LINUX = -L$(VULKAN_SDK_PATH_LINUX)/lib -lSDL2 -lvulkan

CFLAGS_MAC = -std=c++14 -I. -I$(VULKAN_SDK_PATH_MAC)/include
LDFLAGS_MAC = -L$(VULKAN_SDK_PATH_MAC)/lib -lSDL2 -lvulkan

CFLAGS_WIN = -std=c++14 -I. -I$(VULKAN_SDK_PATH_WINDOWS)/Include -I$(MINGWSDL2)/include/
LDFLAGS_WIN = -L$(VULKAN_SDK_PATH_WINDOWS)/Lib -L$(VULKAN_SDK_PATH_WINDOWS)/Bin -L$(MINGWSDL2)/lib $(WINDOWSFLAGS) -lSDL2 -lvulkan-1 -Wl,-subsystem,windows -mwindows -municode -o a.exe

linux: *.cpp *.hpp
	$(GLSLC_WIN_LINUX) shaders/*.vert -o shaders/vert.spv
	$(GLSLC_WIN_LINUX) shaders/*.frag -o shaders/frag.spv
	$(GPP_UNIX) $(CFLAGS_LINUX) -o a.out *.cpp $(LDFLAGS_LINUX)

mac: *.cpp *.hpp
	$(GLSLC_MAC) shaders/*.vert -o shaders/vert.spv
	$(GLSLC_MAC) shaders/*.frag -o shaders/frag.spv
	$(GPP_UNIX) $(CFLAGS_MAC) -o a.out *.cpp $(LDFLAGS_MAC)

windows: *.cpp *.hpp
	$(GLSLC_WIN_LINUX) shaders/*.vert -o shaders/vert.spv
	$(GLSLC_WIN_LINUX) shaders/*.frag -o shaders/frag.spv
	$(GPP_WIN) -DWINDOWS_BUILD $(CFLAGS_WIN) -o a.out *.cpp $(LDFLAGS_WIN)

.PHONY: runlinux runmac runwindows clean

runlinux: linux
	./a.out
	rm -f a.*
	rm -f shaders/*.spv

runmac: mac
	./a.out
	rm -f a.*
	rm -f shaders/*.spv

runwindows: windows
	../git-bash.exe ./a.exe
	rm -f a.*
	rm -f shaders/*.spv

clean:
	rm -f a.*
	rm -f shaders/*.spv

