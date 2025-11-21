import psycopg2

"""PostgreSQL 데이터베이스에 연결합니다."""
# 환경 변수 또는 기본값으로 데이터베이스 연결 정보 설정
db_host =  "db_postgresql"
db_port =  "5432"
db_name = "main_db"
db_user =  "admin"
db_password = "admin123"

conn = psycopg2.connect(
    host=db_host,
    port=db_port,
    dbname=db_name,
    user=db_user,
    password=db_password
)
print("PostgreSQL 데이터베이스에 성공적으로 연결되었습니다.")

with conn.cursor() as cursor:
    # cursor.execute("INSERT INTO users_uuid_name (name) VALUES ('from code');")
    # cursor.execute("""UPDATE users_uuid_name
    #                 SET name = 'code Name'
    #                 WHERE id_name = 'ab7c67d6-8f5c-4ae2-b413-5d867553fa4a';""")
    #cursor.execute("""DELETE FROM users_uuid_name
    #                WHERE id_name = 'ab7c67d6-8f5c-4ae2-b413-5d867553fa4a';""")
    cursor.execute("SELECT name, id_name FROM users_uuid_name;")
    records = cursor.fetchall() ## < 이게 가지고 온 정보를 row단위가 아닌 테이블 전체를 가지고 오는 명령어
    for record in records:
        print(f'{record[0]} : {record[1]}')  
     

conn.commit()