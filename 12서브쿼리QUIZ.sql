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

--�� �亯
SELECT * 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE MANAGER_ID = 100);



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

--�� �亯 --?? �� ��ȣ, �̸��� ����ϴ°� �ƴϾ���
SELECT *
FROM (SELECT E.*, 
             ROWNUM AS RN
        FROM(SELECT * 
             FROM EMPLOYEES 
             ORDER BY FIRST_NAME DESC) E
      )
WHERE RN >= 41 AND RN <= 50;




--���� 5.
---EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ, 
--�Ի����� ����ϼ���.
--����
SELECT *
FROM( SELECT HIRE_DATE,
            EMPLOYEE_ID,
            FIRST_NAME ,
            PHONE_NUMBER,
             ROWNUM AS RN
      FROM(SELECT * FROM EMPLOYEES ORDER BY HIRE_DATE ASC)
)
WHERE RN >=31 AND RN <=40;

--�ܴ亯
SELECT *
FROM(SELECT E.*,
            ROWNUM RN
        FROM( SELECT HIRE_DATE,
                    EMPLOYEE_ID,
                    FIRST_NAME || ' ' || LAST_NAME AS NAME,
                    PHONE_NUMBER
              FROM EMPLOYEES 
              ORDER BY HIRE_DATE ) E
    )          
WHERE RN BETWEEN 31 AND 40;





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
--?? ��� �������� �Ⱦ�����
SELECT L.LOCATION_ID,
       L.STREET_ADDRESS,
       L.CITY,
       L.COUNTRY_ID,
       (SELECT C.COUNTRY_NAME FROM COUNTRIES C WHERE L.COUNTRY_ID = C.COUNTRY_ID) AS COUNTRY_NAME
FROM LOCATIONS L 
ORDER BY COUNTRY_NAME;

--------------------------------------------------------------------------
--����� ���� ����!
--���� 12. 
--employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 1-10��° �����͸� ����մϴ�
--����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, �μ����̵�, �μ��̸� �� ����մϴ�.
--����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.

SELECT *
FROM(SELECT ROWNUM RN,
            A.*
        FROM(SELECT E.EMPLOYEE_ID,
                    E.FIRST_NAME,
                    E.PHONE_NUMBER,
                    E.HIRE_DATE,
                    E.DEPARTMENT_ID,
                    D.DEPARTMENT_NAME
             FROM EMPLOYEES E 
             LEFT JOIN DEPARTMENTS D
             ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
             ORDER BY HIRE_DATE) A
    )         
WHERE RN > 0 AND RN <= 10;



--���� 13. 
----EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID, 
--DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���

SELECT E.LAST_NAME, E.JOB_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE JOB_ID = 'SA_MAN';

--�� �亯
SELECT E.LAST_NAME,
       E.JOB_ID,
       E.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM (SELECT * 
        FROM EMPLOYEES
        WHERE JOB_ID = 'SA_MAN')E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;




--���� 14
----DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
----�ο��� ���� �������� �����ϼ���.
----����� ���� �μ��� ������� ���� �ʽ��ϴ�

-- �ܴ亯
SELECT D.DEPARTMENT_ID, 
       D.DEPARTMENT_NAME, 
       D.MANAGER_ID,
       E.�ο���
FROM DEPARTMENTS D
INNER JOIN (SELECT DEPARTMENT_ID, 
            COUNT(*) AS �ο���
        FROM EMPLOYEES 
        GROUP BY DEPARTMENT_ID) E 
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY �ο��� DESC;


--���� 15
----�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���
----�μ��� ����� ������ 0���� ����ϼ���
--�ܴ亯
SELECT D.*,
       NVL(E.SALARY,0) AS SALARY,
       L.STREET_ADDRESS,
       L.POSTAL_CODE
FROM DEPARTMENTS D
LEFT JOIN (SELECT DEPARTMENT_ID,
                  TRUNC(AVG(SALARY)) AS SALARY
           FROM EMPLOYEES
           GROUP BY DEPARTMENT_ID)E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
LEFT JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;


--���� 16
---���� 15����� ���� DEPARTMENT_ID�������� �������� �����ؼ� ROWNUM�� �ٿ� 1-10������ ������
--����ϼ���



SELECT *
FROM(SELECT ROWNUM RN,
           X.* 
    FROM(SELECT D.*,
               NVL(E.SALARY,0) AS SALARY,
               L.STREET_ADDRESS,
               L.POSTAL_CODE
        FROM DEPARTMENTS D
        LEFT JOIN (SELECT DEPARTMENT_ID,
                          TRUNC(AVG(SALARY)) AS SALARY
                   FROM EMPLOYEES
                   GROUP BY DEPARTMENT_ID)E
        ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
        LEFT JOIN LOCATIONS L
        ON D.LOCATION_ID = L.LOCATION_ID
        ORDER BY D.DEPARTMENT_ID DESC
        )X
    )
WHERE RN > 0 AND RN <= 20;









