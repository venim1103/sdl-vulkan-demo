#pragma once

#include <string>
#include <vector>
#include <iostream>

namespace vulkan
{

class VulkanPipeline
{
  public:
    VulkanPipeline(const std::string& vertFilePath, const std::string fragFilePath);

  private:
    static std::vector<char> readFile(const std::string& filePath);

    void createGraphicsPipeline(const std::string& vertFilePath, const std::string& fragFilePath);
};

}
