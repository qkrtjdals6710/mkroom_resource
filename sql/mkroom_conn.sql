-- 계정 생성(권한까지 부여하고나서(최소 CRAETE SESSION) 왼쪽에 접속 데이터 만들어 두세요)
CREATE USER mkroom
IDENTIFIED BY mkroom_pw
TEMPORARY TABLESPACE temp
QUOTA unlimited ON mkroom_space; 


-- 계정 자체에 권한 부여(뭐가 필요할지 정리 안 해서 그냥 생각나는대로 다 갖다 넣었습니다)
GRANT CREATE SESSION, CREATE ANY TABLE, CREATE PROCEDURE, CREATE SEQUENCE, CREATE VIEW, ALTER SESSION
TO mkroom; 