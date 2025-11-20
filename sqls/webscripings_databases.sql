CREATE TABLE study_webscripings_database (
    contents varchar(500),
    link varchar(500),
    link_html varchar(500),
    link_href varchar(500)
);

select *
FROM study_webscripings_database;

식별 ID 있는 CREATE TABLE

CREATE TABLE study_webscripings_database (
    id VARCHAR(500)  PRIMARY KEY, ##여기서는 프라이머리 key가 되게 중요한 내용이래요 ~ 중복이되면 error가 남
    contents VARCHAR(500),
    link VARCHAR(500),
    link_html VARCHAR(500),
    link_href VARCHAR(500),
    created_at VARCHAR(500) DEFAULT NOW()
