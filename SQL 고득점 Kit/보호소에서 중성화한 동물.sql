-- https://school.programmers.co.kr/learn/courses/30/lessons/59045
-- 코드를 입력하세요
SELECT i.ANIMAL_ID, i.ANIMAL_TYPE, i.NAME
FROM ANIMAL_INS i INNER JOIN ANIMAL_OUTS o
ON i.ANIMAL_ID = o.ANIMAL_ID
WHERE i.SEX_UPON_INTAKE LIKE 'Intact%' and o.SEX_UPON_OUTCOME NOT LIKE 'Intact%'
ORDER BY i.ANIMAL_ID
;