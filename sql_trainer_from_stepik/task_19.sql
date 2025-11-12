SELECT
	to_char(birth_dt, 'DD/fmMonth'),
	employee_id,
	employee_name
FROM employees
WHERE (CURRENT_DATE - birth_dt)/365 > 18;