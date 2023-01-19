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
        values (i, '������ �־��', '�ٸ� ��������, �츮�� �������� ����� �ŷ¿� �ʹ� ��Ȥ�Ǿ� ��⸦ ���� ����� �ʹ� ���� �־� ������ ��ĥ ����� ������ ������ �� ���� ������� ������ �а��� ���ϰ� �Ⱦ��մϴ�. å���� ������ ���ؼ� �ǹ��� ������ ���� ���� ���̸�, �̴� ����� ���뿡�� ����Ǿ� ���ϴ� �Ͱ� �����ϴ�. �̷��� ���� �ſ� �����ϰ� �����ϱ� �����ϴ�. �츮�� ���� �����ϴ� ���� �� �� �ִ� ���� �����ϴ� ���� �ƹ��͵� ���� �� ��� ����� ȯ���ް� ��� ������ ���ؾ� �մϴ�.�׷��� Ư�� ��Ȳ���� �׸��� �ǹ� �Ǵ� ����Ͻ� �ǹ��� ���� ����� �ź��ؾ� �ϴ� ��찡 ���� �߻��մϴ�. �׸��� �������� �޾� �鿴���ϴ�.�׷��Ƿ� ������ ����� �� �������� �׻� �� ������ ��Ģ�� ����մϴ�: �״� �ٸ� �� ū ����� ��� ���� ����� �ź��ϰų�, �׷��� ������ �� ���� ������ ���ϱ� ���� ������ �����ϴ�.',
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