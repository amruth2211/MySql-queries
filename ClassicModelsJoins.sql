use classicmodels;

-- Write a query to display a list of customers who locate in the same city by joining the customers table to itself.

 SELECT c.city , c.customerName ,d.customerName FROM customers c INNER JOIN
 customers d ON c.city=d.city WHERE c.customerName <> d.customerName ORDER BY c.city;


-- Write a query to get:
-- The productCode and productName from the products table.
-- The textDescription of product lines from the productlines table.
 SELECT c.productCode , c.productName ,d.textDescription FROM products c INNER JOIN 
 productLines d ON c.productLine= d.productLine ;

-- Write a query that returns order number, order status, and total sales from the orders and orderdetails tables as follows:
> SELECT c.orderNumber ,c.status ,SUM((d.quantityOrdered*d.priceEach)) AS total FROM orders c, orderDetails d
    -> WHERE c.orderNumber=d.orderNumber GROUP BY c.orderNumber;
    
-- 4) Write a query to fetch the complete details of orders from the orders, 
-- orderDetails, and products table, and sort them by orderNumber and orderLineNumber as follows:
     SELECT o1.orderNumber, o1.orderDate, o2.orderLineNumber, p.productName,
      o2.quantityOrdered, o2.priceEach
      FROM orders o1, orderdetails o2, products p
      WHERE o1.orderNumber = o2.orderNumber AND
      o2.productCode = p.productCode
      ORDER BY o1.orderNumber, o2.orderLineNumber
      LIMIT 13;

-- Write a query to perform INNER JOIN of four tables:
 select orderNumber,productName,msrp,priceEach from products inner join orderdetails using(productCode) where productCode="S10_1678" and msrp>priceEach;

-- 6)Write a query to perform INNER JOIN of four tables:
select orderNumber,orderDate,customerName,orderLineNumber,
productName,quantityOrdered,priceEach from customers inner join orders using(customerNumber) inner join orderdetails using(orderNumber) inner join products using(productCode) order by orderNumber,orderLineNumber ;

--  7).Each customer can have zero or more orders while each order must belong to one customer. 
-- Write a query to find all the customers and their orders as follows:
 select c.customerNumber,c.customerName,
o.orderNumber,o.status
from customers c left join orders o 
using(customerNumber); 

-- Write a query that uses the LEFT JOIN to find customers who have no order:
Select c.customerNumber,c.customerName,o.orderNumber,o.status
 from customers c LEFT JOIN orders o  ON c.customerNumber = o.customerNumber AND o.orderNumber IS NULL;