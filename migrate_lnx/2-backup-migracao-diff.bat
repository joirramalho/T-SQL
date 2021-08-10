@ECHO OFF

REM Parametros
REM 1 - database


IF [%1]==[] ( 	ECHO Parametro nao informado corretamente
		GOTO FIM )

SET Pasta=C:\TEMP\

SET NomeArquivo=%1_diff



if exist "%Pasta%%NomeArquivo%.bak" (
"C:\Program Files\7-Zip\7z.exe" a -tzip -mx1 "%Pasta%%NomeArquivo%.zip" "%Pasta%%NomeArquivo%.bak"
)

ECHO --storage-class STANDARD_IA

if exist "%Pasta%%NomeArquivo%.bak" (
	"c:\Program Files\Amazon\AWSCLI\aws.exe" s3 mv "%Pasta%%NomeArquivo%.zip" s3://activesoft-sql-backup-diff/%Arquivo% --region us-east-1 
) ELSE ( GOTO FIM )
)


if exist "%Pasta%%NomeArquivo%.bak" (
	DEL "%Pasta%%NomeArquivo%.bak"
)


ECHO	---------------

:FIM


@REM "C:\Program Files\Microsoft SQL Server\90\Tools\Binn\SQLCMD.EXE" -S ADMIN-PC -i "C:\Users\admin\Desktop\DBScript\DBBackUpSQL.sql"