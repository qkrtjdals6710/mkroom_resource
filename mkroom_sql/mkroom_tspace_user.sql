-- DATAFILE 주소 app\ 다음에 각자 컴퓨터에 존재하는 이름으로 바꾸기 
CREATE TABLESPACE mkroom_space
DATAFILE 'C:\app\goott05\oradata\XE\mkroom.dbf'
SIZE 11M
AUTOEXTEND ON NEXT 10M;

CREATE USER mkroom
IDENTIFIED BY mkroom_pw
TEMPORARY TABLESPACE temp
QUOTA unlimited ON mkroom_space; 

GRANT CREATE SESSION, CREATE ANY TABLE, CREATE PROCEDURE, CREATE SEQUENCE, CREATE VIEW, ALTER SESSION
TO mkroom; 

commit;