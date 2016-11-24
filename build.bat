@ECHO OFF
SET PATH=%PATH%;"C:\Program Files (x86)\WiX Toolset v3.10\bin"
SET BASE=%~dp0..\OSGeo4W64
SET NAME=QGIS 2.14
SET PACKAGE=qgis-ltr
SET CANDELARGS=
SET VARS=-dQGISPATH="%BASE%" ^
-dAPPPATH="%BASE%\apps" ^
-dBINPATH="%BASE%\bin" ^
-dETCPATH="%BASE%\etc" ^
-dINCLUDEPATH="%BASE%\include" ^
-dLIBPATH="%BASE%\lib" ^
-dSHAREPATH="%BASE%\share" ^
-dVARPATH="%BASE%\var" ^
-dAppPackage=%PACKAGE%

SET WXSFILES=qgis.wxs ^
build\bin.wxs ^
build\app.wxs ^
build\etc.wxs ^
build\include.wxs ^
build\lib.wxs ^
build\share.wxs ^
build\var.wxs

SET WIXOBJ=build\qgis.wixobj ^
build\bin.wixobj ^
build\app.wixobj ^
build\etc.wixobj ^
build\include.wixobj ^
build\lib.wixobj ^
build\share.wixobj ^
build\var.wixobj

REM call collectfiles

candle %WXSFILES% %VARS% %ARGS% -out %~dp0\build\
IF ERRORLEVEL 1 GOTO ERROR
light %WIXOBJ% -out "%NAME%".msi %VARS% %ARGS%
IF ERRORLEVEL 1 GOTO ERROR
rem candle ini.wxs bin.wxs app.wxs qgis.wxs %VARS%
rem light ini.wixobj bin.wixobj app.wixobj qgis.wixobj -out qgis %VARS%
:ERROR
ECHO Error in building MSI package
@pause