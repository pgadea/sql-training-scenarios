
--raiserror(Message,State,Severity)
raiserror('Error Message',16,1) 

go 

Use DBase
go

declare @databaseid int =DB_ID()
declare @databaseName sysname = db_name()
raiserror ('Current Database ID:%d,database name : %s.',16,1,@databaseid,@databaseName)

--Adding Customized Messages

USE master;
GO

EXEC sp_addmessage 
    @msgnum = 50001, 
    @severity = 16,
    @msgtext = 
        N'This is a test message with one numeric
        parameter (%d), one string parameter (%s), 
        and another string parameter (%s).',
    @lang = 'us_english'
	--,@replace='replace'
	--,@with_log=false;


EXEC sp_addmessage 
    @msgnum = 50001, 
    @severity = 16,
    @msgtext = 
        -- In the localized version of the message,
        -- the parameter order has changed. The 
        -- string parameters are first and second
        -- place in the message, and the numeric 
        -- parameter is third place.
        N'Dies ist eine Testmeldung mit einem 
        Zeichenfolgenparameter (%3!),
        einem weiteren Zeichenfolgenparameter (%2!), 
        und einem numerischen Parameter (%1!).',
    @lang = 'German';
GO  



select * from sys.messages

-- Changing the session language to use the U.S. English
-- version of the error message.
SET LANGUAGE us_english;
GO

RAISERROR(50001,16,16,15,'param1','param2') -- error, severity, state,
GO                                       -- parameters.

-- Changing the session language to use the German
-- version of the error message.
SET LANGUAGE German;
GO

RAISERROR(50001,16,16,15,'param1','param2') -- error, severity, state, 
GO


--By www.ellarr.com     Vikas Munjal