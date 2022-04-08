delimiter //
create procedure getAllEmployees()
begin
select concat(firstName," ",lastName) as fullName,city,state,country from employees,offices where employees.officeCode = offices.officeCode;
end//
delimiter ;

delimiter //
create procedure getPayments()
begin
select customerName,checkNumber,paymentDate,amount from customers,payments where customers.customerNumber=payments.customerNumber;
end//
delimiter ;
call getAllEmployees();
 call getPayments();