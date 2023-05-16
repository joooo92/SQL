--���տ�����
--UNINON - ������, UNION ALL - ������, INTERSECT - ������, MINUS -������

--UNION
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
UNION --�����ִ� ���� �Ʒ��ִ� ���� �ϳ��� ������ 
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
-- ù��° SELECT�� 10��, �ؿ����� 2���̾��µ� �������鼭 �ߺ��Ǵ� �̽��� �ϳ��� �����Ͽ� �� 11�� ����

--UNION ALL
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
UNION ALL --�����ִ� ���� �Ʒ��ִ� ���� �ϳ��� ������ 
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
-- ù��° SELECT�� 10��, �ؿ����� 2���̾��µ� �������鼭 �ߺ��Ǵ� �̽��� �Ѵ� �����Ͽ� �� 12�� ����

--INTERSECT
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
INTERSECT --�����ִ� ���� �Ʒ��ִ� ���� ������ (��ġ�°�) 
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
-- �Ѵ� �̽��� ������ �̽� ����

--MINUS 
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
MINUS --�����ִ� ���� �Ʒ��ִ� ���� ������ (��ġ�°� �ȴ�) 
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
-- ù��°������ �ι�°�� ���� ��, ��, �����պκ��� ����. 

--���տ����ڴ� �÷����� ��ġ�ؾ� �մϴ�. 
--�÷����� ��ġ�Ѵٸ�, �پ��� ���·� ����� �˴ϴ�. 
SELECT 'ȫ�浿', TO_CHAR(SYSDATE) FROM DUAL
UNION ALL
SELECT '�̼���', '05/01/01' FROM DUAL
UNION ALL
SELECT 'ȫ����', '06/02/02' FROM DUAL
UNION ALL
SELECT LAST_NAME, TO_CHAR(HIRE_DATE) FROM EMPLOYEES;

-----------------------------------------------------------------------------
--�м��Լ� - �࿡���� ����� ����ϴ� ���, OVER() �� �Բ� ���˴ϴ�. 
SELECT FIRST_NAME,
       SALARY, 
       RANK() OVER(ORDER BY SALARY DESC) AS �ߺ�����,
       DENSE_RANK() OVER(ORDER BY SALARY DESC) AS �ߺ�����X,
       ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS �����͹�ȣ, --�������� ��ȣ
       COUNT(*) OVER(), --���������� ����
       ROWNUM AS ��ȸ����-- ��ȸ�� �Ͼ ����
FROM EMPLOYEES;













