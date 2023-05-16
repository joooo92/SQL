--집합연산자
--UNINON - 합집합, UNION ALL - 합집합, INTERSECT - 교집합, MINUS -차집합

--UNION
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
UNION --위에있는 열과 아래있는 열이 하나로 합쳐짐 
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
-- 첫번째 SELECT는 10행, 밑에꺼는 2행이었는데 합쳐지면서 중복되는 미쉘을 하나만 반출하여 총 11개 반출

--UNION ALL
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
UNION ALL --위에있는 열과 아래있는 열이 하나로 합쳐짐 
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
-- 첫번째 SELECT는 10행, 밑에꺼는 2행이었는데 합쳐지면서 중복되는 미쉘이 둘다 반출하여 총 12개 반출

--INTERSECT
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
INTERSECT --위에있는 열과 아래있는 열의 교집합 (겹치는거) 
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
-- 둘다 미쉘이 있으니 미쉘 반출

--MINUS 
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%'
MINUS --위에있는 열과 아래있는 열의 차집합 (겹치는거 안뇽) 
SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE DEPARTMENT_ID = 20;
-- 첫번째열에서 두번째열 빼는 것, 즉, 교집합부분이 날라감. 

--집합연산자는 컬럼수가 일치해야 합니다. 
--컬럼수가 일치한다면, 다양한 형태로 사용이 됩니다. 
SELECT '홍길동', TO_CHAR(SYSDATE) FROM DUAL
UNION ALL
SELECT '이순신', '05/01/01' FROM DUAL
UNION ALL
SELECT '홍길자', '06/02/02' FROM DUAL
UNION ALL
SELECT LAST_NAME, TO_CHAR(HIRE_DATE) FROM EMPLOYEES;

-----------------------------------------------------------------------------
--분석함수 - 행에대한 결과를 출력하는 기능, OVER() 와 함께 사용됩니다. 
SELECT FIRST_NAME,
       SALARY, 
       RANK() OVER(ORDER BY SALARY DESC) AS 중복순서,
       DENSE_RANK() OVER(ORDER BY SALARY DESC) AS 중복순서X,
       ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS 데이터번호, --데이터의 번호
       COUNT(*) OVER(), --전제데이터 개수
       ROWNUM AS 조회순서-- 조회가 일어난 순서
FROM EMPLOYEES;













