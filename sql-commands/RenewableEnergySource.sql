create table RenewableEnergySource (
    id int auto_increment primary key,
    name varchar(255) not null
);

INSERT INTO `test-db`.RenewableEnergySource (id, name) VALUES (1, 'Geo Biomass Other - TWh');
INSERT INTO `test-db`.RenewableEnergySource (id, name) VALUES (2, 'Solar Generation - TWh');
INSERT INTO `test-db`.RenewableEnergySource (id, name) VALUES (3, 'Wind Generation - TWh');
INSERT INTO `test-db`.RenewableEnergySource (id, name) VALUES (4, 'Hydro Generation - TWh');
