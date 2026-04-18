-- ============================================
-- Part 1: String Functions ( using: nairobi_academy)
-- Name: Grace Wambua 
-- Date: 18th April,2026.
-- ============================================
-- Q1:  Write a query to display each student's full name in UPPERCASE and their city in lowercase. 
--      Name the columns upper_name and lower_city.

set search_path to nairobi_academy;

select * from students; 

select 
    upper(concat(first_name, '    ', last_name)) as upper_name,
    lower(city) as lower_city
from students;    


-- 	Q2: Write a query to show each student's first name and the LENGTH of their first name. 
--      Order the results from longest to shortest name. 

select 
    first_name,
    length(first_name) as name_length
from students
order by name_length desc;


-- Q3:	Write a query to show each subject's name and a short version - the first 4 characters of 
--      the subject name ... called short_name.  Also show the full subject name length.

select 
     subject_name,
     left(subject_name, 4) as short_name,
     length(subject_name) as fullsub_name_length
     from subjects;
 

-- Q4:	Write a query using CONCAT to produce a sentence for each student in this format: 
--      'Amina Wanjiku is in Form 3 and comes from Nairobi'. Call the column student_summary.

select   
    concat(first_name, ' ', last_name, ' is in ', class , ' and comes from ', city) as student_summary
from students; 





