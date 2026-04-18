-- ============================================
-- Part 5 : Window Functions (using: nairobi_academy)
-- Name: Grace Wambua 
-- Date: 18th April,2026.
-- ============================================
-- Q1:  Write a query using ROW_NUMBER() to assign a unique rank to each exam result, ordered from 
--      highest mark to lowest. Show result_id, student_id, marks, and row_num.

set search_path to nairobi_academy; 
 
select * from exam_results; 
select * from students; 

select
    result_id, 
    student_id, 
    marks,
    ROW_NUMBER() OVER(order by marks desc) as row_num
from exam_results;


-- Q2:  Write a query using RANK() and DENSE_RANK() on exam results ordered by marks descending. 
--      Show both columns side by side so the difference between them is visible.

select 
    result_id, 
    marks,
    RANK() OVER(order by marks desc) as rank_pos,
    DENSE_RANK() OVER(order by marks desc) as dense_pos
from exam_results
order by marks desc; 


-- Q3:  Write a query using NTILE(3) to divide all exam results into 3 performance bands
--      (1 = top, 2 = middle, 3 = bottom). Show result_id, marks, and band. 

select   
    result_id, 
    marks,
    NTILE(3) OVER(ORDER BY marks desc) as band
from exam_results
order by marks desc;


-- Q4:  Write a query using AVG() OVER(PARTITION BY student_id) to show each exam result alongside that
--      student's personal average mark. Show student_id, marks, and student_avg rounded to 2 decimal places.

select 
    student_id, 
    marks,
    ROUND(AVG(marks) OVER(partition by student_id), 2) as student_avg
from exam_results;


-- Q5:  Write a query using LAG() to show each exam result alongside the previous result's marks for 
--      the same student. Also calculate the improvement (current marks minus previous marks). 
--      Use PARTITION BY student_id.

select  
    student_id,
    result_id,
    marks as current_marks,
    LAG(marks) OVER(partition by student_id order by result_id) as previous_marks,
    marks - LAG(marks) OVER(partition by student_id order by result_id) as improvement
from exam_results 
order by student_id , result_id;








