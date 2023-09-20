# CREATE TABLE books(
# 	id INT AUTO_INCREMENT PRIMARY KEY,
#   	title_book VARCHAR(50)
# );

# CREATE TABLE authorse (
# 	id INT AUTO_INCREMENT PRIMARY KEY,
#   	nameA VARCHAR(50)
# );

# CREATE TABLE authorse_books(
#   id_authorse INT,
#   id_books INT,
#   FOREIGN KEY(id_authorse) REFERENCES authorse(id),
#   FOREIGN KEY(id_books) REFERENCES books(id)
# );

# INSERT INTO authorse (nameA) VALUES
# ('Duma'),
# ('Druon'),
# ('Pushkin'),
# ('Lermontov');

# INSERT INTO books (title_book) VALUES
# ('Prok. koroli'),
# ('Askanio'),
# ('Cherniy tulpan'),
# ('33 Bogatirya'),
# ('Ler_books');

# # SELECT * FROM authorse;

# # SELECT * FROM books;

# INSERT INTO authorse_books (id_authorse, id_books) VALUES
# (1, 2),
# (1, 3),
# (2, 1),
# (1, 1),
# (2, 4),
# (3, 4),
# (4, 5);

# # SELECT * FROM authorse_books, authorse, books WHERE id_authorse = authorse.id AND id_books = books.id;





# # -- Показать книгу '33 Bogatirya' и ее авторов
# # SELECT nameA, title_book as author FROM authorse_books, authorse, books WHERE id_authorse = authorse.id AND id_books = books.id AND title_book = '33 Bogatirya';

# # -- Показать Duma  и его книги
# # SELECT nameA as author, title_book as title  FROM authorse_books, authorse, books WHERE id_authorse = authorse.id AND id_books = books.id AND nameA = 'Duma';



# SELECT * from authorse WHERE nameA = '';#  "Duma"   ->  ' or '1'='1   
# -- ПОСМОТРЕТЬ количества книг у одного автора 
# -- ПОСМОТРЕТЬ количества авторов  у одной книги 















CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY, 
	nameP VARCHAR(50),
  	type VARCHAR(50),
	cost FLOAT DEFAULT 0); /*DEFAULT -  по умолчанию*/
    
CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY, 
	nameC VARCHAR(50),
  	adress VARCHAR(50)
);
CREATE TABLE customer_product(
      id_customer INT,
      id_product INT,
  	  FOREIGN KEY(id_customer) REFERENCES customers(id)
	  
);

INSERT INTO products(nameP, type, cost)  VALUES
("свитер женский","одежда",100),
("гвозди","инструменты",10),
("молоток","инструменты",200),
("корм для кошек","корма для животных", 100);


INSERT INTO customers(nameC, adress)  VALUES
("Иванов Иван", "Россия, Москва"),
("Иванова Ивана", "Россия, Москва"),
("Смирнов Иван", "Россия, Казань"),
("Ляшов Антон", "Россия, Томск"),
("Онегин Антон", "Россия, Тверь"), 
("Смирнов Иван Иванович", "Россия, Казань");

INSERT INTO customer_product (id_customer, id_product) VALUES
(1,1),
(2,1),
(3,1),
(1,2),
(4,3),
(4,4),
(3,5),
(6, 1);

select * from customers;
#select * from customer_product, customers, products WHERE 



# # показать все заказы покупателя "Иванов" и "Иванова"
# SELECT * FROM customers, products, customer_product WHERE id_customer = customers.id AND id_product = products.id AND customers.nameC LIKE "Иванов%";

# # показать все заказы покупателя "Иван" и "Ивана"
# SELECT * FROM customers, products, customer_product WHERE id_customer = customers.id AND id_product = products.id AND customers.nameC LIKE "%Иван%";



-- это маска пример 
-- *.txt - для винды все файлы с таким расширением


--  в sql маски
--  % - любое кол-во символов
-- _  - строго 1 символ

# показать все заказы в город, который начинается на "К"
SELECT * FROM customers, products, customer_product WHERE id_customer = customers.id AND id_product = products.id AND customers.adress LIKE "%, К%"; 



# показать всех покупателей, которые закали этот товар
