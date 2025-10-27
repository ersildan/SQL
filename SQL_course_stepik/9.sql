SELECT
    id_employee,
    department,
    salary,
    ROUND((salary / SUM(salary) OVER (PARTITION BY department))*100) AS salary_proc
FROM salary
ORDER BY id_employee;
