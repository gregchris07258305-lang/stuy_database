CREATE TABLE news_articles (
    title varchar(255),
    url varchar(255),
    author varchar(255),
    published_at varchar(255)
);

SELECT title, url, author, published_at
FROM news_articles;

INSERT INTO news_articles (title, url, author, published_at)
VALUES ('AI 시대 도래', 'https://news.com/ai', '홍길동', '2025-01-01'),
('경제 성장률 상승', 'https://news.com/economy', '이영희', '2025-01-05');

UPDATE news_articles
SET title = 'AI 시대의 새로운 지평'
WHERE title = 'AI 시대 도래';


DELETE FROM news_articles WHERE author='이영희';
