select mkroom.seq_review.nextval from dual;

set serveroutput on;
begin
    for i in 1..10000 loop
        if  i < 1000 then
            INSERT INTO mkroom.review
            VALUES (mkroom.seq_review.nextval, '지구탈출', '신도림점', 4, '정말 재미있어요!', 'user1', DEFAULT, DEFAULT, DEFAULT );
        ELSIF i < 2000 then
            INSERT INTO mkroom.review
            VALUES (mkroom.seq_review.nextval, '황금열쇠', '구로점', 4, '정말 재미있어요!', 'user1', DEFAULT, DEFAULT, DEFAULT );
        ELSIF i < 4000 then
            INSERT INTO mkroom.review
            VALUES (mkroom.seq_review.nextval, '셜록홈즈', '신촌점', 4, '정말 재미있어요!', 'user1', DEFAULT, DEFAULT, DEFAULT );
        ELSIF i < 5500 then
            INSERT INTO mkroom.review
            VALUES (mkroom.seq_review.nextval, '지구탈출', '신도림점', 4, '정말 재미있어요!', 'user1', DEFAULT, DEFAULT, DEFAULT );
        ELSIF i < 7000 then
            INSERT INTO mkroom.review
            VALUES (mkroom.seq_review.nextval, '황금열쇠', '구로점', 4, '정말 재미있어요!', 'user1', DEFAULT, DEFAULT, DEFAULT );
        ELSIF i < 8000 then
            INSERT INTO mkroom.review
            VALUES (mkroom.seq_review.nextval, '셜록홈즈', '신촌점', 4, '정말 재미있어요!', 'user1', DEFAULT, DEFAULT, DEFAULT );
        ELSIF i < 9000 then
            INSERT INTO mkroom.review
            VALUES (mkroom.seq_review.nextval, '지구탈출', '신도림점', 4, '정말 재미있어요!', 'user1', DEFAULT, DEFAULT, DEFAULT );
        ELSIF i < 9500 then
            INSERT INTO mkroom.review
            VALUES (mkroom.seq_review.nextval, '셜록홈즈', '구로림점', 4, '정말 재미있어요!', 'user1', DEFAULT, DEFAULT, DEFAULT );
        ELSE            
            INSERT INTO mkroom.review
            VALUES (mkroom.seq_review.nextval, '황금열쇠', '신촌점', 4, '정말 재미있어요!', 'user1', DEFAULT, DEFAULT, DEFAULT );
        END IF;            
    end loop;
    commit;
end;
/


set serveroutput on;
begin
    for i in 1..10000 loop
    
        dbms_output.put_line('My counter is : ' || i);
        if i < 1000 then
            update review 
            set rregdate =  sysdate - interval '7' day,
            rmoddate =  sysdate - interval '7' day
            where rno = i;
        elsif i < 2000 then
            update review 
            set rregdate =  sysdate - interval '6' day,
            rmoddate =  sysdate - interval '6' day
            where rno = i;
        elsif i < 3500 then
            update review 
            set rregdate =  sysdate - interval '5' day,
            rmoddate =  sysdate - interval '5' day
            where rno = i;
        elsif i < 5000 then
           update review 
            set rregdate =  sysdate - interval '4' day,
            rmoddate =  sysdate - interval '4' day
            where rno = i;
        elsif i < 6000 then
            update review 
            set rregdate =  sysdate - interval '3' day,
            rmoddate =  sysdate - interval '3' day
            where rno = i;
        elsif i < 7500 then
            update review 
            set rregdate =  sysdate - interval '2' day,
            rmoddate =  sysdate - interval '2' day
            where rno = i;      
        elsif i < 9000 then
            update review 
            set rregdate =  sysdate - interval '1' day,
            rmoddate =  sysdate - interval '1' day
            where rno = i;   
        else
            update review 
            set rregdate =  sysdate - interval '0' day,
            rmoddate =  sysdate - interval '0' day
            where rno = i;
        end if;
       
    end loop;    
commit;
end;
/
