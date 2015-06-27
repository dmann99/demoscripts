connect scottjr/tiger

select * from dept_audit;
update dept set loc='NEW YORK' where deptno=40;
COMMIT;
select * from dept_audit;
