CREATE OR REPLACE TRIGGER verification_salaire
BEFORE INSERT OR UPDATE OF salary ON hr.employees
FOR EACH ROW
DECLARE
min  hr.jobs.MIN_SALARY%TYPE;
max  hr.jobs.MAX_SALARY%TYPE;
BEGIN
IF :NEW.job_id != 'AD_PRES' THEN
SELECT  MIN_SALARY,MAX_SALARY INTO min , max
from hr.jobs
where job_id = :NEW.job_id;
IF :NEW.salary not between min and max THEN
   RAISE_APPLICATION_ERROR(-20305,'Le salaire n appartient pas à la fourchette de job');
END IF;
END IF;
END verification_salaire;
/