# JOIN

## 정규화와 JOIN
- 정규화
  - 이상현상(Anomaly) 발생을 피하기 위해 테이블을 분할
  - 학계/실무에서 주로 3NF(3차 정규형)을 사용
- JOIN
  - 데이터의 통합 조회를 위해 여러 테이블을 연결
  - 실제 JOIN 연산은 두 개의 테이블에 대해서만 적용됨
  - 일반적인 경우 PK/FK의 연관에 의해 JOIN이 성립
  - 그 외에도 논리적인 값들의 연관성으로만 JOINI 성립 가능

## EQUI JOIN(동등조인)
  - 조인 조건으로 Equal(=) 연산 사용
  - 중복 칼럼의 경우, 칼럼명 팡에 테이블명을 붙여야함
    - 중복되지 않은 칼럼에도 칼럼명 앞에 테이블명을 붙이는 것을 권장
    - -> 테이블명이긴 경우 ALIAS 사용
  ```sql
  -- ALIAS 미사용
  SELECT EMP.ENAME, EMP.DEPTNO, DEPT.DNAME
  FROM EMP, DEPT
  WHERE EMP.DEPTNO = DEPT.DEPTNO;

    -- ALIAS 사용
  SELECT E.ENAME, E.DEPTNO, D.DNAME
  FROM EMP E, EMP D
  WHERE E.DEPTNO = D.DEPTNO;

  -- 접두어 일부 생략
  SELECT ENAME, E.DEPTNO, DNAME
  FROM EMP E, EMP D
  WHERE E.DEPTNO = D.DEPTNO;

    -- ERROR!!!
  SELECT EMP.NAME, EMP.DEPTNO, DEPT.DNAME
  FROM EMP E, EMP D
  WHERE E.DEPTNO = D.DEPTNO;
  -- FROM절에서 ALIAS 정의 후에는 WHERE/SELECT절에서 테이블명 사용 불가
  ```

## Non EQUI JOIN
  - 조인 조건으로 Equal(=) 이외의 연산 사용
    - Between, >, >=, <, <= 등
    - 예) 사원별 급여 등급 조회
  ```sql
  -- Q) EMP 테이블과 SALGRADE 테이블로부터, 사원명, 급여, 급여등급을 출력하는 질의를 완성하시오.
  SELECT E.NAME 사원명, E.SAL 급여, S.GRADE 급여등급
  FROM EMP E, SALGRADE S
  WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;