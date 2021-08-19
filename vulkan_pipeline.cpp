#include "vulkan_pipeline.hpp"
#include <fstream>

namespace vulkan
{

  VulkanPipeline::VulkanPipeline(const std::string& vertFilePath, const std::string fragFilePath)
  {
    createGraphicsPipeline(vertFilePath, fragFilePath); 
  }

  std::vector<char> VulkanPipeline::readFile(const std::string& filePath)
  {
    std::ifstream file{filePath, std::ios::ate | std::ios::binary}; // ate means start from end
    if(!file.is_open())
    {
      throw std::runtime_error("Failed to open file: " + filePath);
    }

    size_t fileSize = static_cast<size_t>(file.tellg()); // return the end position as size
    std::vector<char> buffer(fileSize);
    
    file.seekg(0); // go back to file beginning
    file.read(buffer.data(), fileSize); // read into buffer's data pointer start position for fileSize amount of data
    file.close();

    return buffer;
  }

  void VulkanPipeline::createGraphicsPipeline(const std::string& vertFilePath, const std::string& fragFilePath)
  {
    auto vertCode = readFile(vertFilePath);
    auto fragCode = readFile(fragFilePath);

    std::cout << "Vertex Shader Code size: " << vertCode.size() << std::endl;
    std::cout << "Fragment Shader Code size: " << fragCode.size() << std::endl;
  }
}
