@echo off
setlocal
cd /d "%~dp0"
echo NovaCart first-time setup
where node >nul 2>nul
if errorlevel 1 (echo Node.js was not found. Install Node.js LTS from https://nodejs.org/ and reopen this window.& pause & exit /b 1)
call npm install
if errorlevel 1 goto failed
call npm install --prefix server
if errorlevel 1 goto failed
call npm install --prefix client
if errorlevel 1 goto failed
echo Setup complete. Starting NovaCart...
call npm run dev
goto end
:failed
echo Setup failed. Read the error above and check README.md.
pause
:end
endlocal
