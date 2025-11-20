CREATE TABLE  web_links (
    link_text varchar(255),
    link_url varchar(255),
    category varchar(255),
);

INSERT INTO web_links (link_text, link_url, category)
VALUES ('네이버', 'https://naver.com', 'portal'),
('구글', 'https://google.com', 'portal'),
('깃허브', 'https://github.com', 'dev');

SELECT * FROM web_links 
WHERE category = 'portal';

UPDATE web_links
SET category = 'code'
WHERE link_text = '깃허브';

DELETE FROM web_links
WHERE link_text = '네이버';
