@echo off
echo.
echo [信息] 使用Jar命令运行Web工程。
echo.

cd /d "%~dp0..\dkd-admin\target"

set JAVA_OPTS=-Xms256m -Xmx1024m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m

java -jar %JAVA_OPTS% dkd-admin.jar

cd /d "%~dp0"
pause