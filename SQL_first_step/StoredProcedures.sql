-- Хранимые процедуры (Stored Procedures)
-- Это набор SQL-команд, сохранённых на сервере БД для многократного выполнения.

-- Могут принимать параметры и возвращать результаты.

CREATE OR REPLACE PROCEDURE update_salary(employee_id INT, increase_amount DECIMAL)
AS $$
BEGIN
  UPDATE employees
  SET salary = salary + increase_amount
  WHERE id = employee_id;
END;
$$ LANGUAGE plpgsql;

-- Вызов:
CALL update_salary(1, 1000);


