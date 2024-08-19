#pragma once

#include <EngineVayne.h>


class Sandbox : public EngineVayne::Application {
public:
	Sandbox() {

	}

	~Sandbox() {

	}
};

EngineVayne::Application* CreateApplication() {
	return new Sandbox();
}