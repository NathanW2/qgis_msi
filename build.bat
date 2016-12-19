@ECHO OFF
SET PATH=%PATH%;"C:\Program Files (x86)\WiX Toolset v3.10\bin"
SET BASE=%~dp0OSGeo4W64
SET MAJOR=2
SET MINOR=14
SET PATCH=1
SET NAME=QGIS %MAJOR%.%MINOR%
SET PACKAGE=qgis-ltr
SET ARGS=-ext WixUIExtension
SET LIGHTARGS=-sice:ICE60
SET CANDLEARGS=-arch x64
SET PLATFORM=x64
SET VARS=-dQGISPATH="%BASE%" ^
-dPlatform=%PLATFORM% ^
-dAPPPATH="%BASE%\apps" ^
-dBINPATH="%BASE%\bin" ^
-dETCPATH="%BASE%\etc" ^
-dINCLUDEPATH="%BASE%\include" ^
-dLIBPATH="%BASE%\lib" ^
-dSHAREPATH="%BASE%\share" ^
-dVARPATH="%BASE%\var" ^
-dAppPackage=%PACKAGE% ^
-dMajor=%MAJOR% ^
-dMinor=%MINOR% ^
-dPatch=%PATCH%

SET WXSFILES=*.wxs build\*.wxs
SET WIXOBJ=build\*.wixobj

ECHO Collecting files...

SET FLAGS=-template fragment -sreg -sfrag -ag -srd
heat dir "%BASE%\bin" -cg bin -dr BIN_REF -out build\bin.wxs -var var.BINPATH %FLAGS%
heat dir "%BASE%\apps" -cg app -dr APP_REF  -out build\app.wxs -var var.APPPATH %FLAGS%
heat dir "%BASE%\etc" -cg etc -dr ETC_REF  -out build\etc.wxs -var var.ETCPATH %FLAGS%
heat dir "%BASE%\include" -cg include -dr INCLUDE_REF  -out build\include.wxs -var var.INCLUDEPATH %FLAGS%
heat dir "%BASE%\lib" -cg lib -dr LIB_REF  -out build\lib.wxs -var var.LIBPATH %FLAGS%
heat dir "%BASE%\share" -cg share -dr SHARE_REF  -out build\share.wxs -var var.SHAREPATH %FLAGS%
heat dir "%BASE%\var" -cg var -dr VAR_REF  -out build\var.wxs -var var.VARPATH %FLAGS%

ECHO Cleaning old build files...
DEL build\*.wixobj

ECHO Making candle..
candle %WXSFILES% %VARS% %ARGS% %CANDLEARGS% -out %~dp0\build\
ECHO Lighting candle..
light %WIXOBJ% -out "%NAME%.msi" %VARS% %ARGS% %LIGHTARGS%
@pause