CREATE OR REPLACE TRIGGER employe_insert
BEFORE INSERT ON hr.employees
FOR EACH ROW
BEGIN
IF :NEW.salary<5000 THEN
:NEW.salary := 5000;
END IF;
END employe_insert;
/