-- 부서별로 최고급여를 받는 사원정보를 출력하시오.
-- 이름, 성, 급여, 부서명, 사원수
USE employees;
WITH dept_count AS (
      SELECT de.dept_no, COUNT(*) emp_count
      FROM dept_emp de
      WHERE de.from_date <= CURRENT_DATE AND de.to_date >= CURRENT_DATE
      GROUP BY de.dept_no
),
dept_salary AS (
      SELECT de.dept_no, MAX(s.salary) max_salary
      FROM dept_emp de
      JOIN salaries S ON de.emp_no = s.emp_no
      WHERE de.from_date <= CURRENT_DATE AND de.to_date >= CURRENT_DATE
      GROUP BY de.dept_no
)
SELECT e.emp_no, e.first_name, e.last_name, s.salary, d.dept_name, d.dept_name, dc.emp_count
FROM employees e
     JOIN salaries s ON e.emp_no = s.emp_no
     JOIN dept_emp de ON e.emp_no = de.emp_no
     JOIN departments d ON d.dept_no = de.dept_no
     JOIN dept_count dc ON d.dept_no = dc.dept_no
     JOIN dept_salary ds ON d.dept_no = ds.dept_no
WHERE s.salary = ds.max_salary
;

--1. 상사 정보 조회
SELECT *
FROM employees e
     JOIN dept_manager dm ON e.emp_no = dm.emp_no
;

-- 2. 부하 정보 조회
SELECT *
FROM employees e
WHERE e.emp_no NOT IN (SELECT emp_no FROM dept_manager)
;
WITH emp_mgr AS (
     SELECT de.dept_no,
          e.emp_no, e.first_name, e.last_name, e.gender,
          m.emp_no mgr_emp_no, 
          m.first_name mgr_first_name, 
          m.last_name mgr_last_name, 
          m.gender mgr_gender
     FROM dept_emp de
     JOIN employees e ON de.emp_no = e.emp_no
     JOIN dept_manager dm ON de.dept_no = dm.dept_no
     JOIN employees m ON dm.emp_no = m.emp_no
     WHERE de.from_date <= CURDATE() AND de.to_date >= CURDATE()
     AND dm.from_date <= CURDATE() AND dm.to_date >= CURDATE()
)
SELECT *
FROM emp_mgr
;
-- 입사 날짜별 사원 수 조회

WITH hire_count AS (
            SELECT hire_date, COUNT(*) AS emp_count
            FROM employees
            GROUP BY hire_date
)
SELECT hire_date, emp_count
FROM hire_count
ORDER BY emp_count DESC;