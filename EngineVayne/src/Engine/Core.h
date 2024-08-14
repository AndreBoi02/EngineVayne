#pragma once

#ifdef BOI_PLATFORMS_WINDOWS
	#ifdef BOI_BUILD_DLL
		#define BOI_API __declspec(dllexport)
	#else
		#define BOI_API __declspec(dllimport)
	#endif
#else
	#error Only support windows
#endif
