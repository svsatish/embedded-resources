-- Copyright © 2017 Embedded Artistry LLC.
-- License: MIT. See LICENSE file for details.

-- For reference, please refer to the premake wiki:
-- https://github.com/premake/premake-core/wiki

local ROOT = "./"
local RESULTSROOT = ROOT .. "buildresults/%{cfg.platform}_%{cfg.buildcfg}/"

---------------------------------
-- [ WORKSPACE CONFIGURATION   --
---------------------------------
workspace "embedded-resources Interview Examples"
  configurations { "debug", "release" }
  platforms      { "x86_64", "x86" }

  -- _ACTION is the argument you passed into premake5 when you ran it.
  local project_action = "UNDEFINED"
  if _ACTION ~= nill then project_action = _ACTION end

  -- Where the project/make files are output
  location(ROOT .. "buildresults/build")

  -----------------------------------
  -- Global Compiler/Linker Config --
  -----------------------------------
  filter "configurations:Debug"    defines { "DEBUG" }  symbols  "On"
  filter "configurations:Release"  defines { "NDEBUG" } optimize "On"

  filter { "platforms:x86" } architecture "x86"
  filter { "platforms:x86_64" } architecture "x86_64"

  -- Global settings for building makefiles
  filter { "action:gmake" }
    flags { "C++11" }

  -- Global settings for building make files on mac specifically
  filter { "system:macosx", "action:gmake"}
    toolset "clang"

  filter {} -- clear filter when you know you no longer need it!

  -------------------------------
  -- [ PROJECT CONFIGURATION ] --
  -------------------------------

  project "bad_c"
    kind "ConsoleApp"
    language "C"
    targetdir (RESULTSROOT)
    targetname "bad_c.bin"

    local SourceDir = ROOT;
    files
    {
      SourceDir .. "bad.c"
    }

    filter {} -- clear filter!

    includedirs
    {
      SourceDir,
    }

    -- Library Dependencies
    libdirs
    {

    }

    links
    {

    }

  project "offset_of"
    kind "ConsoleApp"
    language "C"
    targetdir (RESULTSROOT)
    targetname "offset_of.bin"

    local SourceDir = ROOT;
    files
    {
      SourceDir .. "offset_of.c"
    }

    filter {} -- clear filter!

    includedirs
    {
      SourceDir,
    }

    -- Library Dependencies
    libdirs
    {

    }

    links
    {

    }

  project "stack_dir"
    kind "ConsoleApp"
    language "C"
    targetdir (RESULTSROOT)
    targetname "stack_dir.bin"

    local SourceDir = ROOT;
    files
    {
      SourceDir .. "stack_dir.c"
    }

    filter {} -- clear filter!

    includedirs
    {
      SourceDir,
    }

    -- Library Dependencies
    libdirs
    {

    }

    links
    {

    }
