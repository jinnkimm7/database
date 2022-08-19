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

-- 합성(연결) 연산자 - 문자열과 문자열을 연결함
-- 1. concat(str1, str2)
-- 2. str1 || str2

select player_name, height || 'cm' as "선수 신장" from players;

select player_name, concat(height, 'cm') as "선수 신장" from players;

select player_name || '선수' || height || 'cm' as "선수 신상" from players;

-- between
select player_id as '선수 이름', position as '포지션', height as '키'
from player
where height between 170 and 180;

-- in
select player_name, team_id 
from player 
where team_id = 'K04' or team_id = 'K06';

select player_name, team_id
from player
where team_id in ('K04', 'K06');

select player_name, team_id
from player
where team_id <> 'K04' and team_id <> 'K06';

select player_name,team_id
from player
where team_id not in ('K04', 'K06');

select player_id as '선수이름', team_id, position
from player
where (team_id, position) in (('K04', 'GK'), ('K06', 'MF'));

-- like
-- 문자열과 비교 연산
-- 와일드카드 사용 가능 ( % : 임의의 문자 N개, _ : 임의의 문자 1개 )
select player_name
from player
where player_name like = '김%';

-- insert
-- 테이블에 한 건의 레코드를 추가함
-- 문자 또는 날짜 값의 경우 작은 따옴표로 묶음

-- insert into 테이블명 (column_list) values (value_list);
-- 컬럼의 순서는 실제 테이블의 컬럼 순서와 무관
-- 정의하지 않은 컬럼은 null 값이 입력됨

insert into player (player_id, player_name, team_id, birth_date)
values ('2999001', '손흥민', 'K-7', '1991-01-01');

-- insert into 테이블명 values (전체 column의 value_list);
-- 전체 칼럼의 모든 값을 순서대로 입력해야 함.
-- 빈 값은 null 또는 작은따옴표 둘('') 입력

insert into player
values ('2999002', '이승우', '', '', '2010', 'MF', '10', null, null, null, null, null);

-- delete : 테이블에 존재하는 전체 레코드 삭제

delete player;
delete from player;

-- 일반적으로 where절을 사용하여 특정 레코드를 삭제함
delete player
where stadium_id = 'TP1';

-- update : 테이블에 존재하는 전체 레코드의 값 변경

update stadium set stadium_name = '우리 경기장'
where stadium_id = 'TP2';