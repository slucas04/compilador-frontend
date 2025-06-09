@echo off
setlocal

:: Diretório atual
set DIR=.

:: JAR do JavaCup (certifique-se de que o arquivo java-cup-11b.jar está no mesmo diretório)
set JCUP_JAR=java-cup-11b.jar

:: 1) Gerar Scanner com JFlex
echo [1/4] Gerando Scanner com JFlex...
call jflex Scanner.flex
if errorlevel 1 goto erro

:: 2) Gerar Parser com Java CUP
echo [2/4] Gerando Parser com Java Cup...
call java -jar %JCUP_JAR% -parser Parser -symbols sym Parser.cup
if errorlevel 1 goto erro

:: 3) Compilar todos os arquivos .java
echo [3/4] Compilando fontes Java...
call javac -cp "%JCUP_JAR%;." *.java
if errorlevel 1 goto erro

:: 4) Executar aplicação
echo [4/4] Executando aplicação...
call java -cp "%JCUP_JAR%;." Main
goto fim

:erro
echo.
echo ERRO durante o processo. Verifique mensagens acima.
pause
goto :eof

:fim
echo.
echo Concluído com sucesso!
pause
