--Microsoft is suggesting to start using THROW statement instead of RAISERROR in New Applications.

-- Re-throw the original exception that invoked the CATCH block
use master
go

BEGIN TRY
  DECLARE @result INT
--Generate divide-by-zero error
  SET @result = 55/0
END TRY
BEGIN CATCH
    --THROW
END CATCH

go

Throw   --Error
go

THROW 60000, 'Test User Defined Message', 1
go   --Proper Syntax

--It always generates new exception and results in the loss of the original exception details

BEGIN TRY
  DECLARE @result INT
--Generate divide-by-zero error
  SET @result = 55/0
END TRY
BEGIN CATCH
--Get the details of the error
--that invoked the CATCH block
 DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH

go


--Doesn't cause the statement batch to be ended

BEGIN
 PRINT 'BEFORE RAISERROR'
 RAISERROR('RAISERROR TEST',16,1)
 PRINT 'AFTER RAISERROR'
END

go


--Causes the statement batch to be ended

 BEGIN TRY
  DECLARE @RESULT INT = 55/0    
END TRY
BEGIN CATCH
  PRINT 'BEFORE THROW';
  THROW;
  PRINT 'AFTER THROW'
END CATCH
  PRINT 'AFTER CATCH'

  go


  --RAISERROR -  The severity parameter specifies the severity of the exception.
  --THROW -  There is no severity parameter. The exception severity is always set to 16.

  -- THROW--- Requires preceding statement to end with semicolon (;) statement terminator


--RASIERROR CAN RAISE SYSTEM ERROR MESSAGE

RAISERROR (40655,16,1)
go

THROW 40655, 'Database master cannot be restored.', 1
go

--CAN'T RAISE user-defined message with message_id greater than and equal to 50000 which is not defined in SYS.MESSAGES table

RAISERROR (60000, 16, 1)
go

--CAN RAISE user-defined message with message_id greater than and equal to 50000 which is not defined in SYS.MESSAGES table

THROW 60000, 'Test User Defined Message', 1
go

--Now I AM ADDING the Message to SYS.MESSAGES Table

EXEC sys.sp_addmessage 60000, 16, 'Test User Defined Message'
GO

RAISERROR (60000, 16, 1)
go
--RAISERROR Allows substitution parameters in the message parameter

RAISERROR (50001, 16, 1, 1,'Param1', 'Param2')  --50001 created in previous demonstration
go

--THROW DOESN'T Allow substitution parameters in the message parameter

THROW 70000, 'Message with Parameter 1: %d and Parameter 2:%s', 1, 505,'Basavaraj'
go

THROW 58000,'String1' + 'String2',1
go

DECLARE @message VARCHAR(2048)
SET @message = 'String1 ' + 'String2';
THROW 58000, @message, 1
go


select * from sys.messages


--By www.ellarr.com     Vikas Munjal