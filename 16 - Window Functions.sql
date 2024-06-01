
-- Windows Function --

CREATE DATABASE window_func;
USE window_func;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);


SELECT * FROM employees;
SELECT AVG(salary) FROM employees;
SELECT department, AVG(salary) FROM employees GROUP BY department;

-- OVER() creates a WINDOW, it's empty so it's including ALL ROWS in record --
SELECT AVG(salary) OVER() FROM employees;

-- FOCUS after salary AVG() OVER() is ONE Query --
SELECT 
	emp_no, 
	department, 
	salary, 
	AVG(salary) OVER() 
FROM employees; 

SELECT 
	emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(),
    MAX(salary) OVER() 
FROM employees; 

-- ERROR: MySQL onsidering it as Group By expression --
SELECT 
	emp_no, 
    department, 
    salary, 
    MIN(salary),
    MAX(salary)
FROM employees; 

-- Correct Version --
SELECT 
    MIN(salary),
    MAX(salary)
FROM employees; 

-- OVER(PARTITION BY __) -- 
-- === Indivisual employee comprasion with the AVG salaray of the department === --
SELECT 
	emp_no, 
	department, 
	salary, 
	AVG(salary) OVER(PARTITION BY department) AS dept_avg 
FROM employees; 

-- ONLY the AVG salaray of the department --
SELECT department, AVG(salary) FROM employees GROUP BY department; 

SELECT 
	emp_no, 
	department, 
	COUNT(*) OVER(PARTITION BY department) AS dept_member_count
FROM employees; 

-- Dept Payroll VS Company Payroll --
SELECT 
	emp_no, 
	department, 
	salary, 
	SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees; 


-- ========= ORDER BY ( use "ORDER BY" inside "OVER()" to re-order rows within each window )============= --

SELECT 
	emp_no, 
	department, 
	salary, 
	SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_sum_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees; 


-- RAW window Func. "RANK()" --

SELECT
	emp_no,
	department,
	salary,
	RANK() OVER(PARTITION BY department ORDER BY salary) AS dept_salary_rank,
	RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank -- return some SAME RANK POSITION --
FROM employees;

SELECT
	emp_no,
	department,
	salary,
    RANK() OVER(PARTITION BY department ORDER BY salary) AS dept_salary_rank, -- return some SAME/TIE RANK POSITION --
	RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank 
FROM employees ORDER BY department; -- ===== Outside dept. ORDER BY ========= --


-- dept_salary-rank TIES postion so we can use ROW_NUMBER() -- 

SELECT
	emp_no,
	department,
	salary,
    
	ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary) AS salary_row, -- Proper Row Number --
    RANK() OVER(PARTITION BY department ORDER BY salary) AS dept_salary_rank, -- return some SAME/TIE RANK POSITION --
	
    RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank 
FROM employees ORDER BY department; -- ===== Outside dept. ORDER BY ========= --


-- DENSE_RANK() --

SELECT
	emp_no,
	department,
	salary,
	ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary) AS salary_row, 
    RANK() OVER(PARTITION BY department ORDER BY salary) AS dept_salary_rank, 
	
    RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank, -- regular rank --
    DENSE_RANK() OVER(ORDER BY salary DESC) AS overall_dense_rank, -- dense rank --
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS count_row_number
    
FROM employees ORDER BY overall_salary_rank; -- ===== Outside dept. ORDER BY ========= --


-- NTILE(n) --
SELECT
	emp_no,
	department,
	salary,
   -- NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quirtile,
    NTILE(4) OVER(ORDER BY salary DESC) AS salary_quirtile
FROM employees;


-- FIRST_VALUE(exp) -- 
-- Didn't Quite Understood --


-- LAG(exp) / LED(exp)-- 

SELECT
	emp_no,
	department,
	salary,
    LAG(salary) OVER(ORDER BY salary DESC) AS salary_quirtile, -- Lag from PREVIOUS row value --
    salary - LAG(salary) OVER(ORDER BY salary DESC) AS salary_diff -- salary difference calculation using LAG(exp) --
FROM employees;


SELECT
	emp_no,
	department,
	salary,
    -- LEAD(salary) OVER(ORDER BY salary DESC) AS salary_quirtile, -- Lead from NEXT row value --
    salary - LEAD(salary) OVER(ORDER BY salary DESC) AS salary_diff -- salary difference calculation using LEAD(exp) --
FROM employees;

-- Adding partition by dept --
SELECT
	emp_no,
	department,
	salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_diff -- salary difference calculation using LEAD(exp) --
FROM employees;










