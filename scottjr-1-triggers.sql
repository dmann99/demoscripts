CONNECT scottjr/tiger
set sqlblanklines on


create table emp_audit as select * from emp where 0=1;
alter table emp_audit add (
      trans_timestamp timestamp,
      trans_op varchar2(3),
      trans_user varchar2(20));


CREATE OR REPLACE TRIGGER tr_emp_audit
AFTER INSERT OR DELETE OR UPDATE ON emp
FOR EACH ROW
DECLARE
    v_operation VARCHAR2(10) := NULL;
BEGIN
    IF INSERTING THEN
        v_operation := 'INS';
    ELSIF UPDATING THEN
        v_operation := 'UPD';
    ELSE
        v_operation := 'DEL';
    END IF;

    insert into emp_audit (
        empno,
        ename,
        job,
        mgr,
        hiredate,
        sal,
        comm,
        deptno,
        trans_timestamp,
        trans_op,
        trans_user
    ) VALUES (
        :new.empno,   :new.ename,
        :new.job,      :new.mgr,
        :new.hiredate, :new.sal,
        :new.comm,     :new.deptno,
        sysdate,
        v_operation,
        user
    );
END;
/

create table dept_audit as select * From dept where 0=1;
alter table dept_audit add (
      trans_timestamp timestamp,
      trans_op varchar2(3),
      trans_user varchar2(20));


CREATE OR REPLACE TRIGGER tr_dept_audit
AFTER INSERT OR DELETE OR UPDATE ON dept
FOR EACH ROW
DECLARE
    v_operation VARCHAR2(10) := NULL;
BEGIN
    IF INSERTING THEN
        v_operation := 'INS';
    ELSIF UPDATING THEN
        v_operation := 'UPD';
    ELSE
        v_operation := 'DEL';
    END IF;

    insert into dept_audit (
        deptno,
        dname,
        loc,
        trans_timestamp,
        trans_op,
        trans_user
    ) VALUES (
        :new.deptno,
        :new.dname,
        :new.loc,
        sysdate,
        v_operation,
        user
    );
END;
/

select * from dept_audit;
update dept set loc='NEW YORK' where deptno=40;
COMMIT;
select * from dept_audit;
