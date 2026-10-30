@echo off
chcp 65001 >nul
title NOVA - Autoriser le réseau local
net session >nul 2>&1
if not "%errorlevel%"=="0" (
  echo Ce fichier doit etre execute en tant qu'administrateur.
  echo Clic droit sur ce fichier puis ^"Executer en tant qu'administrateur^".
  pause
  exit /b 1
)
netsh advfirewall firewall add rule name="NOVA IA locale 8765" dir=in action=allow protocol=TCP localport=8765 profile=private
if errorlevel 1 (
  echo La regle du pare-feu n'a pas pu etre creee.
) else (
  echo OK : NOVA peut etre accessible depuis les autres PC du reseau prive.
)
echo N'active pas cette regle pour les reseaux publics, et ne transfere pas le port sur Internet.
pause
