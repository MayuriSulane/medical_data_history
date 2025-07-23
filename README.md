# PRCE-001 Medical Data History

# Problem Statement
Task 1:-Pull docker image with sql environment
	
docker pull mysql:latest
latest: Pulling from library/mysql
Digest: sha256:b9d8b7ec6e6aced08b1cfe50776f8e323c0a625adf4e10e69f90fc686ea10807
Status: Image is up to date for mysql:latest


docker run -it --rm mysql mysql -h 18.136.157.135 -u dm_team4 -p

Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 40968
Server version: 5.7.31 MySQL Community Server (GPL)


Check whether database is connected with sql image in docker or not:
		
mysql> show databases;
+------------------------------+
| Database                     |
+------------------------------+
| information_schema           |
| project_medical_data_history |
+------------------------------+
		
		 mysql>use project_medical_data_history;
		
		mysql> show tables;
+----------------------------------------+
| Tables_in_project_medical_data_history |
+----------------------------------------+
| admissions                             |
| doctors                                |
| patients                               |
| province_names                         |
+----------------------------------------+


1. Show first name, last name, and gender of patients whose gender is 'M'
        mysql> select first_name,last_name,gender from patients where gender='M';

2. Show first name and last name of patients who do not have allergies.
	    mysql> select first_name,last_name from patients where allergies IS NULL;

3. Show first name of patients that start with the letter 'C'.
	    mysql> select first_name from patients where first_name like 'C%';

4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
	    mysql> select first_name, last_name,weight from patients where weight between 100 and 120;

5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
	    mysql> select first_name, IFNULL(allergies,'NKA') as allergies from patients;
	        Or
	        UPDATE patients SET allergies = 'NKA' WHERE allergies IS NULL;

6. Show first name and last name concatenated into one column to show their
full name.
	    mysql> select concat(first_name," ",last_name) as first_name from patients;

7. Show first name, last name, and the full province name of each patient.
        mysql>SELECT patients.first_name, patients.last_name, province_names.province_name FROM patients JOIN province_names ON patients.province_id=province_names.province_id;

8. Show how many patients have a birth_date with 2010 as the birth year.
	    mysql> select count(*) from patients where birth_date like '2010%';

9. Show the first_name, last_name, and height of the patient with the greatest height.
	    mysql> select first_name,last_name,height from patients order by height desc;

10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
	    mysql> select * from patients where patient_id In(1,45,534,879,1000);

11. Show the total number of admissions
	    mysql>select count(*) AS total_admissions from admissions;

12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
	    mysql> select * from admissions where admission_date=discharge_date;

13. Show the total number of admissions for patient_id 579.
	    mysql> select count(*) AS total_admissions from admissions where patient_id=579;

14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
        mysql> select DISTINCT city from patients where province_id='NS';

15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
	    mysql> select first_name,last_name,birth_date from patients where height>160 and weight>70;

16. Show unique birth years from patients and order them by ascending.
	    mysql> select distinct year(birth_date) as birth_year from patients order by birth_year asc;

17. Show unique first names from the patients table which only occurs once in the list.
	    mysql> SELECT first_name FROM patients GROUP BY first_name HAVING COUNT(*) = 1;

18. Show patient_id and first_name from patients where their first_name starts and ends with 's' and is at least 6 characters long.
        mysql>select first_name,patient_id from patients where first_name like 's%s' and char_length(first_name)>=6;

19. Show patient_id, first_name, last_name from patients whose diagnosis is 'Dementia'. Primary diagnosis is stored in the admissions table.
        mysql>select patients.patient_id,patients.first_name,patients.last_name from patients join admissions on patients.patient_id=admissions.patient_id where admissions.diagnosis='Dementia';

20. Display every patient's first_name. Order the list by the length of each name and then by alphabetically.
        mysql> SELECT first_name FROM patients  ORDER BY LENGTH(first_name), first_name;

21. Show the total number of male patients and the total number of female patients in the patients table. Display the two results in the same row.
        mysql> select sum(gender='M') as total_male,sum(gender='F') as total_female from patients;

22. Show the total number of male patients and the total number of female patients in the patients table. Display the two results in the same row.
	    mysql> select sum(gender='M') as total_male,sum(gender='F') as total_female from patients;

23. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.	
        mysql> select patient_id,diagnosis from admissions group by patient_id,diagnosis having count(*)>1;

24. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
        mysql> SELECT city, COUNT(patient_id) AS total_number_of_patients_in_city FROM patients GROUP BY city ORDER BY total_number_of_patients_in_city DESC,city asc;

25. Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor"
        mysql> select first_name,last_name, 'Patient' as role from patients union select first_name,last_name, 'Doctor' as role from doctors;

26. Show all allergies ordered by popularity. Remove NULL values from the query.
        mysql> select allergies,count(*) as popularity_count from patients where allergies is not null group by allergies order by count(allergies) desc; 

27. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
        mysql>select first_name,last_name,birth_date from patients where birth_date between '1970-01-01' and '1979-12-31' order by birth_date asc;

28. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in descending order EX: SMITH,jane
        mysql> SELECT CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS full_name FROM patients ORDER BY LOWER(first_name) DESC;

29. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
        mysql>select province_id,sum(height) as total_height from patients group by province_id having total_height>=7000;

30. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
        mysql> select max(weight)-min(weight) as weight_difference from patients where last_name='Maroni';

31. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
        mysql>select day(admission_date) as day_of_month,count(*) as admission_count from admissions group by day_of_month order by admission_count desc;

32. Show all of the patients grouped into weight groups. Show the total number of patients in each weight group. Order the list by the weight group descending. e.g. if they weigh 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.
        mysql>select floor(weight/10)*10 as weight_group,count(*) as patient_count from patients group by weight_group order by weight_group desc;

33. Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1. Obese is defined as weight(kg)/height(m). Weight is in units kg. Height is in units cm.
        mysql> select patient_id,weight,height,case when weight/power(height/100,2)>=30 then 1 else 0  end as isObese from patients;

34. Show patient_id, first_name, last_name, and attending doctor's specialty.Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'. Check patients, admissions, and doctors tables for required information.
        mysql>SELECT patients.patient_id, patients.first_name AS patient_first_name, patients.last_name, doctors.specialty FROM admissions JOIN patients ON patients.patient_id = admissions.patient_id JOIN doctors ON doctors.doctor_id = admissions.attending_doctor_id WHERE admissions.diagnosis = 'Epilepsy' AND doctors.first_name = 'Lisa';

35. All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after their first admission. Show the patient_id and temp_password.

The password must be the following, in order:
- patient_id
- the numerical length of patient's last_name
- year of patient's birth_date

        mysql>SELECT DISTINCT patients.patient_id, CONCAT(patients.patient_id, LENGTH(patients.last_name), YEAR(patients.birth_date)) AS temp_password FROM admissions JOIN patients ON patients.patient_id = admissions.patient_id;
