
CREATE TABLE IF NOT EXISTS clients  (
	id INT AUTO_INCREMENT  PRIMARY KEY,
	nameC VARCHAR(50) NOT NULL,
  	city VARCHAR(50) NOT NULL
    );

INSERT INTO clients (nameC, city) VALUES 
("Ivanov Inav",  "Moscow"),
("Petrov petr",  "Volgograd"),
("Olegov Oleg",  "Samara"),
("Smirnov Anton",  "Samara"),
("Smirnov Sergey",  "Samara");


CREATE TABLE IF NOT EXISTS  phones(
	number_ph BIGINT PRIMARY KEY,
  	id_client INT,
	FOREIGN KEY (id_client) REFERENCES clients(id)
);




INSERT INTO phones VALUES
(9991110000, 1),
(1001110000, 1),
(9992220000, 2),
(8881110000, 3),
(7771110000, 3),
(6661110000, 3),
(5551110000, NULL),
(3331110000, NULL),
(4441110000, 4);

# SELECT * FROM clients;

# SELECT * FROM phones, clients WHERE id_client = clients.id;


# # Показать клиента с id  3 и его номера телефона
# SELECT number_ph, nameC FROM phones, clients WHERE clients.id = 3 AND id_client = clients.id;

# # Показать клиента у которого номер телефона 6661110000
# SELECT * FROM phones, clients WHERE id_client = id AND number_ph = 6661110000 ;

# # Показать номера клиентов из Samara


# # Показать незянтые номера телефона
# SELECT * FROM phones WHERE id_client IS NULL;

# Перезаписать номер телефона на имя клиента

UPDATE phones SET id_client = 5 WHERE number_ph = 5551110000 ;
SELECT * FROM phones;


























