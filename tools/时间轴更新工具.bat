@echo off & title 时间轴更新 By CanisMinor

echo ==========================================================================
echo                   时间轴自动更新程序
echo By CanisMinor  ID: 男孩纸榨汁机(紫水)  讨论群: 246243038
echo ==========================================================================

echo [*]只在WIN10测试过此更新程序
echo [*]请以管理员身份运行
echo [*]请把本程序放在时间轴目录中
pause
echo [1]正在下载时间轴ZIP

set Url=https://github.com/canisminor1990/ffxiv-timeline/archive/master.zip
for %%a in ("%Url%") do set "FileName=%%~nxa"

(echo Download Wscript.Arguments^(0^),Wscript.Arguments^(1^)
echo Sub Download^(url,target^)
echo   Const adTypeBinary = 1
echo   Const adSaveCreateOverWrite = 2
echo   Dim http,ado
echo   Set http = CreateObject^("Msxml2.ServerXMLHTTP"^)
echo   http.open "GET",url,False
echo   http.send
echo   Set ado = createobject^("Adodb.Stream"^)
echo   ado.Type = adTypeBinary
echo   ado.Open
echo   ado.Write http.responseBody
echo   ado.SaveToFile target
echo   ado.Close
echo End Sub)>DownloadFile.vbs
 
DownloadFile.vbs "%Url%" "%cd%\%FileName%"
del DownloadFile.vbs

echo [2]正在解压时间轴ZIP

(echo UnZip Wscript.Arguments^(0^),Wscript.Arguments^(1^)
echo Sub UnZip^(ByVal myZipFile, ByVal myTargetDir^)
echo     Set fso = CreateObject^("Scripting.FileSystemObject"^)
echo     If NOT fso.FileExists^(myZipFile^) Then
echo         Exit Sub
echo     ElseIf fso.GetExtensionName^(myZipFile^) ^<^> "zip" Then
echo         Exit Sub
echo     ElseIf NOT fso.FolderExists^(myTargetDir^) Then
echo         fso.CreateFolder^(myTargetDir^)
echo     End If
echo     Set objShell = CreateObject^("Shell.Application"^)
echo     Set objSource = objShell.NameSpace^(myZipFile^)
echo     Set objFolderItem = objSource.Items^(^)
echo     Set objTarget = objShell.NameSpace^(myTargetDir^)
echo     intOptions = 256
echo     objTarget.CopyHere objFolderItem, intOptions
echo End Sub)>UnZip.vbs

UnZip.vbs "%cd%\master.zip" "%cd%"
del UnZip.vbs 
del master.zip

echo [3]正在复制时间轴

copy %cd%\ffxiv-timeline-master\*.xml %cd%
rd /s /q ffxiv-timeline-master

echo [4]更新完成,请刷新文件夹
pause
