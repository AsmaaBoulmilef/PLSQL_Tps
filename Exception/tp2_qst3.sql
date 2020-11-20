ACCEPT num_dep PROMPT 'entrer un numero de departement:'
DECLARE
SUPPR_inter EXCEPTION;
PRAGMA EXCEPTION_INIT(SUPPR_inter,-2292);
BEGIN
DELETE from hr.departments 
where DEPARTMENT_ID=&num_dep;
COMMIT;
EXCEPTION
WHEN SUPPR_inter THEN
DBMS_OUTPUT.PUT_LINE('attention on ne pas supprimer le departement contient des employees');
END;
/