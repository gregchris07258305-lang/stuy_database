import psycopg2

# 1. DB 연결 정보
db_host = "db_postgresql"
db_port = "5432"
db_name = "main_db"
db_user = "admin"
db_password = "admin123"


conn = psycopg2.connect(
    host=db_host,
    port=db_port,
    dbname=db_name,
    user=db_user,
    password=db_password
)
print("✅ DB 연결 성공")

with conn.cursor() as cursor:
    # UUID 확장 기능 (필수)
    cursor.execute('CREATE EXTENSION IF NOT EXISTS "uuid-ossp";')


    # 📌 문제 1: 테이블 생성

    cursor.execute("DROP TABLE IF EXISTS students;")
conn.commit()

with conn.cursor() as cursor:
    cursor.execute("""
        CREATE TABLE students (
            id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
            name VARCHAR(50),
            age INT
        );
    """)
    print("1번(테이블 생성) 완료")
conn.commit()

    # 📌 문제 2: 데이터 입력 (INSERT)

with conn.cursor() as cursor:
    cursor.execute("INSERT INTO students (name, age) VALUES ('홍길동', 23);")
    cursor.execute("INSERT INTO students (name, age) VALUES ('이영희', 21);")
    cursor.execute("INSERT INTO students (name, age) VALUES ('박철수', 26);")
    print("2번(INSERT) 완료")
conn.commit()


    # 📌 문제 3: 조회 (SELECT) - 문제 요구사항이므로 실행만 함

with conn.cursor() as cursor:   
    # 3-1. 전체 조회
    cursor.execute("SELECT * FROM students;")
    print(f"전체 조회 결과: {cursor.fetchall()}")

    # 3-2. 22세 이상
    cursor.execute("SELECT * FROM students WHERE age >= 22;")
    print(f"22세 이상 결과: {cursor.fetchall()}")

    # 3-3. 이름이 홍길동
    cursor.execute("SELECT * FROM students WHERE name = '홍길동';")
    print(f"'홍길동' 찾기 결과: {cursor.fetchall()}")
conn.commit()

    # 📌 문제 4: 수정 (UPDATE)

with conn.cursor() as cursor:
    cursor.execute("UPDATE students SET age = 25 WHERE name = '이영희';")
    print("4번(UPDATE) 완료")
conn.commit()
    # 📌 4-1
with conn.cursor() as cursor:
    cursor.execute("SELECT id FROM students WHERE name = '이영희';")
    records = cursor.fetchall()
    for record in records:
        target_id = record[0]
        sql = f"UPDATE students SET age = 25 WHERE id = '{target_id}';"
        cursor.execute(sql)
conn.commit()    


    # 📌 문제 5: 삭제 (DELETE)

with conn.cursor() as cursor:
    cursor.execute("SELECT id, name FROM students;")
    records = cursor.fetchall()

    target_student = records[2] 
    target_id = target_student[0] # 그 학생의 ID만 꺼냄
    target_name = target_student[1] # 확인용 이름

    sql = f"DELETE FROM students WHERE id = '{target_id}';"
    cursor.execute(sql)

conn.commit()

    # 📌 문제 6: PRIMARY KEY 에러 테스트

with conn.cursor() as cursor:

    cursor.execute("DROP TABLE IF EXISTS books;")
    cursor.execute("""
        CREATE TABLE books (
            book_id INT PRIMARY KEY,
            title VARCHAR(100),
            price INT
        );
    """)
    cursor.execute("INSERT INTO books VALUES (1, '책 A', 10000);")
    
    try:
        # 중복 ID 입력 시도 (에러 발생해야 정상)
        cursor.execute("INSERT INTO books VALUES (1, '책 B', 15000);")
    except psycopg2.IntegrityError:
        print("✅ 6번(PK 중복 에러 확인) 성공: 정상적으로 에러가 발생했습니다.")
        conn.rollback() # 에러가 났으니 롤백 처리
conn.commit()