-- CAST( 값 AS 타입 )
-- 문자열을 숫자로 변환
SELECT CAST('123' AS UNSIGNED INT) AS '숫자로 변환';
-- 날짜 문자열을 날짜타입(DATE)로 변환
SELECT
      CAST('2025-04-30' AS DATE) AS '날짜로 변환'
      ,CAST('2025-04-30 11:37:06' AS DATETIME) AS '날짜로 변환';
-- 숫자를 문자로 변환
SELECT CAST (123 AS CHAR) AS '문자로 변환';

-- CONVERT(값, 데이터)
-- 문자열을 DATE 타입으로 변환
SELECT CONVERT('2025-05-01', DATE)AS 'DATE로 변환';
-- 숫자를 CHAR 로 변환
SELECT CONVERT('456', CHAR) AS '문자로 변환';

-- FORMAT(숫자, 소수점자리)
-- 123456.789 를 소수점 아래 둘째자리까지 천단위 구분기호(,) 쉼표 포함 출력
SELECT FORMAT(123456.789, 2) AS '포맷숫자';
-- 123456.789 를 정수만 천단위 구분기호(,) 쉼표 포함 출력
SELECT FORMAT(123456.789, 0) AS '포맷숫자';

-- DATE_FORMAT(날짜, 형식)
-- 오늘 날짜를 2025년 04월 30일 12시 00분 00초 형식으로 출력
SELECT DATE_FORMAT(NOW(), '%Y년%m월%d일 %H시%i분%s초') '현재 날짜시간'
      ,DATE_FORMAT(NOW(), '%Y/%m/%d/ %H:%i:%s') '현재 날짜시간'
      ,DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') '현재 날짜시간'
      ,DATE_FORMAT(NOW(), '%Y.%m.%d. %H:%i:%s') '현재 날짜시간'
      ,STR_TO_DATE( '2025-04-30 12:34:56', '%Y-%m-%d %H:%i:%s') '문자->날짜'
      ,STR_TO_DATE( '2025년04월30일 12시34분56초', '%Y년%m월%d일 %H시%i분%s초')'문자->날짜'
      ,STR_TO_DATE( '2025.04.30 12:34:56', '%Y.%m.%d %H:%i:%s')'문자->날짜';
