CREATE TABLE salespeople(
  id INT(11) NOT NULL PRIMARY KEY,
  sname VARCHAR(45) NOT NULL,
  city VARCHAR(45) NOT NULL,
  comm FLOAT NOT NULL
); 



CREATE TABLE customers(
  id INT(11) NOT NULL PRIMARY KEY,
  cname VARCHAR(45) NOT NULL,
  city VARCHAR(45) NOT NULL,
  rating FLOAT NOT NULL,
  id_salesPeople INT(11) NOT NULL,
  FOREIGN KEY (id_salesPeople) REFERENCES salespeople(id)
);


CREATE TABLE orders(
  id INT(11) NOT NULL PRIMARY KEY,
  amt DOUBLE NOT NULL,
  odate date NOT NULL,
  id_customer INT(11) NOT NULL,
  id_salesPeople INT(11) NOT NULL,
  FOREIGN KEY (id_customer) REFERENCES customers(id),
  FOREIGN KEY (id_salesPeople) REFERENCES salespeople(id)
);

INSERT INTO salespeople (id, sname, city, comm) VALUES
(1, "Колованов", "Москва", 10),
(2, "Петров", "Тверь", 25),
(3, "Плотников", "Москва", 22),
(4, "Кучеров", "Санкт-Петербург", 28),
(5, "Малкин", "Санкт-Петербург", 18),
(6, "Шипачев", "Челябинск", 30),
(7, "Мозякин", "Одинцово", 25),
(8, "Проворов", "Москва", 25);

INSERT INTO customers (id, cname, city, rating, id_salesPeople) VALUES
(1, "Деснов", "Москва", 90, 6),
(2, "Краснов", "Москва", 95, 7),
(3, "Кириллов", "Тверь", 96, 3),
(4, "Ермолаев", "Обнинск", 98, 3),
(5, "Колесников", "Серпухов", 98, 5),
(6, "Пушкин", "Челябинск", 90, 4),
(7, "Лермонтов", "Одинцово", 85, 1),
(8, "Белый", "Москва", 89, 3),
(9, "Чудинов", "Москва", 96, 2),
(10, "Лосев", "Одинцово", 93, 8),
(11, "Проворов", "Одинцово", 93,8);


INSERT INTO orders (id, amt, odate, id_customer, id_salesPeople) VALUES
(1001, 128, '2016-01-01', 9, 4),
(1002, 1800, '2016-04-10', 10, 7),
(1003, 348, '2017-04-08', 2, 1),
(1004, 500, '2016-06-07', 3, 3),
(1005, 499, '2017-12-04', 5, 4),
(1006, 320, '2016-03-03', 5, 4),
(1007, 80, '2017-09-02', 7, 1),
(1008, 780, '2016-03-07', 1, 3),
(1009, 560, '2017-10-07', 3, 7),
(1010, 900, '2016-01-08', 6, 8);








# # ---------------------------------- Оператор CROSS JOIN --------------------------------------- #
# # SELECT 
# # FROM таблица, к которой присоединяется
# # CROSS JOIN таблица, с которой соединяем 

# CREATE TABLE cats(
#   sname VARCHAR(45) NOT NULL
# ); 
# CREATE TABLE house_cats(
#   cname VARCHAR(45) NOT NULL
# );
# INSERT INTO cats VALUES ('murzik'), ('vasya'), ('barsik');
# INSERT INTO house_cats VALUES ('House1'), ('house2');
# select * from cats;
# select * from house_cats;


# select *
# from cats
# CROSS JOIN house_cats;

# select *
# from house_cats
# CROSS JOIN cats;


# ---------------------------------- Оператор INNER JOIN --------------------------------------- #

# SELECT 
# FROM таблица, к которой присоединяется
# INNER JOIN таблица, с которой соединяем ON  PK = FK and параметр поиска

# CREATE TABLE cats(
#   id INT AUTO_INCREMENT PRIMARY KEY,
#   sname VARCHAR(45) NOT NULL
# ); 

# CREATE TABLE house_cats(
#   cname VARCHAR(45) NOT NULL,
#   id_cat INT,
#    FOREIGN KEY (id_cat) REFERENCES cats(id)
# );

# INSERT INTO cats(sname) VALUES ('murzik'), ('vasya'), ('barsik');



# INSERT INTO house_cats VALUES ('House1',1), ('house2', 2), ('house3', NULL);

# select * from cats;
# select * from house_cats;

# # --- КОТЫ и их дома---#

# select *
# from cats
# INNER JOIN house_cats ON cats.id = house_cats.id_cat;


# # #-----------------тоже самое, но ... --------------------#
# # select *
# # from cats, house_cats
# # where cats.id = house_cats.id_cat;



# # -------------- Вывести сумму заказов и дату, которые проводил продавец с фамилией Колованов. ------- #

# SELECT * FROM orders INNER JOIN salespeople ON  orders.id_salespeople = salespeople.id  and  salespeople.sname ='Колованов' ;
# # SELECT * FROM salespeople INNER JOIN orders ON  orders.id_salespeople = salespeople.id  and  salespeople.sname ='Колованов' ;


# ---------------- Вывести среднюю сумму заказов для каждого продавца. -----------------#
# SELECT sname,avg(amt) FROM orders INNER JOIN salespeople ON  orders.id_salespeople = salespeople.id GROUP BY id_salespeople;




# # # ---------------------------------- Оператор OUTER JOIN --------------------------------------- #
# CREATE TABLE cats(
#   id INT AUTO_INCREMENT PRIMARY KEY,
#   sname VARCHAR(45) NOT NULL
# ); 

# CREATE TABLE house_cats(
#   cname VARCHAR(45) NOT NULL,
#   id_cat INT,
#    FOREIGN KEY (id_cat) REFERENCES cats(id)
# );

# INSERT INTO cats(sname) VALUES ('murzik'), ('vasya'), ('barsik');



# INSERT INTO house_cats VALUES ('House1',1), ('house2', 2), ('house3', NULL);

# select * from cats;
# select * from house_cats;


# # --------------------Показать дома, в которых есть коты и в которых нет котов---------------------#
# SELECT *
# FROM cats
# RIGHT OUTER JOIN house_cats on id = id_cat; # OUTER - можно опустить


# # --------------------Показать котов, у которых есть дом и у которых нет дома---------------------#
# SELECT *
# FROM cats
# LEFT OUTER JOIN house_cats on id = id_cat;



# # --------------------Показать котов, у которых есть дом и у которых нет дома, Показать дома, в которых есть коты и в которых нет котов ---------------------#
# SELECT *
# FROM cats
# RIGHT OUTER JOIN house_cats on id = id_cat # OUTER - можно опустить
# UNION 
# SELECT *
# FROM cats
# LEFT OUTER JOIN house_cats on id = id_cat;



# ---- Вывести среднюю сумму заказов для каждого продавца. ( в том числе и пустые значения по заказам) -------------------------------- # SELECT sname,avg(amt) FROM orders RIGHT JOIN salespeople ON  orders.id_salespeople = salespeople.id GROUP by salespeople.id;


# # --------------------Практика ---------------------#

# 1.Напишите запрос, который бы использовал оператор INNER JOIN для получения всех Заказов для покупателя с фамилией Краснов.
#SELECT * FROM customers INNER JOIN orders on orders.id_customer = customers.id and cname = 'Краснов';



# # 2.Напишите запрос, который бы вывел фамилии и города продавцов, комиссия которых составляет более 20%.
# SELECT sname, city, comm  FROM salespeople WHERE comm>20;

# # 2.1 Напишите запрос, который бы вывел фамилии и города продавцов и их заказы( которые обслуживают), комиссия которых составляет более 20%.
# SELECT sname,city,comm,amt, odate  FROM salespeople INNER JOIN orders ON orders.id_salespeople = salespeople.id and comm>20;

# # 2.2 напишите запрос покупателей и продавцов из одного города

# # # 2.3 напишите запрос,который показал бы  имена и города покупателей и продавцов одного и того заказа
# SELECT amt, odate,id_customer, cname, customers.city, orders.id_salespeople, sname, salespeople.city
# from orders  INNER JOIN salespeople ON orders.id_salespeople = salespeople.id
# INNER JOIN customers on orders.id_customer = customers.id;


# # 2.4 напишите запрос покупателей и продавцов c одинаковой фамилией
SELECT * from customers inner join salespeople on cname=sname;

# # 2.3 напишите запрос,который показал бы  имена и города покупателей и продавцов одного и того заказа


# 3.Напишите запрос, который бы вывел суммарную сумму заказов для городов в которых работают продавцы.




# 4.Повторите предыдущий запрос, но выведите все города, даже если в них не совершалась сделка.




# 5.Напишите запрос, который бы вывел максимальную сумму заказов для городов в которых проживают покупатели, даже если в этих городах не было произведено сделки.

