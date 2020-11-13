--UC11 and UC12: Implement the ER Diagram into the payroll service DB and perform UC4, UC5, and UC7 again
use payroll_service;
create table department(departmentID int not null primary key, departmentName varchar(50) not null);
insert into department(departmentID, departmentName)values
	(111, 'Marketing'), 
	(222, 'Sales'), 
	(333, 'Research');

create table empPayroll(grade varchar(2) not null primary key, basicPay int not null, taxablePay int not null, incomeTax int not null, netPay int not null);
insert into empPayroll(grade, basicPay, taxablePay, incomeTax, netPay)values
	('A1', 1000000, 100000, 10000, 990000),
	('A2', 500000, 50000, 5000, 495000), 
	('A3', 100000, 10000, 1000, 99000);

create table employee_details(empID int not null, name varchar(50) not null, departmentID int not null, grade varchar(2) not null, 
	constraint employee primary key (empID, departmentID)); 
insert into employee_details (empID, name, departmentID, grade)values
	(001, 'A', 111, 'A1'), 
	(002, 'B', 222, 'A2'), 
	(003, 'C', 333, 'A3'), 
	(001, 'A', 222, 'A1');

alter table employee_details 
add companyName varchar(50) ;

update employee_details set companyName = 'ABC' where empID = 1;
update employee_details set companyName = 'DEF' where empID = 2;
update employee_details set companyName = 'XYZ' where empID = 3;

alter table employee_details 
add gender varchar(1);

update employee_details set gender = 'M' where empID =1;
update employee_details set gender = 'F' where empID != 1;

create table company(CompanyName varchar(50) not null primary key, officeAddress varchar(50) not null);
insert into company(CompanyName, officeAddress)values
	('ABC', 'Delhi'), 
	('DEF' , 'Bangalore'), 
	('XYZ', 'Mumbai');

	select * from employee_details;
	select * from empPayroll;
	select * from department;
	select * from company;

alter table dbo.employee_details
add foreign key(departmentID) references dbo.department(departmentID);
alter table dbo.employee_details
add foreign key(grade) references dbo.empPayroll(grade);
alter table dbo.employee_details
add foreign key(companyName) references dbo.company(companyName);

--UC7 in UC11: Ability to find the minimum, maximum, sum of the salary of the employees
select sum(pr.basicPay) as 'Sum of Salary' 
from empPayroll pr, employee_details
where pr.grade = employee_details.grade group by employee_details.gender;

select min(pr.basicPay) as 'Minimum Salary', max(pr.basicPay) as 'Maximum Salary'
from empPayroll pr;

select count(distinct(employee_details.empID)) as 'Number of employees'
from employee_details group by employee_details.gender;
	select * from employee_details;
	select * from empPayroll;
	select * from department;
	select * from company;

--UC4: retrieving all the records
select * 
from empPayroll, employee_details, department, company 
where empPayroll.grade = employee_details.grade and employee_details.companyName = company.CompanyName and department.departmentID = employee_details.departmentID;

--UC5:retrieving the records for a particular employeeUC 
select * 
from empPayroll, employee_details, department, company 
where empPayroll.grade = employee_details.grade and employee_details.companyName = company.CompanyName and department.departmentID = employee_details.departmentID 
		and employee_details.name = 'A';
