delimiter //
CREATE TRIGGER year_check BEFORE INSERT ON Year
FOR EACH ROW
BEGIN
  IF NEW.value < 1900 THEN
    SET NEW.value = 1900;
  ELSEIF NEW.value > 2100 THEN
    SET NEW.value = 2100;
  END IF;
END;//
delimiter ;

delimiter //
CREATE TRIGGER year_check BEFORE UPDATE ON Year
FOR EACH ROW
BEGIN
  IF NEW.value < 1900 THEN
    SET NEW.value = 1900;
  ELSEIF NEW.value > 2100 THEN
    SET NEW.value = 2100;
  END IF;
END;//
delimiter ;