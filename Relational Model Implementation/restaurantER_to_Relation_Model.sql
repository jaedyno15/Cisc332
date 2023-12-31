-- Restaurant SQL Assignment Script

drop database if exists restaurantDB;
CREATE database restaurantDB;

CREATE TABLE restaurant(
    street VARCHAR(50),
    city VARCHAR(50),
    pc CHAR(6), -- based on Ontario Postal Code
    name VARCHAR(50) NOT NULL,
    url VARCHAR(50) NOT NULL,
    PRIMARY KEY(name) 
);

CREATE TABLE customer(
    street VARCHAR(50),
    city VARCHAR(50),
    pc char(6),
    phoneNum INTEGER,
    email VARCHAR(50) NOT NULL,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    credit DECIMAL(4,2),
    PRIMARY KEY(email)
);

CREATE TABLE employee(
    id CHAR(8) NOT NULL,
    email VARCHAR(50),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    restaurant VARCHAR(50) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(restaurant) REFERENCES restaurant(name)
);

CREATE TABLE deliverer( 
    id CHAR(10) NOT NULL,
    email VARCHAR(50),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    PRIMARY KEY(id),
    restaurant VARCHAR(50) NOT NULL,
    FOREIGN KEY(id) REFERENCES employee(id)
);

CREATE TABLE management(
    id CHAR(10) NOT NULL,
    email VARCHAR(50),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    PRIMARY KEY(id),
    restaurant VARCHAR(50) NOT NULL,
    FOREIGN KEY(id) REFERENCES employee(id)
);

CREATE TABLE server(
    id CHAR(10) NOT NULL,
    email VARCHAR(50),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    PRIMARY KEY(id),
    restaurant VARCHAR(50) NOT NULL,
    FOREIGN KEY(id) REFERENCES employee(id)
);

CREATE TABLE chef(
    id CHAR(10) NOT NULL,
    email VARCHAR(50),
    firstName VARCHAR(50),
    lastName VARCHAR(50), 
    PRIMARY KEY(id),
    restaurant VARCHAR(50) NOT NULL,
    FOREIGN KEY(id) REFERENCES employee(id)
);

CREATE TABLE certifications(
    certificate VARCHAR(50) NOT NULL,
    employid CHAR(10) NOT NULL,
    PRIMARY KEY (employid, certificate),
    FOREIGN KEY(employid) REFERENCES chef(id) on delete cascade
);

CREATE TABLE schedule(
    id CHAR(10),
    date DATE NOT NULL,
    startTime time,
    endTime time,
    PRIMARY KEY(date, id),
    FOREIGN KEY(id) REFERENCES employee(id) on delete cascade
);

CREATE TABLE foodItem(
    name varchar(50) NOT NULL,
    price DECIMAL(4,2) NOT NULL,
    restaurant VARCHAR(50) NOT NULL,
    PRIMARY KEY(name, restaurant),
    FOREIGN KEY(restaurant) REFERENCES restaurant(name) on delete cascade
);

CREATE TABLE orderInfo(
    tip DECIMAL(5,2),
    placeTime TIME,
    deliverTime TIME, 
    totalPrice DECIMAL(5,2),
    delivererID CHAR(10),
    orderDate DATE,
    orderID INTEGER NOT NULL,
    PRIMARY KEY(orderID),
    FOREIGN KEY(delivererID) REFERENCES deliverer(id) on delete cascade
);

CREATE TABLE orderItems(
    item VARCHAR(50) NOT NULL,
    orderid INTEGER NOT NULL,
    PRIMARY KEY(item, orderid),
    FOREIGN KEY (orderid) REFERENCES orderInfo(orderID) on delete cascade
);

CREATE TABLE customOrder(
    customerEmail VARCHAR(50) NOT NULL,
    orderid INTEGER NOT NULL,
    restaurant VARCHAR(50) NOT NULL, -- may not need?
    PRIMARY KEY(customerEmail, orderid, restaurant),
    FOREIGN KEY(customerEmail) REFERENCES customer(email) on delete cascade,
    FOREIGN KEY(orderid) REFERENCES orderInfo(orderID) on delete cascade,
    FOREIGN KEY(restaurant) REFERENCES restaurant(name) on delete cascade
);

CREATE TABLE transactions(
    date date NOT NULL,
    cost DECIMAL(5,2) NOT NULL,
    customer VARCHAR(50) NOT NULL,
    PRIMARY KEY(date, cost), 
    FOREIGN KEY(customer) REFERENCES customer(email)
);

-- Insert into al of the entities (6-8 each)

-- Only 4 restaurants since that was the number indicated in the initial instructions
INSERT into restaurant values
('101 Union Street','Kingston', 'L8W 4A6','Pizza pizza', 'www.pizzapizza.com'),
('337 Princess Street', 'Kingston', 'L9I 8U8', 'Pizza Nova', 'www.pizzanova.com'),
('29 Alfred Street', 'Kingston', 'K9K 7H4', 'Dominos', 'www.dominospizza.com'),
('88 Bath Street', 'Kingston', 'L7W 2K2', 'Pizza Hut', 'www.pizzahut.com');


INSERT into customer values
('2-89 Albert Street', 'Kingston', 'K9K 7U5', '2769907659', 'chuckM@gmail.com', 'Chuck', 'Molson', 20),
('37 Brock Street', 'Kingston', 'K2L 9W8', '9017793736', 'peterT@gmail.com', 'Peter', 'Taylor', 17),
('22 Johnson Street', 'Kingston', 'R6T 7R3', '6058294248', 'robinD@gmail.com', 'Robin', 'Dawes', 32),
('68 King Street', 'Kingston', 'K7L 5K5', '2764054461', 'alanA@hotmail.com', 'Alan', 'Ableson', 9),
('2-89 Division Street', 'Kingston', 'A9A 8V3', '2041740187', 'burtonM@gmail.com', 'Burton', 'Ma', 8),
('56 Fourth Ave', 'Kingston', 'M2K 3M7', '4160249624', 'kaiS@gmail.com', 'Kai', 'Salomaa', 2);

INSERT into employee values
('20267189','20hmrm@queensu.ca', 'Hannah','McDermid', 'Pizza pizza'),
('20298765','19pjm@queensu.ca', 'Paul','Mooney', 'Dominos'),
('20223876', '21kac@queensu.ca', 'Kyle', 'Carpenter', 'Pizza Hut'),
('20234598', '20emj@queensu.ca', 'Eliza', 'James', 'Pizza Nova'),
('20278964', '19jrr@queensu.ca', 'Jeffery', 'Randolph', 'Pizza pizza'),
('20276539', '21lpw@queensu.ca', 'Lisa', 'Waterston', 'Pizza Nova'),
('20247182', '20mss@queensu.ca', 'Marcus', 'Smith', 'Dominos'),
('20289763', '20hlg@queensu.ca', 'Harold', 'Grey', 'Pizza Hut'),
('20212447', '20ls@queensu.ca', 'Lily', 'Sofia', 'Pizza pizza'),
('20208799', '20tpa@queensu.ca', 'Tara', 'Adams', 'Pizza Hut'),
('20269326', '20cle@queensu.ca', 'Cassandra', 'Elise', 'Pizza Nova'),
('20299812', '20mry@queensu.ca', 'Minako','Yorick', 'Dominos');

INSERT into chef values
('20208799', '20tpa@queensu.ca', 'Tara', 'Adams', 'Pizza Hut'),
('20269326', '20cle@queensu.ca', 'Cassandra', 'Elise', 'Pizza Nova'),
('20299812', '20mry@queensu.ca', 'Minako','Yorick', 'Dominos');

INSERT into server values
('20267189','20hmrm@queensu.ca', 'Hannah','McDermid', 'Pizza pizza'),
('20298765','19pjm@queensu.ca', 'Paul','Mooney', 'Dominos'),
('20223876', '21kac@queensu.ca', 'Kyle', 'Carpenter', 'Pizza Hut');

INSERT into deliverer values
('20247182', '20mss@queensu.ca', 'Marcus', 'Smith', 'Dominos'),
('20289763', '20hlg@queensu.ca', 'Harold', 'Grey', 'Pizza Hut'),
('20212447', '20ls@queensu.ca', 'Lily', 'Sofia', 'Pizza pizza');

INSERT into management values
('20276539', '21lpw@queensu.ca', 'Lisa', 'Waterston', 'Pizza Nova'),
('20278964', '19jrr@queensu.ca', 'Jeffery', 'Randolph', 'Pizza pizza'),
('20234598', '20emj@queensu.ca', 'Eliza', 'James', 'Pizza Nova');

INSERT into foodItem values
("small cheese pizza", 7.50, 'Pizza pizza'),
("small pepperoni pizza", 7.45, 'Pizza pizza'),
("small pepperoni pizza", 7.45, 'Pizza Hut'),
("medium pepperoni pizza", 9.25, 'Pizza pizza'),
("medium hawaiian pizza", 9.72, 'Dominos'),
("dipping sauce", 1.10, 'Dominos'),
("dipping sauce", 1.00, 'Pizza pizza'),
("dipping sauce", 1.00, 'Pizza Nova'),
("dipping sauce", 1.15, 'Pizza Hut'),
("xl two topping pizza", 17.23, 'Pizza pizza'),
("12 piece cheese bread", 6.78, 'Pizza Hut'),
("12 piece cheese bread", 6.78, 'Pizza pizza'),
("6 piece wings", 5.58, "Dominos"),
("6 piece buffalo wings", 5.58, "Pizza Nova"),
("6 piece wings", 5.58, "Pizza Hut"),
("medium four topping pizza", 10.42, 'Pizza Hut'),
("medium four topping pizza", 9.20, 'Pizza Nova'),
("250ml soda", 1.67, 'Pizza pizza'),
("250ml soda", 1.67, 'Pizza Nova'),
("250ml soda", 1.67, 'Dominos'),
("250ml soda", 1.67, 'Pizza Hut');

INSERT into certifications values
( "Certified Foodservice Professional", "20208799"),
("Certified Master Chef", "20299812"),
("Certified Chef de Cuisine", "20269326"),
("Certified Personal Chef", "20208799");

INSERT into schedule values
('20212447', '2023-01-12', '10:00:00', '14:00:00'),
('20212447', '2023-01-13', '13:00:00', '21:00:00'),
('20212447', '2023-01-09', '12:00:00', '18:00:00'),
('20276539', '2023-01-12', '10:30:00', '14:30:00'),
('20276539', '2023-01-15', '13:00:00', '22:00:00'),
('20276539', '2023-01-14', '18:00:00', '24:00:00'),
('20208799', '2023-01-13', '14:30:00', '22:30:00'),
('20208799', '2023-01-11', '10:30:00', '14:30:00'),
('20208799', '2023-01-14', '12:00:00', '17:00:00'),
('20298765', '2023-01-14', '18:00:00', '23:30:00'),
('20298765', '2023-01-12', '13:00:00', '22:30:00'),
('20298765', '2023-01-09', '17:30:00', '23:00:00'),
('20267189', '2023-01-12', '10:30:00', '14:30:00'),
('20267189', '2023-01-14', '10:00:00', '14:00:00'),
('20267189', '2023-01-11', '10:30:00', '14:30:00'),
('20223876', '2023-01-13', '13:00:00', '21:00:00'),
('20223876', '2023-01-09', '17:30:00', '23:00:00'),
('20223876', '2023-01-14', '10:00:00', '14:00:00'),
('20234598', '2023-01-12', '10:00:00', '14:00:00'),
('20234598', '2023-01-11', '10:30:00', '14:30:00'),
('20234598', '2023-01-13', '13:00:00', '21:00:00'),
('20278964', '2023-01-16', '12:00:00', '18:00:00'),
('20278964', '2023-01-14', '10:00:00', '14:00:00'),
('20278964', '2023-01-12', '13:00:00', '22:30:00'),
('20247182', '2023-01-13', '13:00:00', '21:00:00'),
('20247182', '2023-01-12', '13:00:00', '22:30:00'),
('20247182', '2023-01-14', '18:00:00', '24:00:00'),
('20289763', '2023-01-09', '17:30:00', '23:00:00'),
('20289763', '2023-01-11', '10:30:00', '14:30:00'),
('20269326', '2023-01-11', '10:30:00', '14:30:00'),
('20269326', '2023-01-15', '13:00:00', '22:00:00'),
('20299812', '2023-01-09', '17:30:00', '23:00:00'),
('20299812', '2023-01-14', '10:00:00', '14:00:00');

INSERT into orderInfo values
(13.50, '16:21:23', '17:03:23', 76.00, '20212447', '2023-01-14', 1), 
(5.27, '12:04:54', '13:14:12', 14.99, '20289763', '2023-01-09', 2),
(3.20, '14:44:28', '15:09:16', 20.36, '20212447', '2023-01-03', 3),
(10.23, '17:22:35', '18:04:12', 22.63, '20247182', '2023-01-12', 4),
(8.12, '16:45:12', '17:30:45', 25.65, '20247182', '2023-01-09', 5),
(7.42, '12:08:42', '12:56:23', 15.21, '20289763', '2023-01-12', 6),
(11.12, '16:45:21', '17:23:25', 21.35, '20212447', '2023-01-14', 7),
(15.78, '18:03:28', '18:54:23', 37.87, '20247182', '2023-01-09', 8),
(4.48, '20:19:48', '21:04:42', 15.92, '20289763', '2023-01-15', 9),
(3.32, '13:34:56', '13:58:21', 12.14, '20289763', '2023-01-13', 10);

INSERT into orderItems values 
("small cheese pizza",1),
("250ml soda",1),
("medium four topping pizza",2),
("12 piece cheese bread",2),
("dipping sauce",2),
("xl two topping pizza", 3),
("6 piece wings", 4),
("medium hawaiian pizza", 4),
("250ml soda", 4),
("dipping sauce", 4),
("medium pepperoni pizza", 5),
("12 piece cheese bread", 5),
("small cheese pizza", 6),
("250ml soda", 6),
("6 piece buffalo wings", 7), 
("medium four topping pizza", 7),
("dipping sauce", 7),
("6 piece wings", 8), 
("medium hawaiian pizza", 8),
("250ml soda", 8),
("dipping sauce", 8),
("12 piece cheese bread", 9),
("small pepperoni pizza", 9),
("xl two topping pizza", 10);

INSERT into customOrder values
('kaiS@gmail.com', 1, 'Pizza pizza'),
('chuckM@gmail.com', 2, 'Pizza Hut'),
('peterT@gmail.com', 3, 'Pizza pizza'),
('alanA@hotmail.com', 4, 'Dominos'),
('robinD@gmail.com', 5, 'Pizza Hut'),
('burtonM@gmail.com', 6, 'Pizza Nova'),
('peterT@gmail.com', 7, 'Pizza pizza'),
('robinD@gmail.com', 8, 'Pizza Hut'),
('chuckM@gmail.com', 9, 'Dominos'),
('alanA@hotmail.com', 10, 'Pizza Nova');

INSERT into transactions values
('2023-01-17', 76.00, 'chuckM@gmail.com'),
('2023-01-03', 20.36, 'peterT@gmail.com'),
('2023-12-27', 46.52, 'alanA@hotmail.com'),
('2023-11-30', 15.21, 'chuckM@gmail.com'),
('2023-08-12', 25.56, 'chuckM@gmail.com'),
('2023-06-09', 14.99, 'kaiS@gmail.com');