#include "stdafx.h"
#include "XmlUtil.h"

// Xalan currently only required for TS func
#ifdef _WIN32
#ifdef ENABLE_XALAN
#include <xalanc/Include/PlatformDefinitions.hpp>
#include <xalanc/XalanTransformer/XalanTransformer.hpp>
#endif
#endif
#include <xercesc/util/PlatformUtils.hpp>

namespace xmlutil {

bool initialise()
{
  try 
  {
#ifdef _WIN32
#ifdef ENABLE_XALAN
    XALAN_USING_XERCES(XMLPlatformUtils)
    XALAN_USING_XALAN(XalanTransformer)
#endif
      XERCES_CPP_NAMESPACE_QUALIFIER XMLPlatformUtils::Initialize();
#ifdef ENABLE_XALAN
    XalanTransformer::initialize();
#endif
#else
    XERCES_CPP_NAMESPACE_QUALIFIER XMLPlatformUtils::Initialize();
#endif
  }
  catch (const XERCES_CPP_NAMESPACE_QUALIFIER XMLException& /*toCatch*/)
  {
    return false;
  }

  // Initialize Xalan
#if 0
try
  {	
#ifdef ENABLE_XALAN
    XALAN_CPP_NAMESPACE_QUALIFIER XalanTransformer::initialize();
#endif
  }
  catch(...)
  {
    return false;
  }
#endif

  return true;
}

void terminate()
{
#ifdef _WIN32
#ifdef ENABLE_XALAN
  XALAN_USING_XERCES(XMLPlatformUtils)
  XALAN_USING_XALAN(XalanTransformer)
  XalanTransformer::terminate();
#endif

  XERCES_CPP_NAMESPACE_QUALIFIER XMLPlatformUtils::Terminate();

#ifdef ENABLE_XALAN
  XalanTransformer::ICUCleanUp();
#endif
#else
  XERCES_CPP_NAMESPACE_QUALIFIER XMLPlatformUtils::Terminate();
#endif
}

} // xmlutil
