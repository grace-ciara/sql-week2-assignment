-- ============================================
-- Part 2 : Number Functions  (using: nairobi_academy) 
-- Name: Grace Wambua 
-- Date: 18th April,2026.
-- ============================================
-- Q1: 	Write a query to show each exam result alongside the mark rounded to 1 decimal place, 
--      the mark rounded UP to the nearest 10 using CEIL, and the mark rounded DOWN using FLOOR.

set search_path to nairobi_academy;

select * from exam_results; 

select  
    marks,
    round(marks * 1.0, 1) as rounded_mark_one_dec,
    ceil(marks / 10.0) * 10 as ceil_rounded_up_10,
    floor(marks / 10.0) * 10 as floor_rounded_down_10
from exam_results;


-- Q2:  Write a query to calculate the following summary statistics for exam_results in one query:
--      total number of results (COUNT), average mark (AVG rounded to 2 decimal places),
--      highest mark (MAX), lowest mark (MIN), and total marks added together (SUM).

select 
    count(*) as total_results,
    round(avg(marks), 2) as average_mark,
    max(marks) as highest_mark,
    min(marks) as lowest_mark,
    sum(marks) as total_marks
from exam_results; 


-- Q3:  The school wants to apply a 10% bonus to all marks. Write a query to show each result_id,
--      the original marks, and the new boosted_mark rounded to the nearest whole number.

select 
    result_id, 
    marks as original_marks, 
    round(marks * 1.1) as boosted_mark
from exam_results; 





