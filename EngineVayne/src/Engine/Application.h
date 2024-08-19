#pragma once
#include "Core.h"

namespace EngineVayne {
	class BOI_API Application {
	public:
		Application();
		virtual ~Application();
		void Run();
	};

	Application* CreateApplication();
}