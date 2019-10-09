#pragma once

#ifdef _WIN32
// Modify the following defines if you have to target a platform prior to the ones specified below.
// Refer to MSDN for the latest info on corresponding values for different platforms.
#ifndef WINVER				// Allow use of features specific to Windows XP or later.
#define WINVER 0x0501		// Change this to the appropriate value to target other versions of Windows.
#endif

#ifndef _WIN32_WINNT		// Allow use of features specific to Windows XP or later.                   
#define _WIN32_WINNT 0x0501	// Change this to the appropriate value to target other versions of Windows.
#endif						

#ifndef _WIN32_WINDOWS		// Allow use of features specific to Windows 98 or later.
#define _WIN32_WINDOWS 0x0410 // Change this to the appropriate value to target Windows Me or later.
#endif

#ifndef _WIN32_IE			// Allow use of features specific to IE 6.0 or later.
#define _WIN32_IE 0x0600	// Change this to the appropriate value to target other versions of IE.
#endif

// This is to prevent those annoying VS warnings about int type redefintions
#ifdef _MSC_VER // This check can be removed if you only build for Windows: 
// see http://connect.microsoft.com/VisualStudio/feedback/details/621653/including-stdint-after-intsafe-generates-warnings
#pragma warning (push)
#pragma warning (disable : 4005)
// #include <intsafe.h>
// #include <stdint.h>

#pragma warning (push)
#pragma warning (default : 4005)
#endif

#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
// Windows Header Files:
#ifdef _WIN32
#define NOMINMAX
#include <WinSock2.h>
#include <mswsock.h>
#include <windows.h>
#endif

#define _SCL_SECURE_NO_WARNINGS

#endif
