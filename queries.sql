#1 get a list of all employees, ordered by last name; Before optz 50ms

EXPLAIN
SELECT SQL_NO_CACHE e.first_name, e.last_name FROM employee AS e
ORDER BY last_name;

#2 get average salary by employee; Before optz 73ms

EXPLAIN
SELECT SQL_NO_CACHE e.first_name, e.last_name,
       AVG(s.payment) AS average
FROM salary AS s
         INNER JOIN employee AS e on e.employee_id = s.employee_id
GROUP BY s.employee_id;

#3 get average and highest salary by position; Before optz 62ms

EXPLAIN
SELECT SQL_NO_CACHE p.position_name,
       AVG(e.current_salary) AS average,
       MAX(e.current_salary) AS max_salary
FROM position AS p
         INNER JOIN employee AS e on p.position_id = e.position_id
WHERE e.current_salary IS NOT NULL
GROUP BY p.position_id;

#4 get total number of days every person worked and total income; Before optz 100ms, AFTER - 47ms

EXPLAIN
SELECT SQL_NO_CACHE e.first_name, e.last_name,
       COUNT(DISTINCT i.date) AS working_days,
       SUM(i.income) AS total_income
FROM income AS i
         INNER JOIN employee AS e on i.employee_id = e.employee_id
WHERE e.position_id = 4 AND (i.date BETWEEN '2019-10-01' AND '2019-12-30')
GROUP BY e.employee_id;

ALTER TABLE income ADD INDEX `INCOME_DATE` (date);


#5 get overall (total) income by transport, average income and a number of working days in the descending order; Before optz 119ms, AFTER - 47ms
EXPLAIN
SELECT SQL_NO_CACHE t.unit_number,
       SUM(i.income) AS total_income,
       AVG(i.income) AS average_income,
       COUNT(DISTINCT i.date) AS working_days
FROM income AS i
         INNER JOIN transport AS t on t.transport_id=i.transport_id
WHERE i.date BETWEEN '2019-09-01' AND '2019-12-15'
GROUP BY t.transport_id ORDER BY total_income DESC, average_income DESC, working_days DESC;

#6 get people who have birthday in May; Before optz 53ms

EXPLAIN
SELECT SQL_NO_CACHE e.first_name, e.last_name, e.dob
FROM employee AS e
WHERE MONTHNAME(e.dob)='May';

#7 get a number of years every person works in `CherkasyElektroTrans`; Before optz 76ms

EXPLAIN
SELECT SQL_NO_CACHE e.first_name, e.last_name,
       IF(
               e.fire_date IS NULL,
               ROUND(DATEDIFF(NOW(), e.hire_date)/365.25, 1),
               ROUND(DATEDIFF(e.fire_date, e.hire_date)/365.25, 1)
           ) AS worked_years
FROM employee AS e
ORDER BY worked_years DESC;

