CREATE TABLE salary_history (
   emp_no INT NOT NULL,
   old_salary DECIMAL(10,2),
   new_salary DECIMAL(10,2),
   salary_diff DECIMAL(10,2),
   changed_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 급여 이력 테이블 생성

-- 급여 변경 시 이력을 기록하는 트리거
DELIMITER //
CREATE TRIGGER after_salary_update
AFTER UPDATE ON salaries
FOR EACH ROW
BEGIN
   INSERT INTO salary_history (emp_no, old_salary, new_salary, salary_diff)
   VALUES (OLD.emp_no, OLD.salary, NEW.salary, NEW.salary - OLD.salary);
END //

DELIMITER ;