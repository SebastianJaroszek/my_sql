-- 1
DESCRIBE employees;
-- 2
SELECT
	*
FROM
	regions;
-- 3
SELECT
	first_name, last_name, salary
FROM
	employees;
-- 4
SELECT 
    e.first_name AS 'imię', last_name AS 'nazwisko'
FROM
    employees e;
-- 5
SELECT * FROM countries;
SELECT department_name FROM departments;
SELECT hire_date as 'data zatrudnienia' FROM employees;
SELECT first_name,last_name FROM employees;
-- 6
SELECT CONCAT(first_name, " ", last_name) AS 'imię i nazwisko' FROM employees;
-- 7
SELECT * FROM employees ORDER BY last_name, first_name ASC;
employees-- 8
SELECT * FROM employees ORDER BY last_name, first_name DESC;
-- 9
SELECT last_name, salary FROM employees ORDER BY salary DESC;
-- 10
SELECT first_name, last_name, salary FROM employees ORDER BY salary ASC;
SELECT first_name, last_name, salary FROM employees ORDER by last_name DESC;
-- 11
SELECT DISTINCT last_name FROM employees;
-- 12
SELECT * FROM employees WHERE last_name='Chen';
-- 13
SELECT last_name, salary FROM employees WHERE salary<3000;
-- 14
SELECT first_name, last_name, salary FROM employees WHERE salary BETWEEN 3000 AND 8000;
-- 15
SELECT DISTINCT job_id FROM employees;
-- 16
SELECT first_name, last_name, hire_date, salary FROM employees WHERE salary NOT BETWEEN 4000 AND 12000 ORDER BY salary ASC;
-- 17
SELECT * FROM employees WHERE employee_id IN(100, 102, 105, 107);
-- 18
SELECT last_name, salary, commission_pct FROM employees WHERE last_name LIKE 'M%';
-- 19
SELECT first_name, last_name FROM employees WHERE last_name LIKE 'a%' OR last_name LIKE 'b%' OR last_name LIKE 'c%';
SELECT first_name, last_name FROM employees WHERE last_name LIKE '%i%' OR last_name LIKE '%a%' OR last_name LIKE '%o%';
-- 20
SELECT first_name, last_name, department_id FROM employees WHERE department_id=60;
-- 21
SELECT * FROM employees WHERE commission_pct IS NULL;
-- 22
SELECT first_name, last_name FROM employees WHERE first_name LIKE '_e%';
-- 23
SELECT DISTINCT department_id FROM employees;
-- 24
SELECT first_name, last_name, salary FROM employees WHERE salary > 9000;
-- 25
SELECT first_name, last_name, salary+(salary*0.2) FROM employees WHERE department_id = 50;
-- 26
SELECT * FROM employees WHERE department_id = 60;
-- 27
SELECT * FROM departments WHERE location_id > 1500;
-- 28
SELECT * FROM countries WHERE country_name LIKE 'S%';
-- 29
SELECT DISTINCT country_id FROM countries;
-- 30
SELECT country_name FROM countries ORDER BY country_name ASC;
-- 31
SELECT last_name AS 'nazwisko', hire_date AS 'data zatrudnienia', salary AS 'wynagrodzenie', salary+2000 AS 'wynagrodzenie z premią' FROM employees;

-- zestaw 2
-- 1
SELECT CONCAT(first_name, ' ', last_name) AS 'OSOBA', salary AS 'PENSJA' FROM employees;
-- 2
SELECT first_name, last_name, department_id FROM employees WHERE department_id=100;
-- 3
SELECT first_name, last_name, job_id FROM employees WHERE job_id != 'IT_PROG';
-- 4
SELECT NOW();
-- 5
SELECT first_name, last_name, hire_date FROM employees;
-- 6
SELECT first_name, last_name, hire_date FROM employees WHERE YEAR(hire_date)>2005 ORDER BY hire_date;
-- 7
SELECT first_name, last_name, hire_date FROM employees WHERE YEAR(hire_date)=2007 ORDER BY hire_date;
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date BETWEEN STR_TO_DATE('2007-01-01', '%Y-%m-%d') AND STR_TO_DATE('2007-12-31', '%Y-%m-%d') ORDER BY hire_date;
-- 8
SELECT * FROM employees WHERE salary BETWEEN 6000 AND 8000;
SELECT * FROM employees WHERE salary >= 6000 AND salary <= 8000;
-- 9
SELECT * FROM departments WHERE manager_id IS NULL;
-- 10
SELECT * FROM employees ORDER BY salary DESC;
-- 11
SELECT * FROM employees WHERE department_id = 60 ORDER BY salary DESC;
-- 12
SELECT * FROM employees WHERE department_id IN(50, 60, 100);
SELECT * FROM employees WHERE department_id = 50 OR department_id = 60 OR department_id = 100;
-- 13
SELECT * FROM employees WHERE department_id IN(70, 80, 110) AND salary NOT BETWEEN 5000 AND 9000 ORDER BY salary ASC;
-- 14
SELECT first_name, last_name, hire_date, salary, job_id FROM employees WHERE job_id='ST_CLERK' AND YEAR(hire_date) NOT BETWEEN 2004 AND 2005;
-- 15
SELECT * FROM employees WHERE manager_id IS NULL;
-- 16
SELECT DISTINCT first_name FROM employees ORDER BY first_name;
-- 17
SELECT department_name FROM departments WHERE department_name NOT LIKE '__m%';
-- 18
SELECT * FROM employees WHERE email LIKE '%G' AND department_id IN (90, 110);
-- 19
SELECT * FROM departments WHERE location_id != 1700;
-- 20
SELECT DISTINCT first_name FROM employees WHERE first_name LIKE 'K%' OR first_name LIKE 'A%' ORDER BY first_name;
-- 21
SELECT first_name, last_name, salary+(salary*0.2), department_id FROM employees WHERE department_id IN(50, 60, 80);
-- 22
SELECT * FROM locations WHERE postal_code IS NULL;
-- 23
SELECT * FROM departments WHERE location_id > 2000;
-- 24
SELECT * FROM locations WHERE city NOT LIKE 'T%' AND city NOT LIKE 'B%';
-- 25
SELECT min_salary, max_salary FROM jobs;
-- 26
SELECT job_title, min_salary, min_salary+(min_salary*0.1) FROM jobs ORDER BY min_salary ASC;
-- 27
SELECT 
    job_title,
    max_salary,
    min_salary,
    max_salary - min_salary AS 'ROZNICA'
FROM
    jobs
ORDER BY max_salary - min_salary;
-- 28
SELECT DISTINCT location_id FROM departments;
-- 29
SELECT region_name FROM regions ORDER BY region_name ASC;
-- 30
SELECT min_salary, max_salary, job_title FROM jobs WHERE job_title LIKE 'Sale%';


-- ----
SELECT * FROM employees WHERE employee_id = 500;
select count(*) from employees where department_id=60;

SELECT e.* FROM departments d
JOIN employees e ON d.manager_id = e.employee_id
WHERE d.department_id = 10;

select * from employees where employee_id = 606;
select * from countriesemployee_historyemployee_historyemployee_historyoperation_typeoperation_dateusernameemployee_idjob_historyjobslocations;
select Count(*) from employees where department_id = 60;
select * from locations;
select * from countries;
select * from regions;

select * from employees where department_id = 60;

select * from regions;

SELECT * FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries co ON l.country_id = co.country_id
JOIN regions r ON co.region_id = r.region_id
WHERE d.department_id = 60;

SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);