-- Аналогичны процедурам, но всегда возвращают значение.
-- Могут использоваться в SQL-запросах.


CREATE OR REPLACE FUNCTION get_employee_name(employee_id INT)
RETURNS VARCHAR AS $$
BEGIN
  RETURN (SELECT name FROM employees WHERE id = employee_id);
END;
$$ LANGUAGE plpgsql;

-- Вызов:
SELECT get_employee_name(1);