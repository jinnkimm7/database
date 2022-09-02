-- https://school.programmers.co.kr/learn/courses/30/lessons/59043
-- 코드를 입력하세요
-- join으로 풀기
SELECT i.ANIMAL_ID, i.NAME
FROM ANIMAL_INS i INNER JOIN ANIMAL_OUTS o
ON i.ANIMAL_ID = o.ANIMAL_ID
WHERE i.DATETIME > o.DATETIME
ORDER BY i.DATETIME
;

-- join없이 풀기
SELECT i.ANIMAL_ID, i.NAME
FROM ANIMAL_INS i, ANIMAL_OUTS o
WHERE i.ANIMAL_ID = o.ANIMAL_ID AND i.DATETIME > o.DATETIME
ORDER BY i.DATETIME
;