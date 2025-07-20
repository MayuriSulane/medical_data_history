-- This SQL script contains various queries to interact with the 'patients' table.
select first_name,last_name,gender from patients where gender='M';
-- Query to retrieve all
select * from patients where first_name like 'W%';