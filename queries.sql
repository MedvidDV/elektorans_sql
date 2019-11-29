#1 get a list of all employees, ordered by last name;

SELECT e.first_name, e.last_name FROM employee AS e
ORDER BY last_name;

#2 get average salary by employee

SELECT e.first_name, e.last_name,
       AVG(s.payment) AS average
FROM salary AS s
         INNER JOIN employee AS e on e.employee_id = s.employee_id
GROUP BY s.employee_id;

#3 get average and highest salary by position;

SELECT p.position_name,
       AVG(e.current_salary) AS average,
       MAX(e.current_salary) AS max_salary
FROM position AS p
         INNER JOIN employee AS e on p.position_id = e.position_id
WHERE e.current_salary IS NOT NULL
GROUP BY p.position_name;

#4 get total number of days every person worked and total income

SELECT e.first_name, e.last_name,
       COUNT(i.date) AS working_days,
       SUM(i.income) AS total_income
FROM income AS i
         INNER JOIN employee AS e on i.employee_id = e.employee_id
WHERE e.position_id = 4 AND (i.date BETWEEN '2019-10-01' AND '2019-10-30')
GROUP BY e.employee_id;

#5 get overall (total) income by transport, average income and a number of working days in the descending order

SELECT t.unit_number,
       SUM(i.income) AS total_income,
       AVG(i.income) AS average_income,
       COUNT(i.date) AS working_days
FROM income AS i
         INNER JOIN transport AS t on t.transport_id=i.transport_id
WHERE i.date BETWEEN '2019-09-01' AND '2019-09-30'
GROUP BY t.transport_id ORDER BY working_days DESC;

#6 get people who have birthday in May;

SELECT e.first_name, e.last_name, e.dob
FROM employee AS e
WHERE MONTHNAME(e.dob)='May';

#7 get a number of years every person works in `CherkasyElektroTrans`

SELECT e.first_name, e.last_name,
       IF(
               e.fire_date IS NULL,
               FLOOR(DATEDIFF(NOW(), e.hire_date)/365.25),
               FLOOR(DATEDIFF(e.fire_date, e.hire_date)/365.25)
           ) AS worked_years
FROM employee AS e
ORDER BY worked_years DESC ;
