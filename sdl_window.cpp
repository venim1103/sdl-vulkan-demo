#include "sdl_window.hpp"

namespace vulkan
{

SdlWindow::SdlWindow(int w, int h, std::string name) : width{w}, height{h}, windowName{name}
{
  initWindow();
}

SdlWindow::~SdlWindow()
{
  SDL_Quit();
}

void SdlWindow::initWindow()
{
  SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS);
  window = SDL_CreateWindow(windowName.c_str(), SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, width, height, SDL_WINDOW_VULKAN | SDL_WINDOW_SHOWN);
  if(!window) SDL_Quit();
}

}
