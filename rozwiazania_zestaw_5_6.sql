-- zestaw 5
-- 1
SELECT 
    e.first_name, e.last_name, e.job_id, j.job_title
FROM
    employees e
JOIN jobs j ON e.job_id = j.job_id;
-- 2
SELECT 
    COUNT(*), MAX(d.department_name)
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
WHERE
    YEAR(e.hire_date) BETWEEN 2005 AND 2006
GROUP BY e.department_id
ORDER BY d.department_name;
-- 3
SELECT COUNT(*), j.job_title FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY e.job_id
ORDER BY j.job_title DESC;

-- 4
SELECT 
    d.department_name, e.first_name, e.last_name, e.job_id
FROM
    employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.job_id NOT LIKE 'IT%';
-- 5
SELECT d.department_id, d.department_name, c.country_name, l.city, l.postal_code, l.street_address
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;
-- 6
SELECT COUNT(*), j.job_id, d.department_id, d.department_name FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON d.department_id = e.department_id
WHERE d.department_name LIKE 'S%';
-- 7
SELECT j.job_title, COUNT(*), d.department_name FROM employees e
JOIN jobs j ON j.job_id = e.job_id
JOIN departments d ON d.department_id = e.department_id
WHERE j.job_title LIKE '%Manager%'
GROUP BY e.department_id, e.job_id;
-- 8
SELECT * FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_ID IS NULL;
-- 9
SELECT d.department_name, e.employee_id FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;
-- 10
SELECT d.department_name, c.country_name FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON c.country_id = l.country_id;
-- 11
SELECT e.last_name, e.first_name, d.department_name, c.country_name FROM employees e
JOIN departments d ON d.department_id = e.department_id
JOIN locations l ON l.location_id = d.location_id
JOIN countries c ON c.country_id = l.country_id;
-- 12
SELECT e.salary, c.country_name
FROM employees e
JOIN departments d ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name != 'Canada';
-- 13
SELECT d.department_name, AVG(e.salary) FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY e.department_id
HAVING AVG(e.salary) BETWEEN 8000 AND 10000
ORDER BY AVG(e.salary) ASC;
-- 14
SELECT SUM(e.salary), c.country_name FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
GROUP BY c.country_id;
-- 15
SELECT d.department_name, AVG(e.salary) FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY e.department_id
HAVING AVG(e.salary) <= 5000
ORDER BY d.department_name;
-- 16
SELECT DISTINCT j.job_title FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Shipping' OR d.department_name = 'Marketing';
-- 17
SELECT COUNT(*), c.country_name FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
GROUP BY c.country_id
ORDER BY COUNT(*) DESC;

-- zestaw 6
-- 1
SELECT e.first_name, e.last_name, e.salary FROM employees e WHERE e.salary > (SELECT AVG(salary) FROM employees);
-- 2
SELECT * FROM employees WHERE department_id = (SELECT department_id FROM employees WHERE first_name = 'Alexis' AND last_name = 'Bull');
-- 3
SELECT 
    *
FROM
    employees
WHERE
    job_id IN(SELECT 
            job_id
        FROM
            employees
        WHERE
            last_name = 'Weiss');
SELECT 
    *
FROM
    employees
WHERE
    job_id IN(SELECT 
            job_id
        FROM
            employees
        WHERE
            last_name = 'King');
-- 4
SELECT 
    first_name, last_name, department_id
FROM
    employees
WHERE
    department_id IN (SELECT 
            department_id
        FROM
            employees
        WHERE
            last_name LIKE 'R%');
-- 5
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    department_id NOT IN (SELECT 
            department_id
        FROM
            employees
        WHERE
            last_name LIKE 'R%')
GROUP BY department_id;
-- 6
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    manager_id = (SELECT 
            employee_id
        FROM
            employees
        WHERE
            last_name = 'Hunold');
-- 7/8
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > ANY (SELECT 
            salary
        FROM
            employees
        WHERE
            department_id = 80);
-- 9
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > ALL (SELECT 
            e.salary
        FROM
            employees e
		JOIN departments d ON e.department_id = d.department_id
        WHERE
            d.department_name = 'Marketing');
-- 10
SELECT 
    first_name, last_name, salary, job_id
FROM
    employees
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees)
        AND job_id = (SELECT 
            job_id
        FROM
            employees
        WHERE
            last_name = 'Abel');
-- 11
SELECT
   COUNT(*), department_id
FROM
   employees
GROUP BY department_id
HAVING COUNT(*) = (SELECT
       COUNT(*)
   FROM
       employees
   GROUP BY department_id
   ORDER BY COUNT(*) DESC
   LIMIT 1);
-- 12
SELECT 
    COUNT(*), e.department_id, d.department_name
FROM
    employees e
        JOIN
    departments d ON d.department_id = e.department_id
GROUP BY department_id
HAVING COUNT(*) = (SELECT 
        COUNT(*)
    FROM
        employees
    GROUP BY department_id
    ORDER BY COUNT(*) DESC
    LIMIT 1);
-- 13
SELECT 
    MAX(stats.salary), stats.department_id
FROM
    (SELECT 
        AVG(salary) AS salary, department_id AS department_id
    FROM
        employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1) stats
GROUP BY stats.department_id;

-- 13 poprawka by pabloo99:
SELECT 
    MAX(e.salary), AVG(salary), e.department_id
FROM
    employees e
GROUP BY e.department_id
HAVING ROUND(AVG(salary), - 1) = (SELECT 
        ROUND(AVG(salary), - 1) AS salary
    FROM
        employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1);
    
-- 14 na poprawionej wersji:
SELECT 
    MAX(e.salary), AVG(salary), e.department_id, d.department_name
FROM
    employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY e.department_id
HAVING ROUND(AVG(salary), - 1) = (SELECT 
        ROUND(AVG(salary), - 1) AS salary
    FROM
        employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1);

-- drugie rozwiazanie: (NIE WIADOMO CZY DZIAŁA GDY SĄ 2 DEPARTAMENTY O TAKIEJ SAMEJ ŚREDNIEJ ZAROBKÓW)
SELECT 
    AVG(salary), department_id
FROM
    employees
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

/*SELECT
   AVG(salary), department_id
FROM
   employees
GROUP BY department_id
HAVING AVG(salary) = (SELECT AVG(salary) FROM employees GROUP BY department_id ORDER BY AVG(salary) DESC LIMIT 1);
*/

/*GROUP BY department_id
HAVING AVG(salary) = (SELECT
       AVG(salary)
   FROM
       employees
   GROUP BY department_id
   ORDER BY AVG(salary) DESC
   LIMIT 1);*/
-- 14
SELECT 
    MAX(d.salary), d.department_id, dep.department_name
FROM
    (SELECT 
        AVG(salary) AS 'salary', department_id AS 'department_id'
    FROM
        employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1) d
JOIN departments dep ON d.department_id = dep.department_id
GROUP BY d.department_id;
-- 15
SELECT 
    first_name, last_name, salary, department_id
FROM
    employees e
WHERE
    salary = (SELECT 
            MAX(emp.salary)
        FROM
            employees emp
        WHERE
            e.department_id = emp.department_id);
            
-- 16
SELECT 
    e.first_name,
    e.last_name,
    e.salary,
    e.department_id,
    d.department_name
FROM
    employees e
JOIN departments d ON e.department_id = d.department_id
WHERE
    e.salary = (SELECT 
            MAX(emp.salary)
        FROM
            employees emp
        WHERE
            e.department_id = emp.department_id);
-- 17
SELECT e.first_name, e.last_name, e.salary FROM employees e
ORDER BY e.salary DESC LIMIT 5;
-- 18
SELECT 
    first_name, last_name, hire_date
FROM
    employees
ORDER BY hire_date ASC
LIMIT 10;
-- 19
SELECT e.first_name, e.last_name, e.salary, e.job_id, j.job_title FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE LOWER(j.job_title) LIKE '%manager%'
ORDER BY salary DESC
LIMIT 5;
-- 20
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > (SELECT 
            MAX(salary)
        FROM
            employees
        WHERE
            job_id = 'IT_PROG');
-- 21
-- SELECT DATEDIFF("2017-06-25", "2017-06-15");
SELECT * FROM employees
WHERE hire_date = (SELECT MIN(hire_date) FROM employees);
-- 21 ROZWIAZANIE Z BRANIEM POD UWAGE TABELI JOB_HISTORY
SELECT p.employee_id, sum(p.days)
FROM
(SELECT 
    'employee', employee_id, (DATEDIFF(NOW(), hire_date)) days
FROM
    employees e 
UNION ALL SELECT 
    'job_history',
    employee_id,
    SUM(DATEDIFF(end_date, start_date)) days
FROM
    job_history
GROUP BY employee_id) p
GROUP BY p.employee_id
ORDER BY SUM(p.days) DESC;
-- 22
SELECT e.first_name, e.last_name, e.salary, e.job_id FROM employees e
WHERE (SELECT MAX(emp.salary) FROM employees emp WHERE e.job_id = emp.job_id GROUP BY emp.job_id);
-- 23
SELECT j.job_title, AVG(e.salary), e.job_id FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE (SELECT AVG(salary) FROM employees emp WHERE emp.job_id = e.job_id GROUP BY job_id) > (SELECT AVG(salary) FROM employees)
GROUP BY e.job_id
ORDER BY AVG(salary);
-- 24
SELECT first_name, last_name, salary FROM employees
WHERE salary < (SELECT AVG(salary) / 2 FROM employees);
-- 25
SELECT j.job_title, AVG(e.salary) FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY e.job_id
HAVING AVG(e.salary) > (SELECT AVG(e.salary) FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE j.job_title = 'Sales Manager');

-- ----------
SELECT 
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary > 6000 THEN 'zarabia więcej niż 6 tysięcy'
        WHEN salary = 6000 THEN 'zarabia równo 6 tysięcy'
        ELSE 'zarabia mniej niż 6 tysięcy'
    END
FROM
    employees;
    
-- --------- rozwiązanie drugie:
SELECT
   first_name,last_name,salary,
    IF(salary >= 6000,'zarabia 6 tysięcy lub więcej',
       'zarabia mniej niż 6 tysięcy')
FROM
   employees;