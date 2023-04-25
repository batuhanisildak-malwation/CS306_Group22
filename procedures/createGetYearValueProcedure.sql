CREATE PROCEDURE getYearValue
    (IN yearId INT)
BEGIN
    SELECT value
    FROM Year
    WHERE Id = yearId;
END

CALL getYearValue(1);