@echo off

set INPUT_PATH=libRaven.igo
set OUTPUT_PATH=src

"%IG_ROOT%\bin\igen" -v -r "(^$ \"%IG_ROOT%/include/igGapAll.h\" (^$ \"%INPUT_PATH%\"))" -b "([([IG_TARGET WIN32] [IG_TARGET_TYPE WIN32] [IG_GFX DX9] [IG_STATIC 0] [IG_DEBUG 0]) (^$ \"%INPUT_PATH%\") ^$ \"%OUTPUT_PATH%\"])"

if errorlevel 1 goto error
if errorlevel 0 goto ok
:error
pause
:ok
