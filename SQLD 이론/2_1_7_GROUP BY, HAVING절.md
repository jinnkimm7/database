# GROUP BY, HAVING절

## 다중 행 함수 (Multi-Row Function)
- 여러 행의 그룹에 대해 적용되는 함수
- 다중 행 함수의 종류
  - 그룹 함수
   - 집계함수 : COUNT, SUM, AVG, MAX/MIN 등
   - 고급 집계 함수 : ROLLUP, CUBE, GROUPING SETS
  - 윈도우 함수

## 집계 함수
- 여러행의 그룹에 대한 연산을 통해 하나의 결과를 반환
- SELECT, HAVING, ORDER BY절에서 사용 가능
- GROUP BY 절을 통해 그룹핑 기준 명시
- NULL을 제외하고 계산
  - 100명 중 10명의 성적이 NULL일 때, 전체 평균은 90명에 대한 평균
  - 입력행 전체가 NULL인 경우만, 결과의 값이 NULL임
- DISTINCT | ALL - Default는 ALL
  - DISTINCT : 같은 값을 갖는 여러 데이터를 한건으로 간주

## GROUP BY
- 집계함수는 일반적으로 GROUP BY절을 사용하여 그룹별 연산 수행
  - 소그룹별 집계시 GROUP BY 사용
- 여러 행들의 그룹이 모여서 그룹 당, 단 하나의 결과를 돌려주는 다중행 함수중 하나

## GROUP BY ~ HAVING ~
- 평균키가 180센티미터 이상인 정보만 표시
```sql
SELECT POSITION, ROUND(AVG(HEIGHT), 2) 평균키
FROM PLAYER
GROUP BY POSITION
HAVING AVG(HEIGHT) >= 180;
```
- Q) 포지션별 키의 평균을 출력하되, 해당 포지션의 키의 최대값이 190cm 이상인 경우에만 출력하는 질의를 완성하시오.
```sql
SELECT POSITION, ROUND(AVG(HEIGHT), 2) 평균키
FROM PLAYER
GROUP BY POSITION
HAVING MAX(HEIGHT) >= 190;
```

**SELECT문의 구조 및 실행 순서*
> ```sql
> SELECT POSITION, ROUND(AVG(HEIGHT), 2) 평균키
> FROM PLAYER
> WHERE HEIGHT IS NOT NULL
> GROUP BY POSITION
> HAVING AVG(HEIGHT) > 190
> ORDER BY AVG(HEIGHT) DESC;
> ```
> FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

## 칼럼의 유효 범위
- 관계형 데이터베이스는 데이터를 행 단위로 메모리에 복사
  - SELECT절에서 명시되지 않은 칼럼도 WHERE, ORDER BY 절에서 사용 가능
- GROUP BY가 사용되는 경우
  - SELECT절에서 명시되지 않은 집계 칼럼을 HAVING, ORDER BY에 사용 가능
- 인라인 뷰(Inline View)가 사용되는 경우
  - 새로운 테이블 구조가 생성된 것으로 이해해야 함
    - 인라인뷰의 SELECT절에 명시되지 않은 칼럼은 메인 쿼리에서 사용 불가
  
