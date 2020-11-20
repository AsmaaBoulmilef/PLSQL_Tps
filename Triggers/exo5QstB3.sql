CREATE OR REPLACE TRIGGER insert_exame
BEFORE INSERT  ON EXAMEN
FOR EACH ROW
DECLARE
nbrEtude int default 0;
module INSCRIPTION.codMod%TYPE;
BEGIN
select codMod, count(*) into module, nbrEtude
from INSCRIPTION
where codMod = :NEW.codMod
group by codMod;
if nbrEtude =0 THEN
RAISE_APPLICATION_ERREOR(-20308,'Impossible d ajouter un examen pour ce module');
END IF;
END insert_exame ;
/