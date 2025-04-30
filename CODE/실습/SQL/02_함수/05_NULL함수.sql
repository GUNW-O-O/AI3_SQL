-- Active: 1745889699734@@127.0.0.1@3306@aloha
-- 최종급여 = 급여 + (급여 * 커미션비율)
SELECT emp.*
      ,salary + (salary * IFNULL(commission_pct,0)) AS '최종급여'
FROM employees emp
ORDER BY `최종급여` DESC;

-- NULLIF( A, B )
-- : A와 B 가 같으면 NULL 아니면 A
SELECT emp_no
      ,salary
      ,NULLIF (salary,3300000)
FROM employees;

-- COALESCE()
-- 사원이 1년동안 받는 기본급 외의 수당을 출력
-- 단, 커미션과 보너스가 둘 다 있는 경우는 커미션만 출력
SELECT emp_no
      ,name
      ,COALESCE((salary*commission_pct)*12, bonus, 0) AS '수당'
FROM employees;

-- 사원이 1년동안 받는 기본급 외의 수당을 출력
SELECT emp_no
      ,name
      ,salary
      ,COALESCE((salary*commission_pct)*12 + IFNULL(bonus,0) , 0) AS '수당'
FROM employees;