CREATE TABLE Continent (
    id int NOT NULL IDENTITY(1,1),
    name varchar(255) NOT NULL,
    isoCode varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE Country (
    id int NOT NULL IDENTITY(1,1),
	continentId int NOT NULL,
    name varchar(255) NOT NULL,
    isoCode varchar(255),
	FOREIGN KEY(continentId) REFERENCES Continent(id),
    PRIMARY KEY (id)
);

CREATE TABLE Generation (
    id int NOT NULL IDENTITY(1,1),
	year int NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE DeathCause (
    id int NOT NULL IDENTITY(1,1),
	name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE RenewableEnergySource (
    id int NOT NULL IDENTITY(1,1),
	name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Pollution (
    id int NOT NULL IDENTITY(1,1),
	countryId int NOT NULL,
	generationId int NOT NULL,
	pollutionType varchar(255) NOT NULL,
	amount int NOT NULL,
	amountUnit varchar(255) NOT NULL,
	FOREIGN KEY(generationId) REFERENCES Generation(id),
	FOREIGN KEY(countryId) REFERENCES Country(id),
    PRIMARY KEY (id)
);

CREATE TABLE Death (
    id int NOT NULL IDENTITY(1,1),
	countryId int NOT NULL,
	generationId int NOT NULL,
	deathCauseId int NOT NULL,
	count int NOT NULL,
	FOREIGN KEY(generationId) REFERENCES Generation(id),
	FOREIGN KEY(countryId) REFERENCES Country(id),
	FOREIGN KEY(deathCauseId) REFERENCES DeathCause(id),
    PRIMARY KEY (id)
);

CREATE TABLE Population (
    id int NOT NULL IDENTITY(1,1),
	countryId int NOT NULL,
	generationId int NOT NULL,
	amount int NOT NULL,
	FOREIGN KEY(generationId) REFERENCES Generation(id),
	FOREIGN KEY(countryId) REFERENCES Country(id),
    PRIMARY KEY (id)
);

CREATE TABLE Uses (
    id int NOT NULL IDENTITY(1,1),
	countryId int NOT NULL,
	renewableEnergySourceId int NOT NULL,
	amount int NOT NULL,
	FOREIGN KEY(renewableEnergySourceId) REFERENCES RenewableEnergySource(id),
	FOREIGN KEY(countryId) REFERENCES Country(id),
    PRIMARY KEY (id)
);