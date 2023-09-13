CREATE TABLE products(
	id INT NOT NULL, /*INT -целый числа  AUTO_INCREMENT*/
	nameP NVARCHAR(50),
  	brend NVARCHAR(50),
	cost FLOAT DEFAULT 0 ); /*DEFAULT -  по умолчанию*/
INSERT INTO products (id) VALUES(1);
SELECT * FROM products;
