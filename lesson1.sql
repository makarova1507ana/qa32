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


SELECT * FROM products; #ПОЛУЧЕНИЕ ДАННЫХ
SELECT nameP FROM products; #ПОЛУЧЕНИЕ ДАННЫХ


/*--------------------ЗАДАНИЕ----------------------------*/
# Создать таблицу для Customers
# id (уникальный номер заказчика)
# name (имя)
# city (город)
# rating (рейтинг)

# вставить 3-х разных заказчиков
