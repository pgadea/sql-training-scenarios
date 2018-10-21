USE DBase
GO

Create table ErrorLogTable 
(
    ErrorID int primary key identity,
    ErrorNumber int,
	ErrorMessage varchar(3000),
	ErrorSeverity tinyint,
	ErrorState int,
	ErrorLineNumber int,
	ErrorProcedure varchar(200),
	ErrorDateandTime datetime default getdate()
)

go

--Create Procedure
CREATE PROCEDURE usp_Dividebyzeroerror 
 AS
 BEGIN TRY
SELECT 1/0
END TRY
BEGIN CATCH
INSERT INTO ERRORLOGTABLE 
(ERRORNUMBER,ERRORMESSAGE,ERRORSEVERITY,ERRORSTATE,ERRORLINENUMBER,ERRORPROCEDURE) 
SELECT ERROR_NUMBER() ,ERROR_MESSAGE(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_LINE(),NULLIF(ERROR_PROCEDURE(), 'NOT INSIDE PROCEDURE')     
;THROW                      
END CATCH

GO

EXEC usp_DividebyZeroError

SELECT * FROM ErrorLogTable




