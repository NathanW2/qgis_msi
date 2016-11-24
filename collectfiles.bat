call env.bat
SET BASE=%~dp0..\OSGeo4W64
SET FLAGS=-template fragment -sreg -sfrag -ag -srd
heat dir "%BASE%\bin" -cg bin -dr BIN_REF -out build\bin.wxs -var var.BINPATH %FLAGS%
heat dir "%BASE%\apps" -cg app -dr APP_REF  -out build\app.wxs -var var.APPPATH %FLAGS%
heat dir "%BASE%\etc" -cg etc -dr ETC_REF  -out build\etc.wxs -var var.ETCPATH %FLAGS%
heat dir "%BASE%\include" -cg include -dr INCLUDE_REF  -out build\include.wxs -var var.INCLUDEPATH %FLAGS%
heat dir "%BASE%\lib" -cg lib -dr LIB_REF  -out build\lib.wxs -var var.LIBPATH %FLAGS%
heat dir "%BASE%\share" -cg share -dr SHARE_REF  -out build\share.wxs -var var.SHAREPATH %FLAGS%
heat dir "%BASE%\var" -cg var -dr VAR_REF  -out build\var.wxs -var var.VARPATH %FLAGS%
rem heat dir "C:\Program Files\QGIS 2.14\bin " -ag -cg bin -dr BIN_REF -template fragment -sreg -sfrag -out bin.wxs -srd -gg -var var.BINPATH
rem heat dir "C:\Program Files\QGIS 2.14\etc\ini" -ag -cg ini -dr INI_REF -template fragment -sreg -sfrag -out ini.wxs -srd -gg -var var.INIPATH