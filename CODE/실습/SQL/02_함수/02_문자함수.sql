-- Active: 1745889699734@@127.0.0.1@3306@employees
-- 문자열을 대문자로, 소문자로 변환하는 쿼리를 작성
-- 원문 : 'AlohA WoRlD~!'

SELECT 'AlohA WoRlD~!' AS 원문,
      UPPER ('AlohA WoRlD~!') AS 대문자
      ,LOWER ('AlohA WoRlD~!') AS 소문자
      FROM dual;

-- 문자열의 글자 수를 반환하는 쿼리를 작성
-- 영문, 공백 : 1byte
-- 한글       : 3byte
SELECT LENGTH ('aloha class') AS '바이트 수'
      ,LENGTH ('알로하 클래스') AS '바이트 수'
      ,CHAR_LENGTH ('aloha class') AS '글자수'
      ,CHAR_LENGTH ('알로하 클래스') AS '글자수'
FROM dual;

-- 주어진 문자열을 연결하여 출력

SELECT CONCAT('ALOHA', 'CLASS')
FROM dual;

-- 문자열에서 특정 문자열을 추출하여 출력
SELECT SUBSTR('www.alohaclass.com', 1, 3) AS "1"
      ,SUBSTR('www.alohaclass.com', 5, 10) AS "2"
      ,SUBSTR('www.alohaclass.com', 16, 3) AS "3"
FROM dual;

SELECT SUBSTR('www.alohaclass.com', 1, 3) AS "1"
      ,SUBSTR('www.alohaclass.com', 5, 10) AS "2"
      ,SUBSTR('www.alohaclass.com',-3, 3) AS "3"
FROM dual;

-- 대상 문자열을 왼쪽/오른쪽에 출력하고
-- 빈공간을 특정 문자로 채우는 SQL 문을 작성

SELECT LPAD('ALOHACLASS', 20, '#') AS "왼쪽"
      ,RPAD('ALOHACLASS', 20, '#') AS "오른쪽"
FROM dual;

-- 사원정보를 이름/성/생년월일 형식으로 출력

SELECT CONCAT_WS('/', first_name, last_name, birth_date) '사원정보'
FROM employees;

-- 'wwwaloha@kakao.com' 이메일주소에서 
-- '@' 문자가 몇 번째 위치하는지 출력
-- LOCATE('찾을문자', '문자열')
SELECT 'wwwaloha@kakao.com' AS "이메일주소"
      , LOCATE('@', 'wwwaloha@kakao.com') AS "@위치"
FROM dual;