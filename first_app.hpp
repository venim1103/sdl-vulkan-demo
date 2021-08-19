#pragma once

#include "sdl_window.hpp"
#include "vulkan_pipeline.hpp"

namespace vulkan
{

class FirstApp
{
  public:
    static constexpr int WIDTH = 1280;
    static constexpr int HEIGHT = 720;

    void run();

  private:
    SdlWindow sdlwindow{WIDTH, HEIGHT, "VulkanTest"};
    VulkanPipeline vulkanPipeline{"shaders/vert.spv", "shaders/frag.spv"};
};

}
