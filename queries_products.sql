-- Comments in SQL Start with dash-dash --
-- Products--

-- create stool
1 .INSERT INTO products(name, price, can_be_returned) VALUES ('chair',44.00,false);
-- create chair
2. INSERT INTO products(name, price, can_be_returned) VALUES ('stool',25.99,true);
-- creat table
3.INSERT INTO products(name, price, can_be_returned) VALUES ('table',124.00,false);
-- displaying db
4.SELECT (*) FROM products
products_db-# ;
ERROR:  syntax error at or near "*"
LINE 1: SELECT (*) FROM products
                ^
products_db=# SELECT * FROM products
products_db-# ;
 id | name  | price | can_be_returned 
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | t
  3 | table |   124 | f
(3 rows)
-- Display all of the names of the products.
5. products_db=# SELECT name FROM products                                         ;
 name  
-------
 chair
 stool
 table
(3 rows)


-- Display all of the names and prices of the products.
6. name  | price 
-------+-------
 chair |    44
 stool | 25.99
 table |   124
(3 rows)

-- Add a new product - make up whatever you would like!
7.INSERT INTO products(name, price, can_be_returned) VALUES ('tie',5.00,false);


-- Display only the products that can_be_returned.
8. SELECT name FROM products WHERE can_be_returned =true;
 name  
-------
 stool
(1 row)

-- Display only the products that have a price less than 44.00.
9. SELECT name FROM products WHERE price < 44.99;;
 name  
-------
 chair
 stool
 tie
(3 rows)



-- Display only the products that have a price in between 22.50 and 99.99.
10. SELECT name FROM products WHERE price > 22.50 AND price < 99.00;
 name  
-------
 chair
 stool
(2 rows)

-- There’s a sale going on: Everything is $20 off! Update the database accordingly.
11. UPDATE products SET price = (price -  20.00) WHERE price > 20.00; UPDATE 3

-- Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria.
12. DELETE FROM products WHERE price < 20.00
-- And now the sale is over. For the remaining products, increase their price by $20.
13. UPDATE products SET price = (price + 20);
UPDATE 2


-- There is a new company policy: everything is returnable. Update the database accordingly.
14. UPDATE products SET can_be_returned = true;


