
use classicmodels;

 SELECT c.city , c.customerName ,d.customerName FROM customers c INNER JOIN
 customers d ON c.city=d.city WHERE c.customerName <> d.customerName ORDER BY c.city;


 SELECT c.productCode , c.productName ,d.textDescription FROM products c INNER JOIN 
 productLines d ON c.productLine= d.productLine ;


> SELECT c.orderNumber ,c.status ,SUM((d.quantityOrdered*d.priceEach)) AS total FROM orders c, orderDetails d
    -> WHERE c.orderNumber=d.orderNumber GROUP BY c.orderNumber;
    
-- 4) 
     SELECT o1.orderNumber, o1.orderDate, o2.orderLineNumber, p.productName,
      o2.quantityOrdered, o2.priceEach
      FROM orders o1, orderdetails o2, products p
      WHERE o1.orderNumber = o2.orderNumber AND
      o2.productCode = p.productCode
      ORDER BY o1.orderNumber, o2.orderLineNumber
      LIMIT 13;


 select orderNumber,productName,msrp,priceEach from products inner join orderdetails using(productCode) where productCode="S10_1678" and msrp>priceEach;

-- 6)
select orderNumber,orderDate,customerName,orderLineNumber,
productName,quantityOrdered,priceEach from customers inner join orders using(customerNumber) inner join orderdetails using(orderNumber) inner join products using(productCode) order by orderNumber,orderLineNumber ;

--  7).
 c.customerNumber,c.customerName,
o.orderNumber,o.status
from customers c left join orders o 
using(customerNumber); 


Select c.customerNumber,c.customerName,o.orderNumber,o.status
 from customers c LEFT JOIN orders o  ON c.customerNumber = o.customerNumber AND o.orderNumber IS NULL;