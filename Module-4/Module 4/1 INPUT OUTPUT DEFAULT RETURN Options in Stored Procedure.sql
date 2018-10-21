use DBase
go


create proc ProcA
as
select 1
go

exec ProcA
go

Create proc ProcB
@intid1 int,
@intid2 int
as
select (@intid1-@intid2)*10

go


exec ProcB 12,10
exec ProcB @intid1=12,@intid2=10
exec ProcB @intid2=10,@intid1=12

go

alter proc ProcA
@intid int,
@intout int output
as
set @intout=@intid+10


declare @val int
exec ProcA @intid=12,@intout=@val output
select @val as value 

go


IF OBJECT_ID('dbo.Student', 'U') IS NOT NULL 
  DROP TABLE dbo.Student; 

  go


create table Student
( id int identity primary key,
  name varchar(50)
)
go

create procedure myProcA
@name varchar(50),
@id int output
as
insert into Student(name) values(@name) 
select @id=SCOPE_IDENTITY()
go

declare @IdentityOutput int
exec myProcA @name='vikas' , @id=@IdentityOutput output
select @IdentityOutput as lastidvalue
go

alter proc ProcB
@name varchar(50)=null 
as
if @name is NULL
 begin
  print 'You must specify the name'
  return(1)
 end
insert into Student(Name) values(@name)
select Scope_Identity()
return(2)

go

declare @val int
exec @val=ProcB @name='Rahul'
select @val value
go

select * from Student
go

declare @val int
exec @val= ProcB  
if @val=1
print 'Please specify the last name'


--By www.ellarr.com     Vikas Munjal




