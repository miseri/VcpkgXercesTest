#include <iostream>
#include <xercesc/util/XercesVersion.hpp>

int main()
{
  std::cout << "Hello vcpkg XercesVersion: " << XERCES_VERSIONSTR << std::endl;
  return 0;
}
