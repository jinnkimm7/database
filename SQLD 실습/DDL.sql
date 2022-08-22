-- 테이블 생성 SQL문
create table stadium (
  stadium_id    char(3) not null,
  stadium_name  varchar2(40) not null,
  hometeam_id   char(3),
  seat_count    number,
  address       varchar2(60),
  ddd           varchar2(3),
  constraint    stadium_pk primary key (stadium_id),
);

-- 제약 조건의 지정
create table player1 (
  player_id char(7) primary key,
  player_name varchar2(20) not null,
  nickname varchar2(30) unique,
  height number(3) check (height >= 150 and height <= 200),
  team_id char(3) references team(team_id),
);

-- 기존 테이블을 활용해 새로운 테이블 생성
-- 단, 제약조건은 not null만 복제됨.
create table player_temp
as select * from player;

-- alter
alter table player_temp add (address varchar2(80));

-- drop
alter table player_temp drop column address;

-- rename
alter table player_temp rename column player_id to player_new_id;

-- modify
alter table player_temp modify (player_name null);

alter table player_temp
add constraint player_temp_pk
primary key (player_new_id);

alter table player_temp
drop constraint player_temp_pk;

-- rename
rename player_temp to old_player;