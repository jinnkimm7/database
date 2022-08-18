-- desc 테이블에 대한 설명(테이블 구조 확인)
desc player;

-- select : 테이블에 존재하는 레코드 값을 조회
-- * : tbl에 있는 모든 컬럼값 출력
select * from player;

-- distinct : 중복 데이터를 한 건으로 출력 (디폴트값은 all이다)
select distinct position from player;

-- select - 별칭 사용
-- as는 optional이지만, 넣는 거 추천
-- 별칭이 특수문자, 공백인 경우 큰 따옴표 사용
select player_name as 선수명, position as 위치 from players;

-- order by : 출력시 정렬 기준 설정
-- sql 문장의 맨 마지막에 위치
-- 오름차순 asc(디폴트값) 내림차순 desc / 참고로 오라클에서 null값은 가장 큰 값으로 취급됨

-- 선수명과 키를 키 오름차순으로 출력
select player_name, height from players order by height asc;

-- 선수명과 키를 키 내림차순, 선수명 오름차순으로 출력
-- select문에 없는 것도 order by절에서 사용할 수 있다.
select player_name, height from player order by height desc, player_name asc;

-- where절 : 특정 조건을 만족하는 데이터를 한정하기 위해 사용
-- select를 컬럼이라고 생각하고, where을 row라고 생각하면 편한다.
select player_id, position from players where position = "GK";

-- 연산자는 select 문에도 사용 가능
select player_name, (height - 100) * 0.9 - weight as balance
where (height - 100) * 0.9 - weight > 0;

-- null에 연산한 결과는 null이다.
-- 산술연산자는 NUMBER와 DATE 자료형에 대해 적용.
-- 비교연산자는 모든 자료형에 대해 적용 가능하다. (문자열에도 적용된다는 뜻)
-- 문자열의 크기는 사전 순으로 수행됨
-- NULL에는 비교연산자 사용 불가

select player_id, player_name, nation from player where nation is null;
select player_id, player_name, nation from player where nation is not null;