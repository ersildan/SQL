SELECT
  to_char(birth_dt, 'DD/fmMonth') as birthday,
  employee_id,
  employee_name
FROM employees
WHERE birth_dt IN (
  SELECT birth_dt
  FROM employees
  GROUP BY birth_dt
  HAVING COUNT(*) > 1
  )
ORDER BY birth_dt;