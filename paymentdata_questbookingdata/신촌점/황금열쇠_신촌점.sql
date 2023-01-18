--------------------------------------------------------------------------------
-- 조회
-- 1달동안 총액 (퀘스트,지점별)
    

select
   to_char(selecttime, 'YYYY/MM') month,
   productname, branchlocation, sum(amount)
from paymentdata 
where selecttime <= trunc(sysdate, 'MM')
group by productname, branchlocation, to_char(selecttime, 'YYYY/MM')
order by 1 desc
;

select
   to_char(selecttime, 'YYYY/MM') month,
   productname, branchlocation, sum(amount)
from paymentdata 
where selecttime <= trunc(sysdate, 'MM') and branchlocation = '신촌점' 
group by productname, branchlocation, to_char(selecttime, 'YYYY/MM')
order by 1 desc
;


--------------------------------------------------------------------------------
-- 조회
-- 1달동안 예약개수 (퀘스트,지점별)

select
   to_char(selecttime, 'YYYY/MM') month,
   questname, branchlocation, count(*)
from questbookingdata 
where selecttime <= trunc(sysdate, 'MM')
group by questname, branchlocation, to_char(selecttime, 'YYYY/MM')
order by 1 desc
;

select
   to_char(selecttime, 'YYYY/MM') month,
   questname, branchlocation, count(*)
from questbookingdata 
where selecttime <= trunc(sysdate, 'MM') and branchlocation = '신촌점' 
group by questname, branchlocation, to_char(selecttime, 'YYYY/MM')
order by 1 desc
;
--------------------------------------------------------------------------------
-- 삭제

delete questbookingdata
where impuid like 'impuid_test_황금열쇠_신촌점%'
;
commit;
delete paymentdata
where impuid like 'impuid_test_황금열쇠_신촌점%'
;
commit;

--------------------------------------------------------------------------------
-- insert test data into paymentdata
-- 셜록홈즈, 지구탈출, 황금열쇠
-- 구로점, 신촌점, 신도림점
-- 한달 최대건수 30*18(30일 9 to 18) = 540건
begin
    for i in 1..6000 loop
        if i < 200 then
            
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '1' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '1' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '1' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        elsif i < 600 then
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '2' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '2' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '2' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        elsif i < 1000 then
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '3' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '3' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '3' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        elsif i < 1300 then
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '4' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '4' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '4' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        elsif i < 1700 then
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '5' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '5' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '5' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        elsif i < 2100 then
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '6' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '6' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '6' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        elsif i < 2600 then
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '7' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '7' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '7' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        elsif i < 3100 then
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '8' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '8' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '8' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        elsif i < 3500 then
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '9' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '9' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '9' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        elsif i < 4000 then
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '10' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '10' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '10' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        elsif i < 4400 then
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '11' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '11' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '11' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        elsif i < 4800 then
            insert into paymentdata
                (
                    impuid, merchantuid,
                    productname, branchlocation, amount, paidat, buyerid, selecttime
                )
            values
                (
                    'impuid_test_황금열쇠_신촌점'||i,'merchantuid_test_황금열쇠_신촌점'||i,
                    '황금열쇠', '신촌점', 70000, SYSDATE - INTERVAL '12' MONTH - i/24/60, 'user148', SYSDATE - INTERVAL '12' MONTH - i/24/60
                );
            insert into questbookingdata
                (
                    bookingnum, questname,
                    branchlocation, selecttime, teammember, userid, impuid
                )
            values
                (
                    SEQ_QUESTBOOKINGDATA.nextval, '황금열쇠',
                    '신촌점', SYSDATE - INTERVAL '12' MONTH - i/24/60, '3', 'user148', 'impuid_test_황금열쇠_신촌점'||i
                    
                );    
        end if;                
        
    end loop;
end;
/
commit;  



--------------------------------------------------------------------------------