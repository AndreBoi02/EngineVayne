#pragma once

#ifdef BOI_PLATFORMS_WINDOWS
extern EngineVayne::Application* EngineVayne::CreateApplication();

int main(int arc, char** arcv) {
	auto app = EngineVayne::CreateApplication();
	app->Run();
	delete app;
}
#else
	#error Only Support Windows
#endif