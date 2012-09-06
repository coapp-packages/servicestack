@echo off
setlocal
REM for /D %%v in (servicestack.*) do rmdir /s /q  %%v
REM nuget install servicestack

path=%PATH%;C:\Program Files (x86)\Microsoft\ILMerge\;C:\Program Files\Microsoft\ILMerge\

for /R %%v in ( net35\ServiceStack.Common.d?l ) do set SS_COMMON=%%v
for /R %%v in ( net35\ServiceStack.Interfaces.d?l ) do set SS_INTERFACES=%%v
for /R %%v in ( net35\ServiceStack.Text.d?l ) do set SS_TEXT=%%v
for /R %%v in ( net40\ServiceStack.d?l ) do set SS_MAIN=%%v
for /R %%v in ( net40\ServiceStack.ServiceInterface.d?l ) do set SS_SI=%%v
for /R %%v in ( lib\ServiceStack.OrmLite.d?l ) do set SS_ORMLITE=%%v
for /R %%v in ( lib\ServiceStack.OrmLite.SqlServer.d?l ) do set SS_ORMLITESQL=%%v
REM for /R %%v in ( net40\ServiceStack.Razor.d?l ) do set SS_RAZOR=%%v

ilmerge /log:servicestack.merge.txt /t:library /ver:3.9.5.0  /copyattrs /keepFirst /xmldocs /v4 /out:Monolithic.ServiceStack.dll %SS_COMMON% %SS_INTERFACES% %SS_TEXT% %SS_MAIN% %SS_SI% %SS_ORMLITE% %SS_ORMLITESQL% 
REM %SS_RAZOR%
