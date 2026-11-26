### Looping in a stored procedure ###

DROP PROCEDURE IF EXISTS PRINTING_NUMBERS_WHIE_LOOP;
DELIMITER $$
CREATE PROCEDURE PRINTING_NUMBERS_WHIE_LOOP()
BEGIN 
	SET NOCOUNT ON;
    DECLARE @i INT = 1;
    WHILE @i <= @Max
    BEGIN
		PRINT CONCAT('Pass ', @i, ' of ', @Max);
	END;
    
    -- Controling a WHILE Loop With BREAK and CONTINUE
    SET NEWCOUNT ON;
    DECLARE @i INT = 0;
    WHILE @i < 10
    BEGIN
		SET @i += 1;
        IF @i %2 = 0 CONTINUE;
        IF @i > 7 BREAK;
        PRINT CONCAT ('Odd:', @i);
	END;
    PRINT CONCAT('Left the loop with @i=',@i);
    
    -- Nested WHILE Loops and Which Loop BREAK Exits
    SET BREAKCOUNT ON;
    DECLARE @row INT = 1, @col INT, @line VARCHR(20);
    WHILE @row <= 3
    BEGIN 
		SELECT @col = 1, @line = CONCAT('Row', @row, ':');
        WHILE 1 = 1
        BEGIN
			IF @col > @row BREAK;
            SET @line = CONCAT (@line, '', @col);
            SET @col += 1;
		END;
        PRINT @line;
        SET @row += 1;
	END;
END;
$$
DELIMITER ;
START TRANSACTION;
CALL PRINTING_NUMBERS_WHIE_LOOP ();


### How to Do a FOREACH Loop in SQL Server ###
-- A FOREACH loop in SQL Server means "do this for every row." You've got two loop options, a cursor or a WHILE over a keyed table variable.
--  Both use the same customers table.

DROP PROCEDURE IF EXISTS LIST_BALANCES;
CREATE PROCEDURE LIST_BALANCES()
BEGIN
	SET NOCOUNT ON;
    DECLARE @name NVARCHAR(16), @bal DECIMAL(10, 2), @total
    DECIMAL (10,2) = 0;
    DECLARE CUR CURSOR LOCAL FAST FORWARD FOR
		SELECT FullName, Balance FROM dbo.Customers
        WHERE Balance > 0 ORDER BY Balance DESC;
	OPEN CUR;
    FETCH NEXT FROM CUR INTO @name, @bal;
    WHILE @@FETCH STATUS = 0
    BEGIN
		PRINT CONCAT(@name, ': $', @bal);
        SET @total += @bal;
        FETCH NEXT FROM CUR INTO @name, @bal;
	END;
    PRINT CONCAT ('@@FETCH_STATUS now: ', @@FETCH_STATUS);
    CLOSE CUR;
    DEALLOCATE CUR;
    PRINT CONCAT('Total due: $', @total);
END;
$$ 
DELIMITER ;
START TRANSACTION;
CALL LIST_BALANCES();

### Looping Over a Table Variable and EXEC a Procedure per Row ###
DROP PROCEDURE IF EXISTS SEND_REMINDER;
CREATE PROCEDURE SEND_REMINDER @CustomerID INT
DECLARE @msg NVARCHAR(80);
SELECT @msg = CONCAT('Reminder: ', FULLNAME, ' owes $', BALANCE)
FROM DBO.CUSTOMERS WHERE CUSTOMERID = @CustomerID;
PRINT @msg;

SET NOCOUNT ON;
DECLARE @todo TABLE (CUSTOMERID INT PRIMARY KEY);
INSERT INTO @todo SELECT CUSTOMERID FROM DBO.CUSTOMER WHERE BALANCE > 0;
DECLARE @id INT = (SELECT MIN(CUSTOMERID) FROM @todo);
WHILE @id IS NOT NULL
BEGIN 
	EXEC DBO.USP SEND_REMINDER @CustomerID = @id;
    SELECT @id = MIN(CUSTOMERID) FROM @todo WHERE CUSTOMER > @id;
END;
$$
DELIMITER ;
START TRANSACTION;
CALL SEND_REMINDER();


### Batch a Large DELETE in a Stored Procedure Loop ###
-- Here's a loop worth writing.
-- One huge DELETE holds locks and grows the log, while small chunks don't.

CREATE TABLE ORDERHISTORY (
	ORDERIF INT PRIMARY KEY,
    ORDERDATE DATE NOT NULL,
    AMOUNT DECIMAL(10, 2) NOT NULL,
    TAX DECIMAL (10, 2) NULL);
INSERT INTO ORDERHISTORY (ORDERID, ORDERDATE, AMOUNT)
SELECT VALUE, DATEADD(DAY, VALUE % 300, '2026-01-01'), 20.99 + VALUE % 480
FROM GENERATE_SERIES(1, 50000);

DROP PROCEDURE IF EXISTS PURGE_OLD_ORDERS
CREATE PROCEDURE PURGE_OLD_ORDERS () 
	@Before DATE, @BatchSize INT = 4000
BEGIN 
	SET NOCOUNT ON;
    DECLARE @rows INT, @batch INT = 0;
    WHILE 1 = 1
    BEGIN
		DELETE TOP (@BatchSize) FROM ORDERHISTORY
        WHERE ORDERDATE , @Before;
        SET @rows = @@ROWCOUNT;
        IF @rows = 0 BREAK;
        SET @batch += 1;
        PRINT CONCAT('Batch ', @batch, ': ', @rows, ' rows deleted');
	END;
END;
$$ 
DELIMITER ;
START TRANSACTION;
CALL PURGE_OLD_ORDERS ();
EXEC PURGE_OLD_ORDERS @Before ='2026-03-01';


### What to Watch for With SQL Server WHILE Loops and Cursors ###
DROP PROCEDURE IF EXISTS GLOBAL_CURSOR;
CREATE PROCEDURE GLOBAL_CURSOR ()
BEGIN 
	DECLARE C CURSOR FOR SELECT FULLNAME FROM CUSTOMERS;
    OPEN C;
    RETURN 
END;
SET NOCOUNT ON;
BEGIN TRY
	EXEC GLOBAL_CURSOR;
END TRY
BEGIN CATCH
	PRINT CONCAT('Msg ', ERROR_NUMBER(), ': ', ERROR_MESSAGE());
END CATCH;
SELECT IS_LOCAL_CURSOR_DEFAULT FROM DATABASES WHERE NAME = DB_NAME();













    



