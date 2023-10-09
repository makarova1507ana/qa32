CREATE DATABASE IF NOT exists _test;
USE _TEST;




-- CREATE TABLE IF NOT exists salespeople(
--   id INT(11) NOT NULL PRIMARY KEY,
--   sname VARCHAR(45) NOT NULL,
--   city VARCHAR(45) NOT NULL,
--   comm FLOAT NOT NULL
-- ); 



-- CREATE TABLE IF NOT exists customers(
--   id INT(11) NOT NULL PRIMARY KEY,
--   cname VARCHAR(45) NOT NULL,
--   city VARCHAR(45) NOT NULL,
--   rating FLOAT NOT NULL,
--   id_salesPeople INT(11) NOT NULL,
--   FOREIGN KEY (id_salesPeople) REFERENCES salespeople(id)
-- );


-- CREATE TABLE IF NOT exists orders(
--   id INT(11) NOT NULL PRIMARY KEY,
--   amt DOUBLE NOT NULL,
--   odate date NOT NULL,
--   id_customer INT(11) NOT NULL,
--   id_salesPeople INT(11) NOT NULL,
--   FOREIGN KEY (id_customer) REFERENCES customers(id),
--   FOREIGN KEY (id_salesPeople) REFERENCES salespeople(id)
-- );

/*
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
(10, "Лосев", "Одинцово", 93, 8);


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
*/
-- select * from customers;
 
-- Создание процедур в SQL
-- процедура - функции 

-- напишем процедуру, которая будет показывать нам список покупателей 
-- из города, который мы передадим в качестве аргумента.
 /* DELIMITER //
CREATE PROCEDURE  get_customers (city_arg VARCHAR(45))
BEGIN
    SELECT cname, city
    FROM customers
    WHERE city = city_arg;
END //
DELIMITER ; */


CALL get_customers('Тверь');

-- Создать хранимую процедуру, которая выведет продавцов, 
-- оформивших заказы, по диапазонам. Если аргумент имеет значение «Маленькая суммы», 
-- то диапазон продаж от 0 до 1000, «Средние суммы» — от 1000 до 1500, 
-- «Большие суммы» — свыше 1500.
/* DELIMITER //
CREATE PROCEDURE get_salespeople(str VARCHAR(45))
BEGIN
    CASE str -- if str == "Маленькие суммы" 
    WHEN "Маленькие суммы"
    THEN # то
        SELECT sname as "Имя продавца", SUM(amt) as "Суммарные продажи"
        FROM salespeople
        INNER JOIN orders on salespeople.id = orders.id_salespeople
        group by sname
        HAVING SUM(amt) < 1000;
    WHEN "Средние суммы"
    THEN
        SELECT sname as "Имя продавца", SUM(amt) as "Суммарные продажи"
        FROM salespeople
        INNER JOIN orders on salespeople.id = orders.id_salespeople
        group by sname
        HAVING SUM(amt) >= 1000 and SUM(amt) < 1500;
    WHEN "Большие суммы"
    THEN
        SELECT sname as "Имя продавца", SUM(amt) as "Суммарные продажи"
        FROM salespeople
        INNER JOIN orders on salespeople.id = orders.id_salespeople
        group by sname
        HAVING SUM(amt) >= 1500;
    END CASE;
END //
DELIMITER ; */

-- call get_salespeople("Маленькие суммы");


-- 1. Создать хранимую процедуру, которая определяет лучшего
-- продавца по суммарному значению продаж за период дат,
-- полученных в аргументах.

/*
best_salespeople (d1 DATE, d2 DATE) 
d1 - start date
d2 - end date
*//*
DELIMITER //
CREATE PROCEDURE best_salespeople (d1 DATE, d2 DATE) 
BEGIN
    SELECT sname, SUM(amt) AS "Суммарные продажи"
    FROM salespeople
    INNER JOIN orders ON salespeople.id = orders.id_salespeople
    and odate BETWEEN d1 and d2
    GROUP BY sname
    ORDER BY SUM(amt) DESC
    LIMIT 1;
END // 
DELIMITER ; */

CALL best_salespeople ('2010-01-01', '2019-01-01');
