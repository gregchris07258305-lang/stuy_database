## UUID primary key 사용
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TABLE users_uuid_name (
  id_name UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(100)
);
INSERT INTO users_uuid_name (name) VALUES ('Alice');

SELECT * FROM users_uuid_name

INSERT INTO users_uuid_name (name) 
VALUES ('Alice'),('Bob'),('Charlie');

UPDATE users_uuid_name
SET name = 'UpdatedName'
WHERE id_name = 'ab7c67d6-8f5c-4ae2-b413-5d867553fa4a';

DELETE FROM users_uuid_name
WHERE id_name = 'ab7c67d6-8f5c-4ae2-b413-5d867553fa4a';