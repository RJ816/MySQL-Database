CREATE DATABASE JAUNTY_COFFEE_CO;
CREATE TABLE IF NOT EXISTS COFFEE_SHOP (
  shop_id INT,
  shop_name VARCHAR(50),
  city VARCHAR(50),
  state CHAR(2),
  PRIMARY KEY (shop_id)
);
CREATE TABLE IF NOT EXISTS EMPLOYEE (
  employee_id INT,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  hire_date DATE,
  job_title VARCHAR(30),
  shop_id INT,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (shop_id) 
  REFERENCES COFFEE_SHOP (shop_id)
);
CREATE TABLE IF NOT EXISTS SUPPLIER (
  supplier_id INT,
  company_name VARCHAR(50),
  country VARCHAR(30),
  sales_contact_name VARCHAR(60),
  email VARCHAR(50) NOT NULL,
  PRIMARY KEY (supplier_id)
);
CREATE TABLE IF NOT EXISTS COFFEE (
  coffee_id INT,
  shop_id INT,
  supplier_id INT,
  coffee_name VARCHAR(30),
  price_per_pound NUMERIC(5,2),
  PRIMARY KEY (coffee_id),
  FOREIGN KEY (shop_id)
  REFERENCES COFFEE_SHOP(shop_id),
  FOREIGN KEY (supplier_id)
  REFERENCES SUPPLIER(supplier_id)
);
INSERT INTO COFFEE_SHOP
VALUES 
(1, 'Jaunt1', 'Dallas', 'TX'),
(2, 'Jaunt2', 'Houston', 'TX'),
(3, 'Jaunt3', 'Austin', 'TX');
INSERT INTO EMPLOYEE
VALUES 
(1, 'John', 'Smith', '2022-01-01', 'clerk', 1),
(2, 'Mary', 'Jane', '2022-02-01', 'barista', 2),
(3, 'Jacob', 'Johnston', '2022-03-01', 'manager', 3);
INSERT INTO SUPPLIER
VALUES 
(1, 'Sup1', 'USA', 'Venessa Cruz', 'vcruz1@gmail.com'),
(2, 'Sup2', 'Canada', 'Maurice Leal', 'mleal2@gmail.com'),
(3, 'Sup3', 'China', 'Mike Zhao', 'mzhao3@gmail.com');
INSERT INTO COFFEE
VALUES 
(1, 1, 1, 'cold', 111.11),
(2, 2, 2, 'warm', 222.22),
(3, 3, 3, 'hot', 333.33);
CREATE VIEW EMPLOYEE_FULL_NAME AS
SELECT *, CONCAT (first_name, ' ', last_name) employee_full_name
FROM EMPLOYEE;
CREATE INDEX coffee_index ON COFFEE(coffee_name);
SELECT employee_full_name
FROM EMPLOYEE_FULL_NAME
WHERE employee_full_name='John Smith';
SELECT COFFEE.*, COFFEE_SHOP.*, SUPPLIER.*
FROM COFFEE
INNER JOIN COFFEE_SHOP 
ON COFFEE.shop_id = COFFEE_SHOP.shop_id
INNER JOIN SUPPLIER
ON COFFEE.supplier_id = SUPPLIER.supplier_id
ORDER BY COFFEE.shop_id;
