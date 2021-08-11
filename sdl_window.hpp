#pragma once

#include <string>
#include <SDL2/SDL.h>
#include <SDL2/SDL_vulkan.h>

namespace vulkan
{

class SdlWindow
{
  public:
    SdlWindow(int w, int h, std::string name);
    ~SdlWindow();

    SdlWindow(const SdlWindow&) = delete;
    SdlWindow& operator=(const SdlWindow&) = delete;

    bool shouldClose(SDL_Event* event)
    {
      SDL_PollEvent(event);
      if(event->type == SDL_QUIT) return true;
      return false;
    }

  private:
    const std::string windowName;
    const int width;
    const int height;
    SDL_Window* window;

    void initWindow();
};

}
