#include <iostream>
#include <cstdlib>
#include <stdexcept>

#include "first_app.hpp"

int main(void)
{
  vulkan::FirstApp app{};

  try
  {
    app.run();
  } catch(const std::exception &error)
  {
    std::cerr << error.what() << std::endl;
    return EXIT_FAILURE;
  }

  return EXIT_SUCCESS;
}

