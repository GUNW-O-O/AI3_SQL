-- LIMIT

-- 맨 앞에서 부터 10개
USE aloha;
SELECT *
FROM board
LIMIT 10;

/*
      **LIMIT 키워드 위치**

      SELECT *
      FROM 테이블
      WHERE
      GROUP BY
      ORDER BY
      LIMIT
      - 제일 마지막에 적어준다
*/

-- 페이지당 10개의 게시글
-- 12페이지 출력하기
SELECT * FROM board
LIMIT 110, 10;
SELECT * FROM board
LIMIT 10 OFFSET 110;

-- 페이지당 20개씩
-- 36페이지 출력
SELECT * FROM board
LIMIT 700,20;