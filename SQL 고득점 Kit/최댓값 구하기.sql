-- https://school.programmers.co.kr/learn/courses/30/lessons/59415?language=oracle
-- 코드를 입력하세요
SELECT DATETIME AS 시간
FROM (SELECT * FROM ANIMAL_INS ORDER BY DATETIME DESC)
WHERE ROWNUM <= 1
;