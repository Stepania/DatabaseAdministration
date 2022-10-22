/*question 1*/
select concat (firstName, ' ', lastName) as 'Employee full name ending in -on' from employees e where e.lastName like '%on';

/*question 2*/
select concat (firstName, ' ', lastName) as 'Employee full name' from employees e where (e.firstName like 'T%' and e.firstName like '%m');

/*question 3*/
select * from products;

select avg(buyPrice) as 'Average for buy products' from products;

/*question 4*/
select p.productCode, p.productName, count(od.quantityOrdered) as 'Total sales' from products p, orderDetails od 
where p.productCode = od.productCode
group by p.productCode, p.productName
order by p.productCode asc;

/*question 5*/
select productVendor, count(productCode) as 'Products supplied'   from products
group by productVendor
having count(productCode) >= 9;

/*question 6*/
select p.productLine, min(p.buyPrice) as 'The cheapest product price' from products p, productLines pl
where p.productLine = pl.productLine
group by p.productLine;

/*question 7*/
select c.customerNumber, c.customerName, max(pay.amount) as 'Biggest payment > 80k' from customers c, payments pay
where pay.customerNumber = c.customerNumber
group by c.customerNumber, c.customerName
having max(pay.amount) > 80000;