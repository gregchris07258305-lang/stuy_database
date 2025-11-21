import psycopg2

# 1. DB 연결 정보
db_host = "db_postgresql"
db_port = "5432"
db_name = "main_db"
db_user = "admin"
db_password = "admin123"

try:
    # DB 연결
    conn = psycopg2.connect(
        host=db_host,
        port=db_port,
        dbname=db_name,
        user=db_user,
        password=db_password
    )
    print("✅ DB 연결 성공")

    with conn.cursor() as cursor:
        # ---------------------------------------------------------
        # 📂 SQL 파일 읽어오기 (핵심 부분)
        # ---------------------------------------------------------
        file_path = 'solution.sql'  # 같은 폴더에 있는 파일명
        
        print(f"📂 '{file_path}' 파일을 읽고 실행합니다...")
        
        with open(file_path, 'r', encoding='utf-8') as f:
            sql_script = f.read() # 파일 내용을 문자열로 다 가져옴
            
        # 읽어온 SQL 전체 실행
        cursor.execute(sql_script)
        
        print("🎉 SQL 파일 실행 완료!")

    # 변경사항 저장 (Commit)
    conn.commit()

except Exception as e:
    print(f"❌ 실행 중 에러 발생: {e}")
    # 에러나면 취소 (Rollback)
    conn.rollback()

finally:
    if conn:
        conn.close()
        print("🔒 연결 종료")

SELECT id, name, age
FROM students
