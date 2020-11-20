CREATE OR REPLACE TRIGGER employe_embauche
BEFORE INSERT ON hr.employees
FOR EACH ROW
BEGIN
IF :NEW.hire_date > CURRENT_DATE 
THEN RAISE_APPLICATION_ERROR(-20304,'La date dembauche est supérieur à la date système');
END IF;
END employe_embauche;
/