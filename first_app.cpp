#include "first_app.hpp"

namespace vulkan
{

void FirstApp::run()
{
  SDL_Event event;
  while(!sdlwindow.shouldClose(&event));
}

}
