create table history(employee_id number(6) NOT NULL,
                               operation_date date,
                               operation_type VARCHAR(15));

CREATE OR REPLACE TRIGGER insert_history
AFTER INSERT OR UPDATE OR DELETE ON hr.employees
FOR EACH ROW
BEGIN
IF inserting THEN
insert into history values(:NEW.employee_id,sysdate,'inserting');
ELSIF updating THEN
insert into history values(:NEW.employee_id,sysdate,'updating');
ELSE 
insert into history values(:OLD.employee_id,sysdate,'deleting');
END IF;
END insert_history;
/