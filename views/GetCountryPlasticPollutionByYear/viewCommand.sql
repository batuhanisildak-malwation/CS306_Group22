create definer = root@`%` view GetCountryPlasticPollutionByYear as
select `C`.`name` AS `Country Name`, `P`.`amount` AS `Amount`, `P`.`amountUnit` AS `Amount Unit`, `Y`.`value` AS `Year`
from ((`test-db`.`Pollution` `P` join `test-db`.`Country` `C`
       on ((`P`.`countryId` = `C`.`id`))) join `test-db`.`Year` `Y` on ((`P`.`yearId` = `Y`.`id`)))
where (`P`.`type` = 'Plastic Pollution');