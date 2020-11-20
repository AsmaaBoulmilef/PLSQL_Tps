CREATE TABLE ETUDIANT(numEtud int primary key,
                                             nom varchar(25),
                                             prenom varchar(25),
                                             datenaiss date,
                                            civilite VARCHAR(5) CHECK( civilite IN ('Mr','Mme','Mlle') ),
                                              numsecu int not null);

CREATE TABLE MODULE(codMod VARCHAR(4) primary key,
                                             nomMod varchar(30),
                                            effecMax int default 30);

CREATE TABLE EXAMEN(codExam VARCHAR(6) primary key,
                                             dateExam date,
                                            codMod VARCHAR(4),
                                            foreign key (codMod) references MODULE(codMod));

CREATE TABLE INSCRIPTION (numEtud int,                       
                                                  codMod VARCHAR(4),
                                                  dateInsc date default SYSDATE,
                                                  primary key (numEtud,codMod),
                                                  foreign key (numEtud) references ETUDIANT(numEtud), 
                                                  foreign key (codMod) references MODULE(codMod)); 

CREATE TABLE PREREQUI(codModPrereq VARCHAR(6) primary key,
                                            codMod VARCHAR(4),
                                             noteMin number not null,
                                            foreign key (codMod) references MODULE(codMod));   

CREATE TABLE RESULTAT       (codMod VARCHAR(4),
                                                  codExam VARCHAR(6),                      
                                                  numEtud int,
                                                  note number,
                                                  primary key (codMod,codExam,numEtud),
                                                  foreign key (codMod) references MODULE(codMod),
                                                  foreign key (codExam) references EXAMEN(codExam),
                                                  foreign key (numEtud) references ETUDIANT(numEtud));
                                                   
                                      