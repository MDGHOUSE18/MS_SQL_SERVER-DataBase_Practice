--Control-of-flow statements


CREATE OR ALTER PROCEDURE TotalSales
	@ID INT
AS
BEGIN
	DECLARE @Sales INT;

	SELECT @Sales=SUM(TotalAmount)
	FROM Orders
	WHERE OrderID=@ID;

	SELECT  @Sales TotalAmount;

	IF @Sales>50000
	BEGIN
		PRINT CAST(@ID AS VARCHAR(2)) + ' is a Prime Member';
	END
	ELSE
	BEGIN
		PRINT CAST(@ID AS VARCHAR(2)) + ' is not a Prime Member';
	END
END;

EXECUTE TotalSales 55;


--WHILE – repeatedly execute a set of statements based on a condition as long as the condition is true.

--WHILE Boolean_expression   
--     { sql_statement | statement_block}  

--BREAK – exit the loop immediately and skip the rest of the code after it within a loop.
DECLARE @counter INT = 1;

WHILE @counter <= 5
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END

--WHILE Boolean_expression
--BEGIN
--    -- statements
--   IF condition
--        BREAK;
--    -- other statements    
--END
DECLARE @counter INT = 0;

WHILE @counter <= 5
BEGIN
    SET @counter = @counter + 1;
    IF @counter = 4
        BREAK;
    PRINT @counter;
END

--CONTINUE – skip the current iteration of the loop immediately and continue the next one.
--WHILE Boolean_expression
--BEGIN
--    -- code to be executed
--    IF condition
--        CONTINUE;
--    -- code will be skipped if the condition is met
--END

DECLARE @counter INT = 0;

WHILE @counter < 5
BEGIN
    SET @counter = @counter + 1;
    IF @counter = 3
        CONTINUE;	
    PRINT @counter;
END


