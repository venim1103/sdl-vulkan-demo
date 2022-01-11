#include <iostream>
#include <cstdlib>
#include <stdexcept>

#include "first_app.hpp"

#ifdef WINDOWS_BUILD
#include <windows.h>
int wmain(void)
#else
int main(void)
#endif
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

