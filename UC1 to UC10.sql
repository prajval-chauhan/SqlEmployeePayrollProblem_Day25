--UC 1: creating database named payroll services
create database payroll_service;
use payroll_service;
/*UC 2: Adding a table named employee_payroll containing the details of the 
employees in the database payroll_service*/
create table employee_payroll
(
	id int not null identity(1,1) primary key,
	name varchar(50) not null,
	salary float not null,
	start_date date not null
);
--UC 3: Adding data into the employee_payroll table
insert into employee_payroll(name, salary, start_date)values
	('Bill', 1000000.00, '2018-01-03'),
    ('Terisa', 2000000.00, '2019-11-13'),
    ('Charlie', 3000000.00, '2020-05-21');
--UC 4:Retrieving all the data from the payroll_service database
select * from employee_payroll;
--UC 5:Retieving specific data from the employee_payroll table
select salary from employee_payroll where name = 'Bill';
select * from employee_payroll where start_date between cast('2018-01-01' as date) and cast(GETDATE() as date);
--UC 6: Adding the gender column and then updating the gender column
alter table employee_payroll add gender char(1);
update employee_payroll set gender = 'F' where name = 'Terisa';
update employee_payroll set gender = 'M' where name = 'Bill' or name = 'Charlie';
select * from employee_payroll;
--UC 7: Fiding sum and avg salaries and number of male and female employees
select sum(salary) as 'Total Salary' from employee_payroll;
select sum(salary) as 'Total Salary Female' from employee_payroll where gender = 'F' group by gender;
select sum(salary) as 'Total Salary Male' from employee_payroll where gender = 'M' group by gender;
select avg(salary) as 'Average Salary' from employee_payroll;
select avg(salary) as 'Average Salary Female' from employee_payroll where gender = 'F' group by gender;
select avg(salary) as 'Average Salary Male' from employee_payroll where gender = 'M' group by gender;
select max(salary) as 'Maximum Salary', count(salary) as 'Number of Females'from employee_payroll where gender = 'F' group by gender;
select max(salary) as 'Maximum Salary', count(salary) as 'Number of Males'from employee_payroll where gender = 'M' group by gender;
--UC 8: Extending the employee_payroll table to contain phone no, address and department as columns
alter table employee_payroll add phoneNo bigint, department varchar(50) not null default 'Sales', officeAddress varchar(50) default 'Delhi';
update employee_payroll set officeAddress = 'Delhi' where name = 'Charlie';
insert into employee_payroll (name, salary, start_date, gender, phoneNo, department)
values ('Peter', 2500000, '2019-09-05', 'M', 8193013027, 'IT');
--UC 9: Extending the columns to have fields like basic pay, taxable pay, deductions, Income tax, Net Pay.....
exec sp_rename 'employee_payroll.salary', 'basic_pay', 'column';
alter table employee_payroll add taxable_pay float, income_tax float, deductions float, net_pay float;
--UC 10: Making Terisa as a part of two departments
insert into employee_payroll(name, basic_pay, start_date, gender, department)
values('Terisa', 3000000,'2019-11-13','F','IT');
update employee_payroll set phoneNo = 8295139110 where name = 'Terisa';
select * from employee_payroll;
--UC 11: 
delete from employee_payroll where id = 5;
create table payroll
	(basic_pay float not null primary key,
	taxable_pay float not null,
	income_tax float not null,
	deductions float not null,
	net_pay float not null);
insert into payroll values
	(100000, 50000, 
create table employee_dept
	(id int not null primary key,
	department varchar(50) not null,
	basic_pay int not null);
select * from employee_dept;
insert into employee_dept values
	(1, 'Sales', 100000),
	(2, 'HR', 150000),
	(3, 'Marketing', 125000),
	(4, 'Research', 200000);
