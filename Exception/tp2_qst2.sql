ACCEPT num_emp PROMPT 'entrer un numero:'
DECLARE
TYPE record_empl IS RECORD(
num hr.employees.EMPLOYEE_ID%TYPE,
prenom hr.employees.FIRST_NAME%TYPE,
nom hr.employees.LAST_NAME%TYPE,
salaire hr.employees.SALARY%TYPE,
nom_dep hr.departments.DEPARTMENT_NAME%TYPE);
empl record_empl;
emp_num varchar(4);
ID_empty EXCEPTION;

BEGIN
emp_num :='&num_emp';
    if emp_num IS NULL THEN
      RAISE ID_empty;
    else
        select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_NAME  
        into empl from hr.employees,hr.departments
        where employees.DEPARTMENT_ID = departments.DEPARTMENT_ID and EMPLOYEE_ID=emp_num;
    
       DBMS_OUTPUT.PUT_LINE('le numero:'||empl.num);
       DBMS_OUTPUT.PUT_LINE('le prenom:'||empl.prenom);
       DBMS_OUTPUT.PUT_LINE('le nom:'||empl.nom);
       DBMS_OUTPUT.PUT_LINE('le salaire:'||empl.salaire);
       DBMS_OUTPUT.PUT_LINE('le nom de departement:'||empl.nom_dep);
    END IF;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('oups employee inexistant');
WHEN ID_empty THEN
DBMS_OUTPUT.PUT_LINE('oblige de saisir un numero');
END;
/