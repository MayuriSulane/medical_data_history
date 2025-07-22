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

