-- Автоматически выполняются при определённых событиях (INSERT, UPDATE, DELETE).

CREATE OR REPLACE FUNCTION log_changes()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO audit_log (table_name, action, record_id, change_time)
  VALUES (TG_TABLE_NAME, TG_OP, NEW.id, NOW());
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER employees_audit
AFTER INSERT OR UPDATE OR DELETE ON employees
FOR EACH ROW EXECUTE FUNCTION log_changes();

