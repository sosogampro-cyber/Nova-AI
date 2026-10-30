@echo off
chcp 65001 >nul
cd /d "%~dp0"
title NOVA - Installation et démarrage
color 0B
echo.
echo  ==================================================
echo       NOVA - IA LOCALE POUR WINDOWS
echo  ==================================================
echo.
where py >nul 2>nul
if errorlevel 1 (
  echo [ERREUR] Python n'est pas installé.
  echo Ouverture du site officiel pour l'installer...
  start "" "https://www.python.org/downloads/windows/"
  echo Installe Python 3, coche ^"Add python.exe to PATH^" si l'option est proposée,
  echo puis relance ce fichier.
  pause
  exit /b 1
)
py -3 --version
where ollama >nul 2>nul
if errorlevel 1 (
  echo.
  echo [ERREUR] Ollama n'est pas installé.
  echo Ouverture du site officiel d'Ollama...
  start "" "https://ollama.com/download/windows"
  echo Installe Ollama, laisse-le démarrer, puis relance ce fichier.
  pause
  exit /b 1
)
echo.
echo Étape 1/2 : téléchargement du modèle Qwen3 8B.
echo Environ 5 Go sont à télécharger ; cela peut prendre du temps.
echo Ce téléchargement est nécessaire une seule fois.
echo.
ollama pull qwen3:8b
if errorlevel 1 (
  echo.
  echo [ERREUR] Le modèle n'a pas pu être téléchargé.
  echo Vérifie ta connexion Internet et réessaie.
  pause
  exit /b 1
)
echo.
echo Étape 2/2 : lancement de NOVA...
echo.
py -3 app.py
if errorlevel 1 (
  echo.
  echo NOVA s'est arrêtée avec une erreur. Vérifie que Python 3 est bien installé.
  pause
)
