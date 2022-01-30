
SQL> SELECT COUNT(DISTINCT title)
            FROM books
            WHERE category = 'COOKING';

COUNT(DISTINCTTITLE)
--------------------
                   2


Answer to Question 2
====================

SQL> SELECT COUNT(retail)
    	FROM books
    	WHERE retail > 30;

COUNT(RETAIL)
-------------
            8

SQL>

Answer to Question 3
====================

SQL> SELECT MAX(pubdate)
        FROM books;

MAX(PUBDA
---------
11-NOV-06

Answer to Question 4
====================

SQL> SELECT SUM((retail-cost)*quantity) "TOTAL PROFIT"
       FROM orders JOIN orderitems USING(order#)
       JOIN books USING(isbn)
       WHERE customer# = 1017;

TOTAL PROFIT
------------
       59.78


Answer to Question 5
====================

SQL> SELECT MIN(retail)
    FROM books
    WHERE category = 'COMPUTER';

MIN(RETAIL)
-----------
         25



Answer to Question 6
====================

SQL> SELECT TO_CHAR(AVG(SUM((retail-cost)*quantity)), '999.99') "AVG PROFIT"
      FROM orders JOIN orderitems USING(order#)
      JOIN books USING(isbn)
      GROUP BY order#;

AVG PRO
-------
  33.77


Answer to Question 7
====================
SQL> SELECT lastname, customer#, COUNT(ORDER#)
    FROM customers JOIN orders USING(customer#)
    WHERE order# IS NOT NULL
    GROUP BY customer#, lastname;

LASTNAME    CUSTOMER# COUNT(ORDER#)
---------- ---------- -------------
MORALES          1001             2
GIRARD           1005             2
LEE              1014             1
PIERSON          1004             1
GIANA            1007             2
SMITH            1019             1
FALAH            1020             2
LUCAS            1010             2
SCHELL           1015             1
MONTIASA         1018             2
JONES            1008             1
SMITH            1003             2
MCGOVERN         1011             1
NELSON           1017             1

14 rows selected.



Answer to Question 8
====================
SQL> SELECT name, category, AVG(retail)
    FROM books JOIN publisher USING(pubid)
    WHERE category IN ('CHILDREN','COMPUTER')
    HAVING AVG(retail) > 50
    GROUP BY name, category;

NAME                    CATEGORY     AVG(RETAIL)
----------------------- ------------ -----------
PUBLISH OUR WAY         CHILDREN           59.95
PUBLISH OUR WAY         COMPUTER            54.5
AMERICAN PUBLISHING     COMPUTER            52.3

Answer to Question 9
====================

SQL> SELECT lastname, customer#, SUM(PAIDEACH*QUANTITY)
       FROM customers JOIN orders USING(customer#)
        JOIN orderitems USING(order#)
        WHERE state = 'FL' OR state = 'GA'
        HAVING SUM(PAIDEACH*QUANTITY) > 80
        GROUP BY lastname, customer#;

LASTNAME    CUSTOMER# SUM(PAIDEACH*QUANTITY)
---------- ---------- ----------------------
LUCAS            1010                 202.85
SMITH            1003                 139.95
MORALES          1001                 182.75

SQL>




Answer to Question 10
====================	

SQL> SELECT MAX(retail)
    FROM books JOIN bookauthor USING(isbn)
    JOIN author USING(authorid)
    WHERE lname = 'WHITE' AND fname = 'LISA';

MAX(RETAIL)
-----------
      39.95


			Advanced Challenge
			------------------


Answer to Question 1
====================

SQL> SELECT isbn, title, SUM(quantity) "COPIES SOLD"
    FROM orders JOIN orderitems USING(order#)
    JOIN books USING(isbn)
    WHERE (retail-cost) < cost*0.55
    GROUP BY title, retail, cost, isbn
    ORDER BY SUM(quantity) DESC;

ISBN       TITLE                          COPIES SOLD
---------- ------------------------------ -----------
0401140733 REVENGE OF MICKEY                        5
1915762492 HANDCRANKED COMPUTERS                    2
9959789321 E-BUSINESS THE EASY WAY                  2
