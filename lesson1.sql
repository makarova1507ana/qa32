CREATE TABLE products(
	id INT NOT NULL UNIQUE KEY, /*INT -целый числа NOT NULL- Обязательный к заполнению unique key -уникальный ключ*/
	nameP NVARCHAR(50),
  	brend NVARCHAR(50),
	cost FLOAT DEFAULT 0); /*DEFAULT -  по умолчанию*/
    
#---------------------------INSERT INTO-----------------------------------#
INSERT INTO products (id) VALUES(1); #INSERT INTO - вставка строки в таблицу
INSERT INTO products VALUES(2, "помидоры", "Zarya", 500); 
INSERT INTO products (id, cost) VALUES(3, 1400); 
# множественная вставка
INSERT INTO products (id, nameP) VALUES (4, "banana"), (5, "apple"), (6, "lemon"); 
INSERT INTO products (id, nameP, cost) VALUES (7, "Огурцы", 200), (8, "арбузы", 300), (9, "дыни",700); 


SELECT * FROM products; #ПОЛУЧЕНИЕ ДАННЫХ
SELECT nameP FROM products; #ПОЛУЧЕНИЕ ДАННЫХ

SELECT * FROM products WHERE nameP = "Огурцы"; #ПОЛУЧЕНИЕ ДАННЫХ с уточнением
SELECT nameP, cost FROM products WHERE cost>300;


# /*--------------------ЗАДАНИЕ----------------------------*/
# # Создать таблицу для Customers
# # 	id (уникальный номер заказчика)
# # 	name (имя)
# #	city (город)
# # 	rating (рейтинг)
# #
# # вставить 3-х разных заказчиков

# CREATE TABLE Customers(
# 	id INT NOT NULL, 
# 	nameC NVARCHAR(50),
#   	city NVARCHAR(50),
# 	rating  INT(10));
    
# INSERT INTO Customers VALUES (1, "Ivan", "Omsk", 5),  (2, "Ira", "Kirov", 7);


# # получение данных
# SELECT * FROM Customers;
# SELECT nameC FROM Customers;
