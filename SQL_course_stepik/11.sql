WITH t2 AS (
    SELECT
        id_employee,
        salary,
        id_manager
    FROM employee_salary 
)

SELECT
    t1.id_employee,
    t1.salary,
    t1.id_manager
FROM employee_salary t1
INNER JOIN t2 ON t1.id_manager = t2.id_employee
WHERE t1.salary > t2.salary;
