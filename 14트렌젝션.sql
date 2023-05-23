--트랜잭션(논리적 작업단위)

SHOW AUTOCOMMIT;
--오토커밋 온
SET AUTOCOMMIT ON;
--오토커밋 오프
SET AUTOCOMMIT OFF;

DELETE FROM DEPTS WHERE DEPARTMENT_ID = 10;

SAVEPOINT DELETE10; --세이브포인트 기록

DELETE FROM DEPTS WHERE DEPARTMENT_ID = 20;

SAVEPOINT DELETE20; --세이브포인트 기록

ROLLBACK TO DELETE10; --10번 세이브포일트 롤백

ROLLBACK; --마지막커밋시점
SELECT * FROM DEPTS;


---------------------------------------------------------------
INSERT INTO DEPTS VALUES(300, 'DEMO', NULL, 1800);

COMMIT; -- 데이터 반영(트랜젝션 반영)

SELECT * FROM DEPTS;



















