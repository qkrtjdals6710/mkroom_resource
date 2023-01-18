




update member
set regdate = SYSDATE - INTERVAL '1' DAY
;
SELECT SYSDATE - INTERVAL '1' DAY as one_day_ago FROM DUAL;
SELECT SYSDATE - INTERVAL '7' DAY as one_week_ago FROM DUAL;
SELECT SYSDATE - INTERVAL '1' MONTH as one_month_ago FROM DUAL;






-- HIRE_QUATER 으로 그룹화
SELECT TO_CHAR(HIRE_DATE, 'YYYY') || 
            CASE WHEN TO_CHAR(HIRE_DATE, 'MM') IN ('01', '02', '03')
                    THEN 'Q1'
                  WHEN TO_CHAR(HIRE_DATE, 'MM') IN ('04', '05', '06')
                    THEN 'Q2'
                  WHEN TO_CHAR(HIRE_DATE, 'MM') IN ('07', '08', '09' )
                    THEN 'Q3'
                  WHEN TO_CHAR(HIRE_DATE, 'MM') IN ('10', '11', '12')
                    THEN 'Q4'
            END AS "HIRE_QUATER",
       COUNT(*)
FROM EMPLOYEES 
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY') || 
            CASE WHEN TO_CHAR(HIRE_DATE, 'MM') IN ('01', '02', '03')
                    THEN 'Q1'
                 WHEN TO_CHAR(HIRE_DATE, 'MM') IN ('04', '05', '06')
                    THEN 'Q2'
                 WHEN TO_CHAR(HIRE_DATE, 'MM') IN ('07', '08', '09' )
                    THEN 'Q3'
                 WHEN TO_CHAR(HIRE_DATE, 'MM') IN ('10', '11', '12')
                    THEN 'Q4'
            END
ORDER BY 1;

update member 
set regdate =  SYSDATE - INTERVAL '1' DAY
where userid = 'user' || 1;

commit;

set serveroutput on;
begin
    for i in 1..10000 loop
    
        dbms_output.put_line('My counter is : ' || i);
        if i < 1000 then
            update member 
            set regdate =  sysdate - interval '7' day
            where userid = 'user' || i;
        elsif i < 2000 then
            update member 
            set regdate =  sysdate - interval '6' day
            where userid = 'user' || i;
        elsif i < 3500 then
            update member 
            set regdate =  sysdate - interval '5' day
            where userid = 'user' || i;
        elsif i < 5000 then
            update member 
            set regdate =  sysdate - interval '4' day
            where userid = 'user' || i;
        elsif i < 6000 then
            update member 
            set regdate =  sysdate - interval '3' day
            where userid = 'user' || i;
        elsif i < 7500 then
            update member 
            set regdate =  sysdate - interval '2' day
            where userid = 'user' || i;            
        elsif i < 9000 then
            update member 
            set regdate =  sysdate - interval '1' day
            where userid = 'user' || i;         
        else
            update member 
            set regdate =  sysdate - interval '0' day
            where userid = 'user' || i;
        end if;
       
    end loop;    
commit;
end;
/

-- 일간 통계

SELECT 
    to_char(regdate, 'YYYY-MM-DD') regdate, count(*) cnt
FROM member
where regdate >= sysdate - interval '7' day
GROUP BY to_char(regdate, 'YYYY-MM-DD')
ORDER BY 1
;   




-- 월간 통계
select to_char(regdate, 'YYYY-MM'), count(*)
from member
group by to_char(regdate, 'YYYY-MM')
;

