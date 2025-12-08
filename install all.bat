@echo off
set
set firstDirectory=%cd%
cd "%firstDirectory%\resources\"

:: clear the terminal
for /L %%i in (1,1,35) do echo.


:winget
echo.
echo ===== STEP 1: Installing Winget Packages =====
echo.
set /p skipWinget="Do you want to skip this step? (y/n): "
if /i "%skipWinget%"=="y" goto VALORANT
start "" "winget-pack.bat"
goto VALORANT



:valorant
echo.
echo ===== STEP 2: Installing Valorant True Stretched Resolution =====
echo.
set /p skipValorant="Do you want to skip this step? (y/n): "
if /i "%skipValorant%"=="y" goto prompt1
powershell -Command "Expand-Archive -Path '%firstDirectory%\resources\true stretched.zip' -DestinationPath '%USERPROFILE%\Downloads\true stretched\'"
cd "%USERPROFILE%\Downloads\true stretched\"
call installer.bat
cd "%firstDirectory%\resources\"
goto prompt1


:prompt1
echo.
echo ===== STEP 3: Sign Into Services =====
echo.
echo please sign into everything, including comet and vscode, then click a key twice
echo.
pause
pause
echo.
goto spotify




:spotify
echo.
echo ===== STEP 4: Setting Up Spotify with Spicetify and SpotX =====
echo.
set /p skipSpotify="Do you want to skip this step? (y/n): "
if /i "%skipSpotify%"=="y" goto millennium
echo.
start "" "spotx.bat"
echo wait for that to finish ...
echo.
pause
start powershell -Command "iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex"
echo install typable volume, a theme, shuffle+, more if u want
goto millennium



:millennium
echo.
echo ===== STEP 5: Installing Millennium (Decor for Steam) =====
echo.
set /p skipMillennium="Do you want to skip this step? (y/n): "
if /i "%skipMillennium%"=="y" goto vscode
echo.
start powershell -Command "iwr -useb https://steambrew.app/install.ps1 | iex"
echo.
echo install these ids:
echo F8h9ZhwOdoNygNcAfjIZ (theme)
echo 13f2dcc363c8 (extension)
echo 788ed8554492 (extension)
echo dd5a94af5f22 (extension)
echo https://chromewebstore.google.com/detail/steamdb/kdbmhfkmnlmbkgbabkdealhhbfhlmmon (install in extendium, puzzle icon)
echo.
echo click any key to open steam (do after millennium is done)...
pause
start C:\Program Files (x86)\Steam\Steam.exe

pause
exit