-- DATAFILE �ּ� app\ ������ ���� ��ǻ�Ϳ� �����ϴ� �̸����� �ٲٱ� 
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