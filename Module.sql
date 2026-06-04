use student;

create procedure
sp_emp_sal_increment 
as declare @sal decimal(10,2)
select @sal=salary from employees
where EMPLOYEE_ID=103
print 'employee Salary is :'+ convert(varchar(50),@sal)
go

alter procedure 
sp_emp_sal_increment 
as declare @sal decimal(10,2) 
select @sal=salary from employees where EMPLOYEE_ID=104
print' employee salary is :'+ convert (varchar(50),@sal)
go


---dynamic data--------------------------------
create procedure 
sp_emp_sal_increment_dynamic @id int
as 
declare @sal decimal(10,2) 
select @sal=salary from employees where EMPLOYEE_ID=@id
print 'Employee Salary is :'+ convert (varchar(50) ,@sal)
go


--- for single condition---------------------
alter procedure
sp_emp_sal_increment_dynamic @id int
as 
declare @sal decimal(10,2)
declare @increment decimal(10,2)

select @sal=salary from employees where EMPLOYEE_ID=@id

if(@sal<5000)
begin
select @increment=@sal*10/100
end
else
begin
select @increment =@sal*15/100
end

print 'Employee Salary is:'+ convert(varchar(50),@increment)
go


execute sp_emp_sal_increment_dynamic 105



------
------------------For multiple condition-----------------------------
 alter procedure 
 sp_emp_sal_increment_dynamic @id int
 as
 declare @sal decimal(10,2)
 declare @increment decimal(10,2)
  select @sal =salary from employees where EMPLOYEE_ID=@id
  select @increment =case 
  when @sal<5000 then @sal*10/100
  when @sal between 5000 and 10000 then @sal*15/100
  when @sal between 10001 and 20000 then @sal*20/100
  else @sal*25/100
  end
  print 'Employee Salary is:'+convert(varchar(50),@sal)
  print 'Increment is:' +convert (varchar(50),@increment)
  
  execute sp_emp_sal_increment_dynamic 100