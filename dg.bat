REM Generation  src classes from  scheme.

chcp 1251

java -jar drakongen.jar . transaction_in_postgres.graphml  

copy PG\*.* ..\CARLINKS\CarlinkNG\db\tmp\Trans\PG\
copy OR\*.* ..\CARLINKS\CarlinkNG\db\tmp\Trans\OR\

