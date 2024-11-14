CREATE TABLE Etudiant (
    NumCINEtu INT PRIMARY KEY,
    NomEtu VARCHAR(100) NOT NULL,
    PrenomEtu VARCHAR(100) NOT NULL,
    DateNaissance DATE,
    AdresseEtu VARCHAR(255),
    VilleEtu VARCHAR(100),
    NiveauEtu VARCHAR(50)
);

CREATE TABLE Session (
    CodeSess INT PRIMARY KEY,
    NomSess VARCHAR(100) NOT NULL,
    DateDebut DATE,
    DateFin DATE,
    CONSTRAINT chk_datefin CHECK (DateFin > DateDebut)  -- Ajout de la contrainte CHECK
);

CREATE TABLE Formation (
    CodeForm INT PRIMARY KEY,
    TitreForm VARCHAR(100) NOT NULL,
    DureeForm INT,
    PrixForm DECIMAL(10, 2)
);

CREATE TABLE Specialite (
    CodeSpec INT PRIMARY KEY,
    NomSpec VARCHAR(100) NOT NULL,
    DescSpec TEXT,
    Active BOOLEAN DEFAULT TRUE  -- Ajout de la colonne Active
);

CREATE TABLE EstInscrit (
    NumCINEtu INT,
    CodeSess INT,
    TypeCours VARCHAR(50) NOT NULL,  -- Ajout de la contrainte NOT NULL
    PRIMARY KEY (NumCINEtu, CodeSess),
    FOREIGN KEY (NumCINEtu) REFERENCES Etudiant(NumCINEtu),
    FOREIGN KEY (CodeSess) REFERENCES Session(CodeSess)
);

CREATE TABLE Concerne (
    CodeSess INT,
    CodeForm INT,
    PRIMARY KEY (CodeSess, CodeForm),
    FOREIGN KEY (CodeSess) REFERENCES Session(CodeSess),
    FOREIGN KEY (CodeForm) REFERENCES Formation(CodeForm)
);

CREATE TABLE Appartient (
    CodeForm INT,
    CodeSpec INT,
    PRIMARY KEY (CodeForm, CodeSpec),
    FOREIGN KEY (CodeForm) REFERENCES Formation(CodeForm),
    FOREIGN KEY (CodeSpec) REFERENCES Specialite(CodeSpec)
);
