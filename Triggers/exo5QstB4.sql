CREATE OR REPLACE TRIGGER controle_date_exame
BEFORE INSERT  ON RESULTAT
FOR EACH ROW
DECLARE
datexame date;
dateIscEtud date;
BEGIN
select dateExam into datexame
from EXAMEN
where codExam = :NEW.codExam;
select dateInsc into dateIscEtud
from INSCRIPTION
where numEtud = :NEW.numEtud and codMod = :NEW.codMod;
if dateInsc > =dateExam THEN
RAISE_APPLICATION_ERREOR(-20309,'Impossible la date d inscription est superier a la date d examen');
END IF;
END controle_date_exame ;
/