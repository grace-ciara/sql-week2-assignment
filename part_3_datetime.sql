-- ============================================
-- Part 3 : Date & Time Functions(PostgreSQL) – using: nairobi_academy
-- Name: Grace Wambua 
-- Date: 18th April,2026.
-- ============================================
-- Q1:  Write a query to extract the birth year, birth month, and birth day from each student's 
--      date_of_birth as three separate columns. Show first_name alongside them.

set search_path to nairobi_academy;

select * from students;

select
    first_name,
    extract(year from date_of_birth) as birth_year,
    extract(month from date_of_birth) as birth_month,
    extract(day from date_of_birth) as birth_day
from students; 

-- Q2:  Write a query to show each student's full name, their date_of_birth
--      and their age in complete years. Order from oldest to youngest.

select 
    first_name, 
    last_name,
    date_of_birth,
    extract(year from age(date_of_birth)) as age_years 
from students
order by date_of_birth asc;


-- Q3:  Write a query to display each exam date in this exact format: 
--      'Friday, 15th March 2024'.. Call the column formatted_date.

select
    TO_CHAR(exam_date, 'Day, DDth  Month YYYY') as formatted_date
from exam_results;





