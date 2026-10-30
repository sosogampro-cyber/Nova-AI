@echo off
chcp 65001 >nul
cd /d "%~dp0"
title NOVA - IA locale
where py >nul 2>nul
if errorlevel 1 (
  echo Python 3 est introuvable. Lance d'abord INSTALLER_ET_DEMARRER.bat pour voir les instructions.
  pause
  exit /b 1
)
where ollama >nul 2>nul
if errorlevel 1 (
  echo Ollama est introuvable. Lance d'abord INSTALLER_ET_DEMARRER.bat pour voir les instructions.
  pause
  exit /b 1
)
py -3 app.py
if errorlevel 1 pause
