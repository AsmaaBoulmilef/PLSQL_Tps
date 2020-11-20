CREATE OR REPLACE TRIGGER modifier_note
BEFORE UPDATE OF noteMin ON PREREQUI
BEGIN
RAISE_APPLICATION_ERREOR(-20306,'Impossible de modifier la note minimale');
END modifier_note;
/