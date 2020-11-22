
CREATE TABLE `Proche`
(
 `procheID`         int NOT NULL ,
 `nom`              varchar(45) NOT NULL ,
 `prenom`           varchar(45) NOT NULL ,
 `numeroTelephone1` varchar(45) NULL ,
 `numeroTelephone2` varchar(45) NULL ,
 `courriel1`        varchar(45) NULL ,

PRIMARY KEY (`procheID`)
);


CREATE TABLE `Classe`
(
 `classeID`     int NOT NULL ,
 `denomination` varchar(45) NOT NULL ,
PRIMARY KEY (`classeID`)
);



CREATE TABLE `DomaineCompetence`
(
 `DomCompetenceID`  int NOT NULL ,
 `Dénomination`     varchar(45) NOT NULL ,

PRIMARY KEY (`DomCompetenceID`)
);



CREATE TABLE `Competence`
(
 `competenceID`     int NOT NULL ,
 `intitule`          varchar(45) NOT NULL ,
 `DomCompetenceID`  int NOT NULL ,

PRIMARY KEY (`competenceID`),
KEY `fkIdx_63` (`DomCompetenceID`),
CONSTRAINT `FK_63` FOREIGN KEY `fkIdx_63` (`DomCompetenceID`) REFERENCES `DomaineCompetence` (`DomCompetenceID`)
);

CREATE TABLE `Periode`
(
 `periodeID` int NOT NULL ,
 `intitulé`  varbinary(45) NOT NULL ,
 `dateDebut` date NOT NULL ,
 `dateFin`   date NOT NULL ,

PRIMARY KEY (`periodeID`)
);

CREATE TABLE `Professeur`
(
 `professeurID` int NOT NULL ,
 `nom`          varchar(45) NOT NULL ,
 `prenom`       varchar(45)  NOT NULL ,
 `photo`        blob NULL ,

PRIMARY KEY (`professeurID`)
);
CREATE TABLE `Eleve`
(
 `eleveID`       int NOT NULL ,
 `nom`           varchar(45) NOT NULL ,
 `prenon`        varbinary(45) NOT NULL ,
 `dateNaissance` date NOT NULL ,
 `photo`         blob NULL ,
 `classeID`      int NOT NULL ,

PRIMARY KEY (`eleveID`),
KEY `fkIdx_43` (`classeID`),
CONSTRAINT `FK_43` FOREIGN KEY `fkIdx_43` (`classeID`) REFERENCES `Classe` (`classeID`)
);

CREATE TABLE `Intervention`
(
 `professeurID` int NOT NULL ,
 `classeID`     int NOT NULL ,

PRIMARY KEY (`classeID`, `professeurID`),
KEY `fkIdx_49` (`professeurID`),
CONSTRAINT `FK_49` FOREIGN KEY `fkIdx_49` (`professeurID`) REFERENCES `Professeur` (`professeurID`),
KEY `fkIdx_52` (`classeID`),
CONSTRAINT `FK_52` FOREIGN KEY `fkIdx_52` (`classeID`) REFERENCES `Classe` (`classeID`)
);


CREATE TABLE `Responsabilite`
(
 `eleveID`        int NOT NULL ,
 `procheID`       int NOT NULL ,
 `dateDebutEffet` date NOT NULL ,
 `dateFinEffet`   date NOT NULL ,

PRIMARY KEY (`eleveID`, `procheID`),
KEY `fkIdx_30` (`eleveID`),
CONSTRAINT `FK_30` FOREIGN KEY `fkIdx_30` (`eleveID`) REFERENCES `Eleve` (`eleveID`),
KEY `fkIdx_33` (`procheID`),
CONSTRAINT `FK_33` FOREIGN KEY `fkIdx_33` (`procheID`) REFERENCES `Proche` (`procheID`)
);

CREATE TABLE `EvaluationCompetence`
(
 `dateEvaluation`  date NOT NULL ,
 `eleveID`        int NOT NULL ,
 `competenceID`   int NOT NULL ,
 `acquis`         tinyint NOT NULL ,
 `professeurID`   int NOT NULL ,
 `periodeID`      int NOT NULL ,
 `commentaires`   longtext NULL ,

PRIMARY KEY (`dateEvaluation`, `eleveID`, `competenceID`),
KEY `fkIdx_70` (`eleveID`),
CONSTRAINT `FK_70` FOREIGN KEY `fkIdx_70` (`eleveID`) REFERENCES `Eleve` (`eleveID`),
KEY `fkIdx_73` (`competenceID`),
CONSTRAINT `FK_73` FOREIGN KEY `fkIdx_73` (`competenceID`) REFERENCES `Competence` (`competenceID`),
KEY `fkIdx_76` (`professeurID`),
CONSTRAINT `FK_76` FOREIGN KEY `fkIdx_76` (`professeurID`) REFERENCES `Professeur` (`professeurID`),
KEY `fkIdx_88` (`periodeID`),
CONSTRAINT `FK_88` FOREIGN KEY `fkIdx_88` (`periodeID`) REFERENCES `Periode` (`periodeID`)
);









