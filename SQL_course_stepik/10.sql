WITH t AS (
    SELECT department, 
    MAX(salary) AS salary
    FROM salary
    GROUP BY department
)

SELECT 
    s.id_employee,
    s.department,
    s.salary
FROM salary s
INNER JOIN t USING(department)
WHERE t.salary = s.salary;
