------------------------------------------------------------------
--���� 1.
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
---EMPLOYEES ���̺��� job_id�� IT_PROG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���
SELECT *
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

SELECT COUNT(*)
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

SELECT *
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG');





--���� 2.
---DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
--EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.

SELECT *
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.MANAGER_ID = D.MANAGER_ID
WHERE E.MANAGER_ID = 100;




--���� 3.
---EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
---EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID > (SELECT MANAGER_ID
                    FROM EMPLOYEES
                    WHERE FIRST_NAME = 'Pat');
                    

SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IN (SELECT MANAGER_ID
                     FROM EMPLOYEES
                     WHERE FIRST_NAME = 'James');

--���� 4.
---EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
 
SELECT *
FROM (SELECT FIRST_NAME, 
             ROWNUM AS RN
        FROM(SELECT * 
             FROM EMPLOYEES 
             ORDER BY FIRST_NAME DESC)
)
WHERE RN >= 41 AND RN <= 50;
        



--���� 5.
---EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ, 
--�Ի����� ����ϼ���.
--����
SELECT *
FROM( SELECT HIRE_DATE,
            EMPLOYEE_ID,
            FIRST_NAME,
            PHONE_NUMBER,
             ROWNUM AS RN
      FROM(SELECT * FROM EMPLOYEES ORDER BY HIRE_DATE ASC)
)
WHERE RN >=31 AND RN <=40;





--���� 6.
--employees���̺� departments���̺��� left �����ϼ���
--����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
--����) �������̵� ���� �������� ����
SELECT E.EMPLOYEE_ID, 
       CONCAT(E.FIRST_NAME, E.LAST_NAME), 
       E.DEPARTMENT_ID, 
       D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY EMPLOYEE_ID;

--���� 7.
--���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
SELECT E.EMPLOYEE_ID, 
       CONCAT(E.FIRST_NAME, E.LAST_NAME), 
       E.DEPARTMENT_ID, 
       (SELECT DEPARTMENT_NAME FROM DEPARTMENTS D WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID) AS �μ���
FROM EMPLOYEES E
ORDER BY EMPLOYEE_ID;

--���� 8.
--departments���̺� locations���̺��� left �����ϼ���
--����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
--����) �μ����̵� ���� �������� ����
SELECT D.DEPARTMENT_ID, 
       D.DEPARTMENT_NAME, 
       D.MANAGER_ID, 
       D.LOCATION_ID, 
       L.STREET_ADDRESS, 
       L.POSTAL_CODE, 
       L.CITY
FROM DEPARTMENTS D LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
ORDER BY DEPARTMENT_ID;


SELECT * FROM LOCATIONS;
SELECT * FROM DEPARTMENTS;



--���� 9.
--���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
SELECT D.DEPARTMENT_ID, 
       D.DEPARTMENT_NAME, 
       D.MANAGER_ID,  
       D.LOCATION_ID,
       (SELECT STREET_ADDRESS FROM LOCATIONS L WHERE D.LOCATION_ID = L.LOCATION_ID) AS STREET_ADDRESS,
       (SELECT POSTAL_CODE FROM LOCATIONS L WHERE D.LOCATION_ID = L.LOCATION_ID) AS POSTAL_CODE,
       (SELECT CITY FROM LOCATIONS L WHERE D.LOCATION_ID = L.LOCATION_ID) AS CITY 
FROM DEPARTMENTS D 
ORDER BY DEPARTMENT_ID;



--���� 10.
--locations���̺� countries ���̺��� left �����ϼ���
--����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
--����) country_name���� �������� ����

SELECT L.LOCATION_ID,
       L.STREET_ADDRESS,
       L.CITY,
       L.COUNTRY_ID,
       C.COUNTRY_NAME
FROM LOCATIONS L LEFT JOIN COUNTRIES C ON L.COUNTRY_ID = C.COUNTRY_ID
ORDER BY COUNTRY_NAME;


SELECT * FROM LOCATIONS;
SELECT * FROM COUNTRIES;

--���� 11.
--���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���

SELECT L.LOCATION_ID,
       L.STREET_ADDRESS,
       L.CITY,
       L.COUNTRY_ID,
       (SELECT C.COUNTRY_NAME FROM COUNTRIES C WHERE L.COUNTRY_ID = C.COUNTRY_ID) AS COUNTRY_NAME
FROM LOCATIONS L 
ORDER BY COUNTRY_NAME;