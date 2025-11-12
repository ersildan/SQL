SELECT
    id_employee,
    department,
    salary
FROM salary
WHERE salary = (
    SELECT
        MAX(salary)
    FROM salary
);