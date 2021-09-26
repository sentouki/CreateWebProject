@echo off

set INPUT="%1"

if "%1"=="" echo "Missing project name" && goto:eof

IF not "x%INPUT:\=%"=="x%INPUT%" ( 
    for %%f in (%INPUT%) do set PROJECTNAME=%%~nxf
    ) ELSE ( set PROJECTNAME=%1)


echo Creating "%PROJECTNAME%" ...

mkdir %1

echo ^<!DOCTYPE html^> >> %1\index.html
echo ^<html lang="en"^>  >> %1\index.html
echo:  >> %1\index.html
echo ^<head^> >> %1\index.html
echo   ^<title^>%PROJECTNAME%^</title^> >> %1\index.html
echo   ^<link rel="stylesheet" type="text/css" href="css/main.css"/^> >> %1\index.html
echo   ^<meta charset="utf-8"/^> >> %1\index.html
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0"/^> >> %1\index.html
echo ^</head^> >> %1\index.html
echo:  >> %1\index.html
echo ^<body^> >> %1\index.html
echo   ^<header^> >> %1\index.html
echo    ^<h1^>%PROJECTNAME%^</h1^> >> %1\index.html
echo   ^</header^> >> %1\index.html
echo   ^<main^>^</main^> >> %1\index.html
echo   ^<script src="js/main.js"^>^</script^> >> %1\index.html
echo ^</body^> >> %1\index.html
echo:  >> %1\index.html
echo ^</html^> >> %1\index.html

mkdir %1\js
mkdir %1\css

echo: >> %1\js\main.js
echo: >> %1\css\main.css

echo Project created!