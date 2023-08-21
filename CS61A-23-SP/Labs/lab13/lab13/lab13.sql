.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet
    FROM students
      WHERE color = "blue" AND pet = "dog";

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song
    FROM students
      WHERE color = "blue" AND pet = "dog";


CREATE TABLE smallest_int_having AS
  SELECT time, smallest
    FROM students
      GROUP BY smallest
        HAVING COUNT(*) = 1;


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color 
    FROM students AS a, students AS b
      WHERE a.time < b.time AND a.pet = b.pet AND a.song = b.song;

CREATE TABLE sevens AS
  SELECT a.seven 
    FROM students AS a, numbers AS b 
      WHERE a.number = 7 AND b.'7' = 'True' AND a.time = b.time;


CREATE TABLE average_prices AS
  SELECT category AS category, AVG(MSRP) AS average_price
    FROM products
      GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, price
    FROM inventory
      GROUP BY item
        HAVING MIN(price);


CREATE TABLE shopping_list AS
  SELECT name, store FROM products AS a, lowest_prices AS b
    WHERE a.name = b.item
    GROUP BY category HAVING MIN(MSRP/rating);


CREATE TABLE total_bandwidth AS
    SELECT SUM(a.mbs)
      FROM stores AS a, shopping_list AS b
        WHERE a.store = b.store;


