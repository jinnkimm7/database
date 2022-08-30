-- https://school.programmers.co.kr/learn/courses/30/lessons/59041?language=oracle
-- 코드를 입력하세요
SELECT NAME, COUNT(NAME)
FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) >= 2
ORDER BY NAME
;