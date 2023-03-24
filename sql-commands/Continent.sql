create table Continent (
    id int auto_increment primary key,
    name varchar(255) not null,
    isoCode varchar(255) null,
    constraint id unique (id)
);

INSERT INTO `test-db`.Continent (id, name, isoCode) VALUES (1, 'Asia', 'AS');
INSERT INTO `test-db`.Continent (id, name, isoCode) VALUES (2, 'Europe', 'EU');
INSERT INTO `test-db`.Continent (id, name, isoCode) VALUES (3, 'Latin America and the Caribbean', 'SA');
INSERT INTO `test-db`.Continent (id, name, isoCode) VALUES (4, 'Northern America', 'NA');
INSERT INTO `test-db`.Continent (id, name, isoCode) VALUES (5, 'Africa', 'AF');
INSERT INTO `test-db`.Continent (id, name, isoCode) VALUES (6, 'Oceania', 'OC');
