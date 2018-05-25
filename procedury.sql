-- wywołanie procedury z parametrem In

select * from countries;

call getCountryByName('Argentina');

-- wywołanie procedury z parametrem OUT

SET @employees_count = 0;
call getEmployeesCountByName('Steven',@employees_count); 

select @employees_count from dual;

-- wywołanie procedury z parametrem INOUT

SET @count = 0;
call set_counter(@count, 2);

select @count from dual;

-- ------------------------------------------------------------------

select * from departments;

call showEmployeesForDepartment('IT');

