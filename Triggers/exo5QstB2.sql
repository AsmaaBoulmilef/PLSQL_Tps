select * from INSCRIPTION view as inscri;

CREATE OR REPLACE TRIGGER effective
BEFORE INSERT  ON INSCRIPTION
FOR EACH ROW
DECLARE
nbrEtude int;
effective MODULE. effecMax%TYPE;
module MODULE.codMod%TYPE;
BEGIN
select codMod, count(*) into module, nbrEtude
from inscri
where codMod = :NEW.codMod
group by codMod;
select effecMax into effective
from MODULE
where codMod= :NEW.codMod;
if effective = nbrEtude THEN
RAISE_APPLICATION_ERREOR(-20307,'Impossible d inserer un etudiant');
END IF;
END effective;
/

