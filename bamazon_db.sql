DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE inventory (
	item_id VARCHAR(4) NOT NULL, 
    product_name VARCHAR (50) NOT NULL,
	department_name VARCHAR (100) NOT NULL,
    price INTEGER(4) NOT NULL,
    stock_qty INTEGER (3) NOT NULL,
    
    PRIMARY KEY (item_id)
);

INSERT INTO inventory (item_id, product_name, department_name, price, stock_qty)
VALUES (1010, '2012 Macbook Pro', 'Electronics', 750, 2);

INSERT INTO inventory (item_id, product_name, department_name, price, stock_qty)
VALUES (1020, '2014 Womens Gnu 168 B-Pro Snowboard', 'Sporting Equipment', 500, 3);

INSERT INTO inventory (item_id, product_name, department_name, price, stock_qty)
VALUES (1030, 'Original Nintendo Entertainment System', 'Electronics', 250, 5);

INSERT INTO inventory (item_id, product_name, department_name, price, stock_qty)
VALUES (1040, '1996 JDM-Style Acura Integra GSR', 'Automotive', 5500, 1);

INSERT INTO inventory (item_id, product_name, department_name, price, stock_qty)
VALUES (1050, '10-Piece All-Clad Cooking Set', 'Household', 350, 2);

INSERT INTO inventory (item_id, product_name, department_name, price, stock_qty)
VALUES (1060, 'Kitchen Aid Pro Stand Mixer, Willow Blue', 'Household', 150, 3);

INSERT INTO inventory (item_id, product_name, department_name, price, stock_qty)
VALUES (1070, 'Fendi Peekaboo Handbag, Grey/Yellow/Brick', 'Handbags', 1100, 1);

INSERT INTO inventory (item_id, product_name, department_name, price, stock_qty)
VALUES (1080, 'Brunellow Cucenelli Clutch, White Leather', 'Handbags', 750, 2);

INSERT INTO inventory (item_id, product_name, department_name, price, stock_qty)
VALUES (1090, 'Atlanta Thrashers Jersey, Autographed by 2005 Team', 'Collectables', 100, 4);

INSERT INTO inventory (item_id, product_name, department_name, price, stock_qty)
VALUES (2000, 'Signed Marian Hossa Autographed Hockey Stick', 'Collectables', 75, 6);

SELECT * FROM bamazon_db.inventory;