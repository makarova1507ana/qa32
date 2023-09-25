CREATE TABLE salespeople(
  id INT(11) NOT NULL PRIMARY KEY,
  sname VARCHAR(45) NOT NULL,
  city VARCHAR(45) NOT NULL,
  comm FLOAT NOT NULL -- скидка
); 



CREATE TABLE customers(
  id INT(11) NOT NULL PRIMARY KEY,
  cname VARCHAR(45) NOT NULL,
  city VARCHAR(45),
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
(11, "Лосевa", NULL, 94, 5);


INSERT INTO orders (id, amt, odate, id_customer, id_salesPeople) VALUES
(1001, 128, '2016-01-01', 9, 4),
(1002, 1800, '2016-04-10', 10, 7),
(1003, 348, '2017-04-08', 2, 1),
(1004, 1010, '2016-06-07', 3, 3),
(1005, 499, '2017-12-04', 5, 4),
(1006, 320, '2016-03-03', 5, 4),
(1007, 80, '2017-09-02', 7, 1),
(1008, 780, '2016-03-07', 1, 3),
(1009, 560, '2017-10-07', 3, 7),
(1010, 900, '2016-01-08', 6, 8),
(1011, 100, '2016-01-01', 8, 1),
(1012, 100, '2016-02-01', 1, 4);

# select * from customers;

-- Агрегатные функции


#------------------------------------ sum----------------------------------#


-- Получить сумму всех заказов из таблицы Orders
# SELECT sum(amt) as "сумма заказов" FROM orders

# -- Получить сумму всех заказов из таблицы Orders, которые были совершены в 2016 году.
# SELECT sum(amt) as "сумма заказов" FROM orders Where odate LIKE "2016%"



# #-----------------------------ЕЩЕ один способ------------------------------------#
# -- Получить сумму всех заказов из таблицы Orders, которые были совершены в 2016 году.
# SELECT sum(amt) as "сумма заказов" FROM orders Where odate BETWEEN '2016-01-01' and '2016-12-31' ;


# #-----------------------------ЕЩЕ один способ------------------------------------#
# select sum(amt) as "сумма заказов" from orders
# where YEAR(odate)=("2016")


# #------------------------------------ avg ----------------------------------#
# # Вывести среднюю стоимость заказа из таблицы Orders.
# select avg(amt) FROM orders


# #------------------------------------ max() |  min() ----------------------------------#
# #Вывести максимальное и минимальное значения цены заказа, для тех заказов в которых цена менее 1000.
# select max(amt) as "max", min(amt) as "min" FROM orders WHERE amt < 1000 ;


# # --------------------------------------- COUNT() ------------------------------------------#
# -- Подсчитать количество сделанных заказов 
# select count(*) FROM orders



# -- Подсчитать количество сделанных заказов и количество продавцов ( DISTINCT - уникальные значения) в таблице Orders.
# select count(*) as "количество сделанных заказов", count(DISTINCT id_salesPeople) as "количество продавцов" FROM orders ;


# # --------------------------------------- ОПЕРАТОР Group by ------------------------------------------#
# -- Вывести сумму всех заказов для каждого продавца по отдельности.
# select id_salesPeople, sum(amt) as "сумму всех заказов для каждого продавца" FROM orders group by  id_salesPeople;


# # # --------------------------------------- ОПЕРАТОР HAVING - критерий отбора ------------------------------------------#
-- having требует наличие группы (GROUP BY)
-- having требует наличие агрегатной функции 


# # -- Вывести сумму всех заказов для каждого покупателя по отдельности.
# SELECT id_customer, SUM(amt) AS 'Сумма всех заказов' 
# FROM orders 
# GROUP BY id_customer



# --  посчитает сумма стоимостей (amt)  заказов этой группы, только в том случае, если --    максимальная стоимость заказа меньше 1000. 
# SELECT id_customer, SUM(amt)  AS 'Сумма всех заказов' 
# FROM orders 
# GROUP BY id_customer
# HAVING MAX(amt) < 1000; # 
# #  берем конкретного покупателя -> смотрим на все его заказы


# #  GROUP BY id_customer
# #  HAVING MAX(amt)  -  вот эта часть находит максимальный заказ у конкртеного покупателя
# # HAVING MAX(amt) < 1000; --  максимальная стоимость заказа меньше 1000. 

# 


# # ОТОБРАТЬ покупателей сумма стоимостей заказов, которых более 1000
# SELECT id_customer, SUM(amt) as summ
# FROM orders 
# GROUP BY id_customer
# HAVING summ > 1000; # добавляет подгруппу 






# # НАйти средний рейтинг покупателей в каждом городе, показать только те значения где средний рейтинг больше 90

# select city, avg(rating)
# FROM customers 
# GROUP BY city;


# select city, avg(rating) as avg_rat
# FROM customers 
# GROUP BY city
# HAVING avg_rat > 90;


# # посчитать кол-во заказов у покупателей, сумма(стоимость заказа + стомость заказа) которых больше 700
# SELECT id_customer,count(*), sum(amt) from orders group by id_customer;
# SELECT id_customer,count(*), sum(amt) from orders group by id_customer having sum(amt)>700;



# посчитать среднюю стоимость заказов у продавцов, средняя стоимость которых больше 500,  но меньше 1000
# SELECt avg(amt) from orders group by id_salesPeople having avg(amt) > 500 and avg(amt)<1000;



# НАйти кол-во покупателей в каждом городе,  где средний рейтинг() больше 90
# SELECT count(*), city from customers WHERE city is not null group by city;
# SELECT count(*), city, avg(rating) from customers WHERE city is not null group by city HAVING avg(rating)>90;


# НАйти кол-во продавцов в каждом городе,  где средняя скидка  больше 15



# ---------------------- ОПЕРАТОР ORDER by    -------------------------------#
# ORDER by - сортирует  необязательно наличие  агрегатных функции 
# DESC - от большего к меньшему 
# -- Вывести сумму всех заказов для каждого продавца по отдельности.
select id_salesPeople, sum(amt) as "сумму всех заказов для каждого продавца" FROM orders group by  id_salesPeople ORDER by sum(amt) DESC;





# --------------------------------------- Практика ------------------------------------- #




# -- 1. Напишите запрос, который сосчитал бы все суммы ((стоимость заказа + стомость заказа)) заказов, выполненных 1 января 2016 года.
# SELECT sum(amt) FROM orders WHERE odate = '2016-01-01';



-- 2. Напишите запрос, который сосчитал бы число различных(уникальных), отличных от NULL значений поля city в таблице покупателей.
# SELECT distinct city FROM customers;
# SELECT COUNT(distinct city) FROM customers WHERE city is not NULL ;




# -- 3. Напишите запрос, который выбрал бы наименьшую  стоимость одного заказов у одного для каждого покупателя.

# select id_customer, min(amt)
# from orders
# GROUP BY id_customer


# -- 4. Напишите запрос, который бы кол-во покупателей чьи имена начинаются с буквы К.
# SELECT cname FROM customers WHERE cname like "К%";
# SELECT count(*) FROM customers WHERE cname like "К%";




# -- 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе (в таблице покупателей).
# SELECT city, max(rating) FROM customers WHERE city is not null Group by city ;
