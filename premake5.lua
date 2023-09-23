IG_ROOT = os.getenv("IG_ROOT")

workspace "libRaven"
	kind "SharedLib"
	language "C++"
	system "Windows"
	systemversion "latest"
	location "build"
	configurations { "Debug", "Release" }
	targetdir "bin/%{cfg.buildcfg}"
	
	filter "configurations:Debug"
		libdirs { path.join(IG_ROOT, "DirectX9/libdbg") }
		defines { "WIN32", "_DEBUG", "_WINDOWS", "_USRDLL", "LIBRAVEN_EXPORT", "LIBRAVEN_DYNAMIC", "IG_GFX_DX9", "IG_TARGET_WIN32", "IG_TARGET_TYPE_WIN32", "IG_ALCHEMY_DLL", "IG_NO_MEMORY_TRACKING_MALLOC_MACROS" }
		symbols "On"
		postbuildcommands "copy /y \"$(TargetDir)\" \"..\\libdbg\\\""
	filter {}
	
	filter "configurations:Release"
		libdirs { path.join(IG_ROOT, "DirectX9/lib") }
		defines { "WIN32", "NDEBUG", "_WINDOWS", "_USRDLL", "LIBRAVEN_EXPORT", "LIBRAVEN_DYNAMIC", "IG_GFX_DX9", "IG_TARGET_WIN32", "IG_TARGET_TYPE_WIN32", "IG_ALCHEMY_DLL" }
		optimize "On"
		postbuildcommands "copy /y \"$(TargetDir)\" \"..\\lib\\\""
	filter {}
	
	includedirs { path.join(IG_ROOT, "include") }
	
	links { "libIGCore", "libIGAttrs" }
   
	files { "src/*.*" }
   
project "libRaven"