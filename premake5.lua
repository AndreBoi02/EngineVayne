workspace "EngineVayne"
	architecture "x64"
	startproject "Sandbox"

	configurations{
		"Debug",
		"Relase",
		"Dist"
	}

	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "EngineVayne"
	location "EngineVayne"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files{
		"/%{prj.name}/src/**.h",
		"/%{prj.name}/src/**.cpp"
	}

	includedirs{
		"/%{prj.name}/src"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines{
			"BOI_PLATFORMS_WINDOWS",
			"BOI_BUILD_DLL"
		}

		postbuildcommands{
			("{COPY} %{cfg.buildtarget.relpath} .. /bin/" .. outputdir .. "/Sandbox")
		}

		filter "configurations:Debug"
			defines "BOI_DEBUG"
			symbols "On"

		filter "configurations:Release"
        defines "BOI_RELEASE"
        optimize "On"

		filter "configurations:Dist"
        defines "BOI_DIST"
        optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files{
		"/%{prj.name}/src/**.h",
		"/%{prj.name}/src/**.cpp"
	}

	includedirs{
		"EngineVayne/src"
	}

	links{
		"EngineVayne"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines{
			"BOI_PLATFORMS_WINDOWS"
		}

		filter "configurations:Debug"
			defines "BOI_DEBUG"
			symbols "On"

		filter "configurations:Release"
        defines "BOI_RELEASE"
        optimize "On"

		filter "configurations:Dist"
        defines "BOI_DIST"
        optimize "On"