SELECT
    department,
    ROUND(AVG(salary)) AS average_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM salary
GROUP BY department;
