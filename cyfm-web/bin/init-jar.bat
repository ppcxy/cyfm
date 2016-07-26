@echo off
echo [INFO] 使用maven根据pom.xml 复制依赖jar到相应目录。
echo [INFO] compile,runtime级别到/webapp/WEB-INF/lib, test,provided级别到/lib

cd ..

set local_driver=%cd:~0,2%
set local_path=%cd%

set exec_path=%0
set exec_path=%exec_path:~0,-13%"
set exec_driver=%exec_path:~1,2%

%exec_driver%
cd %exec_path%/..

call mvn dependency:copy-dependencies -DoutputDirectory=mvn/test/lib -DexcludeScope=runtime -Dsilent=true
call mvn dependency:copy-dependencies -DoutputDirectory=mvn/runtime/lib -DincludeScope=runtime -Dsilent=true

%local_driver%
cd %local_path%

pause
