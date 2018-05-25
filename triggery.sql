select * from employee_history;

select * from employees;

insert into employees(employee_id,first_name,last_name,email,hire_date,job_id)
VALUES(1001,'Sebastian', 'Jaroszek', 'bastian2@emstories.pl', now(), 'IT_PROG');

DELETE FROM employees WHERE employee_id = 1001;

UPDATE employees SET email = 'bastian@emstories.pl' WHERE employee_id = 1001;