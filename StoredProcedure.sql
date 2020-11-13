
alter procedure [dbo].[SpAddEmployeeDetails]
(
	@name varchar(50),
	@departmentID int,
	@grade varchar(2),
	@CompanyName varchar(50)
)
as
begin 
	insert into employee_details values(@name, @departmentID, @grade, @CompanyName)
end
select * from employee_details;