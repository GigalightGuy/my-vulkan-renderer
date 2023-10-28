@echo off

set VK_PATH=%VULKAN_SDK%

if "%~1"=="debug" (goto debug) else (goto release)

:debug
call md build\debug
set COMPILE_CMD=g++ -g -I%VK_PATH%\Include -L%VK_PATH%\Lib -lvulkan-1 main.cpp -o build\release\vk-renderer.exe
call %COMPILE_CMD%

goto end

:release
call md build\release
set COMPILE_CMD=g++ -I%VK_PATH%\Include -L%VK_PATH%\Lib -lvulkan-1 main.cpp -o build\release\vk-renderer.exe
call %COMPILE_CMD%

goto end

:end

set SRC_FILE=main.cpp

set CWD=%cd:\=\\%
set CMP_CMD=%COMPILE_CMD:\=\\%
set SRC_F=%SRC_FILE:\=\\%

call generate_compile_commands_file.exe "%CWD%" "%CMP_CMD%" "%SRC_F%"
echo Build finished.
