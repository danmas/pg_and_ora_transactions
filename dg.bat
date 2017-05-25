REM Generation  src classes from  scheme.

chcp 1251
rem chcp 65001

#set DRAKON_GEN="C:\ERV\PROJECTS\DrakonGen\exe\drakongen.jar"
set DRAKON_GEN="drakongen.jar"
#set BASE_DIR=%1

#java -jar %DRAKON_GEN% %BASE_DIR% %2 
java -jar %DRAKON_GEN% . transaction_in_postgres.graphml  

copy PG\*.* ..\CARLINKS\CarlinkNG\db\tmp\Trans\PG\
copy OR\*.* ..\CARLINKS\CarlinkNG\db\tmp\Trans\OR\

