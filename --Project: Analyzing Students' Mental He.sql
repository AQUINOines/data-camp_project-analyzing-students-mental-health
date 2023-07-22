--Project: Analyzing Students' Mental Health in SQL
-- Run this code to save the CSV file as students (Explore and understand the data)
CREATE TABLE students AS SELECT * FROM read_csv_auto('students.csv');
-- counting all the records 
SELECT COUNT(*) AS total_records
FROM students;
-- counting all the records per student type
SELECT
	inter_dom,
	COUNT(*) AS count_inter_dom
FROM students
GROUP BY inter_dom;
-- Filter to understand the data for each student type
SELECT
	inter_dom 
FROM students
WHERE inter_dom = 'Inter'; 
-- for domestic students
SELECT 
	inter_dom
FROM students
WHERE inter_dom = 'Dom';
-- for null 
SELECT 
	inter_dom
FROM students
WHERE inter_dom IS NULL;
-- Query the summary statistics of the diagnostics scores for all students
-- For phq field:
SELECT 
	MIN(todep) AS min_phq,
	MAX(todep) AS max_phq,
	ROUND(AVG(todep),2) AS avg_phq
FROM students;
-- For _scs field:
SELECT 
	MIN(tosc) AS min_scs,
	MAX(tosc) AS max_scs,
	ROUND(AVG(tosc),2) AS avg_scs
FROM students;
-- For _as field:
SELECT 
	MIN(toas) AS min_as,
	MAX(toas) AS max_as,
	ROUND(AVG(toas), 2) AS avg_as
FROM students;
-- Summarize the data for international students only
-- For phq field:
SELECT 
	MIN(todep) AS min_phq,
	MAX(todep) AS max_phq,
	ROUND(AVG(todep),2) AS avg_phq
FROM students
WHERE inter_dom = 'Inter'; 
-- For _scs field:
SELECT 
	MIN(tosc) AS min_scs,
	MAX(tosc) AS max_scs,
	ROUND(AVG(tosc),2) AS avg_scs
FROM students
WHERE inter_dom = 'Inter';
-- For _as field:
SELECT 
	MIN(toas) AS min_as,
	MAX(toas) AS max_as,
	ROUND(AVG(toas), 2) AS avg_as
FROM students
WHERE inter_dom = 'Inter';
-- see the impact of length of stay
SELECT 
	stay,
	ROUND(AVG(todep), 2) AS average_phq,
	ROUND(AVG(tosc), 2) AS average_scs,
	ROUND(AVG(toas),2) AS average_as
FROM students
	WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;
