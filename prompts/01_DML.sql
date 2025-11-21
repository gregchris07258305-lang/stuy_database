📌 문제 1 — 테이블 생성 (PRIMARY KEY 기초)
아래 요구사항에 맞는 CREATE TABLE 문을 작성하시오.
✔ 요구사항
테이블명: students
컬럼:
id (INT, PRIMARY KEY)
name (VARCHAR(50))
age (INT)


## 문제 2 — CREATE (INSERT) 기초
##답
INSERT INTO students (id, name, age) VALUES (1, '홍길동', 23);
INSERT INTO students (id, name, age) VALUES (2, '이영희', 21);
INSERT INTO students (id, name, age) VALUES (3, '박철수', 26);

## 문제 3 — READ (SELECT) 기본 조회
##답
-- students 테이블의 전체 데이터를 조회
SELECT * FROM students;

-- 나이가 22세 이상인 학생만 조회
SELECT * FROM students WHERE age >= 22;

-- name 이 “홍길동”인 학생만 조회
SELECT * FROM students WHERE name = '홍길동';

## 문제 4 — UPDATE 연습
##답
UPDATE students SET age = 25 WHERE id = 2;

## 문제 5 — DELETE 연습
##답
DELETE FROM students WHERE id = 3;

## 문제 6 — PRIMARY KEY 이해 문제
##답
어떤 에러가 발생하는가?:
SQL 에러가 발생합니다. 일반적으로 "Duplicate entry for key 'PRIMARY'" 또는 "PRIMARY KEY constraint violation"과 같은 메시지가 나타납니다.

왜 발생하는가?:
PRIMARY KEY로 지정된 `book_id` 컬럼에 이미 '1'이라는 값이 삽입되었는데, 두 번째 INSERT 문에서 다시 '1'이라는 값을 삽입하려고 시도했기 때문입니다. PRIMARY KEY는 테이블 내에서 각 행을 고유하게 식별해야 하므로 중복된 값을 허용하지 않습니다.

PRIMARY KEY 의 규칙을 쓰시오.:
1. 고유성 (Uniqueness): PRIMARY KEY 컬럼의 값은 테이블 내에서 모든 행에 대해 고유해야 합니다. 즉, 중복된 값을 가질 수 없습니다.
2. NOT NULL: PRIMARY KEY 컬럼의 값은 NULL이 될 수 없습니다. 모든 행은 PRIMARY KEY 값을 반드시 가져야 합니다.
3. 하나의 테이블에 하나의 PRIMARY KEY만 존재할 수 있습니다. (PRIMARY KEY는 여러 컬럼을 조합하여 구성될 수 있지만, 최종적으로는 테이블당 하나만 지정됩니다.)
4. 테이블의 각 행을 식별하는 데 사용되는 가장 중요한 키입니다.