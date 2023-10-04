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
 

/* -------------------------Удалить перед гитхаб-----------------------------*/
-- select sum(amt), odate from orders, salespeople where  id_salesPeople = salespeople.id and sname= "Колованов";

-- select sum(amt), odate from orders 
-- where  id_salesPeople = (select id FROM salespeople where sname= "Колованов");



-- Показать города и фамилии продавцов,
--  которые провели сделки в 2016 году.

-- select city, sname from salespeople where id IN (select id_salesPeople from orders where year(odate) = 2016);


--  --------------------------------   ---
-- CREATE INDEX odate ON orders(odate);
-- select * from orders where odate = '2016-03-07';


--  --------------------------------   ---
-- EXPLAIN SELECT * FROM orders WHERE odate ='2016-03-07';
-- EXPLAIN SELECT odate FROM orders;
-- EXPLAIN SELECT amt FROM orders;


-- ------------Составной индекс--------------------- ----
CREATE TABLE IF NOT exists users(
id INT(11)  NOT NULL PRIMARY KEY,
uname VARCHAR(45) NOT NULL,
age INT(3) not null,
gender VARCHAR(15) NOT NULL);

-- INSERT INTO users (id, uname, age, gender) VALUES
-- (1, "Колованов", 10, 'male'),
-- (2, "Иванов", 33, 'male'),
-- (3, "Иванова", 20, 'female'),
-- (4, "Канов", 33, 'male'),
-- (5, "Кановa", 23, 'female');


-- create index age_gender ON users(age, gender);
-- select * from users;
-- select age, count(age), gender from users group by age;
-- select gender, count(age) from users group by gender;




--   ---------------Представления----------------------- --
-- Показать id, имя покупателя и имя продавца 
-- select customers.id, cname, sname from customers join salespeople on salespeople.id = customers.id_salespeople;

-- create view customers_salespeople
-- as select customers.id, cname, sname 
-- from customers 
-- join salespeople on salespeople.id = customers.id_salespeople;

select * from customers_salespeople;



-- Создайте представление Cust_Rating_Max, которое бы показывало всех покупателей
-- и их город, которые имеют самые высокие рейтинги.
-- create view Cust_Rating_Max as select cname, city, max(rating) as max_rating from customers 
-- group by city;


-- select * from Cust_Rating_Max;
-- select count(max_rating) from Cust_Rating_Max;

-- Создайте представление Orders_All, 
-- которое бы показывало данные о заказах: стоимость(amt), дату, фамилию покупателя и продавца.
-- Отсортировать по сумме заказа по убыванию.
-- create view Orders_All as select amt, odate, cname, sname from orders  join customers on customers.id = orders.id_customer
-- join salespeople on salespeople.id = orders.id_salesPeople ORDER by amt;

-- показать  фамилию покупателя и продавца и заказы amt> 300 and amt< 700
-- select * from Orders_All where amt> 300 and amt< 700;

-- показать  фамилию покупателя, у которого 2 заказа и более,  общая стоимость 
-- select count(amt) as count_amt, sum(amt), cname from Orders_All group by cname having count_amt>=2;


