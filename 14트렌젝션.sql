--Ʈ�����(���� �۾�����)

SHOW AUTOCOMMIT;
--����Ŀ�� ��
SET AUTOCOMMIT ON;
--����Ŀ�� ����
SET AUTOCOMMIT OFF;

DELETE FROM DEPTS WHERE DEPARTMENT_ID = 10;

SAVEPOINT DELETE10; --���̺�����Ʈ ���

DELETE FROM DEPTS WHERE DEPARTMENT_ID = 20;

SAVEPOINT DELETE20; --���̺�����Ʈ ���

ROLLBACK TO DELETE10; --10�� ���̺�����Ʈ �ѹ�

ROLLBACK; --������Ŀ�Խ���
SELECT * FROM DEPTS;


---------------------------------------------------------------
INSERT INTO DEPTS VALUES(300, 'DEMO', NULL, 1800);

COMMIT; -- ������ �ݿ�(Ʈ������ �ݿ�)

SELECT * FROM DEPTS;



















