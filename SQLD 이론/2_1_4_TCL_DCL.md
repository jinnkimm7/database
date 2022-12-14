# TCL / DCL

## 트랜잭션
- 데이터베이스의 논리적 연산 단위
  - 의미적으로 분할할 수 없는 최소의 단위
  - 일반적으로 하나의 트랜잭션은 여러 SQL문을 포함함
  - `성공시 모든 연산을 반영, 취소시 모든 연산을 취소함 -> All or Nothing`

  - 트랜잭션의 예
    - 도서주문
      - 재고 수량 감소, 주문 내역 생성, 결제, 포인트 적립
    - 계좌이체
      - 원 계좌의 잔액 감소, 다른 계좌의 잔액 증가
    - 교통카드 충전
      - 잔액 증가, 결제 
## 트랜잭션의 특성(ACID)
- 원자성 (Atomicity)
  - 트랜잭션에서 정의된 연산들은 모두 성공적으로 실행되던지 아니면 전혀 실행되지 않은 상태로 남아 있어야한다. (All or Nothing)
- 일관성 (Consistency)
  - 트랜잭션이 실행 되기 전의 데이터베이스 내용이 잘못 되어 있지 않다면, 트랜잭션이 실행된 이후에도 데이터베이스의 내용에 잘못이 있으면 안된다.
- 고립성 (Isolation)
  - 트랜잭션이 실행되는 도중에 다른 트랜잭션의 영향을 받아서는 안된다.
- 지속성 (Durability)
  - 트랜잭션이 성공적으로 수행되면 그 트랜잭션이 갱신한 데이터베이스의 내용은 영구적으로 저장된다.
- 트랜잭션의 ACID 특성을 보장하기 위해 DBMS는 동시성 제어(Concurrency Control) 수행
  - Lock 기반, Timestamp 기반

## TCL
- COMMIT 실행 전 상태에서는 ...
  - UPDATE PLAYER SET HEIGHT = HEIGHT + 10;
  - 변경된 내용은 메모리에 임시 저장됨
  - 현재 사용자는 증가한 HEIGHT 값을 읽을 수 있음
  - 다른 사용자는 증가 전 HEIGHT 값만 읽을 수 있음
  - HEIGHT에는 잠금(locking)이 설정되어 다른 사용자는 값을 변경할 수 없음.

- COMMIT 실행 후
  - 변경된 내용은 DB에 저장됨
  - 변경 내용을 모든 다른 사용자가 볼 수 있음
  - 이전 데이터는 모두 사라짐(별도 로그보관시 복구 가능)
  - 관련 행에 대한 잠금이 해제되어 모든 사용자가 변경할 수 있음

---

- 정의 : 트랙잭션을 제어하기 위한 명령어
  - COMMIT : 변경된 내용을 영구적으로 DB에 저장
  - ROLLBACK
    - 기본 - 변경된 내용을 버리고 변경 전 상태(마지막 커밋)로 복귀
    - savepoint를 지정한 경우, 지정한 저장점까지만 복귀
  - 트랜잭션은 SQL문 실행시 자동 시작, COMMIT/ROLLBACK 실행시 종료
  - 자동 커밋 / 자동 롤백
    - DDL문장 수행시 DDL 수행 전에 자동으로 커밋
    - DB를 정상적으로 접속 종료하면 자동 커밋
    - 애플리케이션의 이상 종료로 DB와의 접속이 단절되었을때 자동 롤백

## ROLLBACK
  - ROLLBACK 이후의 데이터의 상태
    ```sql
    COMMIT;

    UPDATE PLAYER SET HEIGHT = HEIGHT + 10;
    DELETE FROM PLAYER;

    ROLLBACK;
    ```
  - 변경한 내용이 모두 취소됨
  - 이전 데이터가 다시 재저장됨
  - 관련된 행에 대한 잠금이 해제되어 모든 사용자가 변경할 수 있음

## SAVEPOINT
  - 미리 지정한 SAVEPOINT까지만 ROLLBACK
    - 특정 저장점까지 롤백하면 `그 이후`의 명령과 저장점은 모두 `무효`가 됨
    - 일부 tool에서는 지원되지 않음
    - 동일 이름으로 여러 저장점 정의시 나중에 정의한 저장점이 유효

---

## DCL
- 사용자의 계정 생성/삭제, 권한 부여/회수에 대한 명령어
- DROP 연산 수행시..
  - CASCADE 옵션 사용시 사용자가 생성한 객체도 함께 삭제됨
  - CASCADE 옵션 미사용시 사용자가 객체를 갖고 있지 않은 경우에만 삭제 실행

- SESSION 생성권한
  - 로그인을 위해 CREATE SESSION 권한 필요
  ```sql
  GRANT CREATE SESSION TO kmumis;
  ```
- Object 권한
  - 테이블 생성을 위해 CREATE TABLE 군한 필요
  ```sql
  GRANT CREATE TABLE TO kmumis;
  ```
- 다른 Object 권한
  - `GRANT` 권한 `ON` 소유계정. 테이블명 `TO` 계정명
  ```sql
  GRANT SELECT ON kmumis.PLAYER TO mis1;
  ```