USE project_medical_data_history;
--Query 1
select first_name,last_name,gender 
  from patients 
  where gender='M';
