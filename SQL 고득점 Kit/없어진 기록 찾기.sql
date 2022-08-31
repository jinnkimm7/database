-- https://school.programmers.co.kr/learn/courses/30/lessons/59042
-- 코드를 입력하세요
SELECT o.ANIMAL_ID, o.NAME
FROM ANIMAL_OUTS o LEFT OUTER JOIN ANIMAL_INS i
ON o.ANIMAL_ID = i.ANIMAL_ID
WHERE i.ANIMAL_ID IS NULL
ORDER BY o.ANIMAL_ID
;