CREATE TABLE IF NOT EXISTS shop_products (
    name VARCHAR(100),
    price INT,
    stock INT,
    category VARCHAR(50)
);

INSERT INTO
    shop_products (name, price, stock, category)
VALUES ('USB 메모리', 12000, 50, '전자제품'),
    ('블루투스 스피커', 45000, 20, '전자제품'),
    ('물병', 5000, 100, '생활용품');

SELECT * FROM shop_products WHERE price >= 10000;

UPDATE shop_products SET stock = 80 WHERE name = '물병';

DELETE FROM shop_products WHERE name = '블루투스 스피커';