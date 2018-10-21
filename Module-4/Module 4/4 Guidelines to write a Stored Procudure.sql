-- www.ellarr.com    Vikas Munjal

--Guidelines to create a stored procedure

Use DBase
go
 
create PROCEDURE usp_UpdateSales
  --@Param1 INT = 0,
  --@Param2 varchar(100)
AS
BEGIN
  BEGIN TRY
    --Truncate Table TableName (Command Not in transaction)
	    BEGIN TRANSACTION;
	    --You can write your business Logic Here
        --insert T-SQL commands
		--update T-SQL commands
		--insert T-SQL commands
		COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
    IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
    DECLARE @ErrorNumber INT = ERROR_NUMBER();
    DECLARE @ErrorLine INT = ERROR_LINE();
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    DECLARE @ProcedureName VARCHAR(400) = ERROR_PROCEDURE ( );
	 --  insert into ERRORLOGTable values  --Logging the errors 
	 --(@ErrorNumber,@ErrorLine,@ErrorMessage,@ErrorSeverity,@ErrorState,@ProcedureName,getdate()) 
	 --EXEC msdb.dbo.sp_send_dbmail  
	 --RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState); 
	 --Throw (Since SQL Server 2012) 
  END CATCH
END;

--By www.ellarr.com     Vikas Munjal