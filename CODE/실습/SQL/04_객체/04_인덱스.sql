-- INDEX 생성 전 성능 확인

SET PROFILING = 1;

-- 쿼리
SELECT * FROM employees
WHERE last_name = 'Baba'
   AND gender = 'M';

-- 프로파일 확인
SHOW PROFILE FOR QUERY 1;

SELECT NOW(6);
-- 쿼리
SELECT * FROM employees
WHERE last_name = 'Baba'
   AND gender = 'M';
SELECT NOW(6);
/*
2025-05-02 10:57:01.944429
2025-05-02 10:57:02.089991
*/

/*
2025-05-02 11:02:36.799911
2025-05-02 11:02:36.851783
*/

-- 인덱스 생성
CREATE INDEX index_lastname_gender ON employees(last_name, gender);
EXPLAIN
SELECT * FROM employees WHERE last_name = 'Smith' AND gender = 'M';

-- 인덱스 삭제
DROP INDEX index_lastname_gender ON employees;
