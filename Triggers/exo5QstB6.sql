CREATE OR REPLACE TRIGGER insert_view
BEFORE INSERT ON myview
FOR EACH ROW
DECLARE
nbrmodule int default 0;
nbrexame int default 0;
BEGIN
select count(*) into nbrmodule
from INSCRIPTION,EXAME
where INSCRIPTION.codMod = EXAME.codMod
and numEtud =:NEW.numEtud;
select count(*) into nbrexame
from RESULTAT
where numEtud =:NEW.numEtud;
if nbrmodule != nbrexame THEN
RAISE_APPLICATION_ERREOR(-20500,'etudiant n pas encore passer des examens');
END IF;
END insert_view;
/
