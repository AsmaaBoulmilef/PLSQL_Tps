CREATE OR REPLACE TRIGGER inscription_etud
BEFORE INSERT  ON INSCRIPTION
FOR EACH ROW
DECLARE
CURSOR note_etudiant IS
select codModPrereq ,noteMin 
from PREREQUI
WHERE  codMod = :NEW.codMod;
moyenne float default 0.0;
BEGIN
FOR record_note IN note_etudiant LOOP
select avg(note) into moyenne 
from RESULTAT
where codMod = record_note.codModPrereq and numEtud = :NEW.numEtud ;
if moyenne < record_note.noteMin THEN
RAISE_APPLICATION_ERREOR(-20310,'Etudiant n a pas encore valide son module');
END IF;
END LOOP;
END  inscription_etud ;
/