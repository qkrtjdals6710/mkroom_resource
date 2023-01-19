set serveroutput on;
declare
v_cnt integer;
begin
    for i in 1..10000 loop
        select 
            count(*) + 1
        into v_cnt
        from qna;
      
        insert into mkroom.qna
        values (i, '질문이 있어요', '다른 한편으로, 우리는 순간적인 쾌락의 매력에 너무 현혹되어 사기를 꺾고 욕망에 너무 눈이 멀어 앞으로 닥칠 고통과 문제를 예견할 수 없는 사람들을 정당한 분개로 비난하고 싫어합니다. 책임은 의지가 약해서 의무를 다하지 못한 자의 몫이며, 이는 수고와 고통에서 위축되어 말하는 것과 같습니다. 이러한 경우는 매우 간단하고 구별하기 쉽습니다. 우리가 가장 좋아하는 일을 할 수 있는 것을 방해하는 것이 아무것도 없을 때 모든 쾌락은 환영받고 모든 고통은 피해야 합니다.그러나 특정 상황에서 그리고 의무 또는 비즈니스 의무로 인해 쾌락을 거부해야 하는 경우가 자주 발생합니다. 그리고 성가심은 받아 들였습니다.그러므로 현명한 사람은 이 문제에서 항상 이 선택의 원칙을 고수합니다: 그는 다른 더 큰 쾌락을 얻기 위해 쾌락을 거부하거나, 그렇지 않으면 더 나쁜 고통을 피하기 위해 고통을 참습니다.',
                'user1',default,default,default,default, default);
        insert into mkroom.qna_reply
        values (mkroom.seq_qna_reply.nextval, i, 'user1', 'user1', default, default, default);            
    end loop;
    commit;
end;
/


set serveroutput on;
declare
v_cnt integer;
begin
    select 
        count(*)
    into v_cnt
    from qna;
    dbms_output.put_line('count is : ' || v_cnt);
    
    for i in 1..v_cnt loop
        
        if i < floor(v_cnt/100*10) then
            update qna 
            set bregdate =  sysdate - interval '6' day,
                bwriter = 'user1'
            where bno = i;
            update qna_reply 
            set rregdate =  sysdate - interval '6' day,
                rmoddate =  sysdate - interval '6' day,
                rwriter = 'user2'
            where bno = i;
        elsif i < floor(v_cnt/100*25) then
            update qna 
            set bregdate =  sysdate - interval '5' day,
                bwriter = 'user2'
            where bno = i;
            update qna_reply 
            set rregdate =  sysdate - interval '5' day,
                rmoddate =  sysdate - interval '5' day,
                rwriter = 'user3'
            where bno = i;
        elsif i < floor(v_cnt/100*50) then
            update qna 
            set bregdate =  sysdate - interval '4' day,
            bwriter = 'user3'
            where bno = i;
            update qna_reply 
            set rregdate =  sysdate - interval '4' day,
                rmoddate =  sysdate - interval '4' day,
                rwriter = 'user4'
            where bno = i;
        elsif i < floor(v_cnt/100*60) then
            update qna 
            set bregdate =  sysdate - interval '3' day,
            bwriter = 'user4'
            where bno = i;
            update qna_reply 
            set rregdate =  sysdate - interval '3' day,
                rmoddate =  sysdate - interval '3' day,
                rwriter = 'user5'
            where bno = i;
        elsif i < floor(v_cnt/100*85) then
            update qna 
            set bregdate =  sysdate - interval '2' day,
            bwriter = 'user5'
            where bno = i;
            update qna_reply 
            set rregdate =  sysdate - interval '2' day,
                rmoddate =  sysdate - interval '2' day,
                rwriter = 'user6'
            where bno = i;
        elsif i < floor(v_cnt/100*90) then
            update qna 
            set bregdate =  sysdate - interval '1' day,
            bwriter = 'user6'
            where bno = i;
            update qna_reply 
            set rregdate =  sysdate - interval '1' day,
                rmoddate =  sysdate - interval '1' day,
                rwriter = 'user7'
            where bno = i;
        else
            update qna 
            set bregdate =  sysdate - interval '0' day,
            bwriter = 'user7'
            where bno = i;
            update qna_reply 
            set rregdate =  sysdate - interval '0' day,
                rmoddate =  sysdate - interval '0' day,
                rwriter = 'user8'
            where bno = i;
        end if;
    end loop;   
    
commit;
end;
/