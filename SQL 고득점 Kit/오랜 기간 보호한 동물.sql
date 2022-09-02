-- https://school.programmers.co.kr/learn/courses/30/lessons/59044
-- 코드를 입력하세요
SELECT *
FROM (SELECT i.NAME, i.DATETIME
    FROM ANIMAL_INS i LEFT JOIN ANIMAL_OUTS o ON i.ANIMAL_ID = o.ANIMAL_ID
    WHERE o.DATETIME IS NULL
    ORDER BY i.DATETIME)
WHERE ROWNUM < 4
;