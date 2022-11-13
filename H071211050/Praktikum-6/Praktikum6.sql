USE classicmodels;

-- Nomor 1
-- SELECT customers.customerName as 'Nama Pelanggan', 
-- SUM(amount) as 'Total Belanja', customers.creditLimit as 'Batas Kredit', (SUM(amount)-creditLimit) as 'Selisih'
-- FROM customers
-- JOIN payments
-- USING (customerNumber)
-- GROUP BY customerName
-- HAVING SUM(amount) > customers.creditLimit 
-- ORDER BY (SUM(amount)-creditLimit) DESC 
-- LIMIT 5;

-- Nomor 2
-- SELECT CONCAT(c.customerName, " : ", c.contactFirstName, " ", c.contactLastName, "@", c.addressline1) AS  Pelanggan, 
-- SUM(od.quantityOrdered) AS `Jumlah Orderan`
-- FROM customers AS C
-- JOIN orders AS o
-- USING(customerNumber)
-- JOIN orderdetails AS od
-- USING(orderNumber)
-- GROUP BY c.customerName, c.contactFirstName, c.contactLastName, c.addressline1
-- ORDER BY `Jumlah Orderan` DESC
-- LIMIT 1;

-- Nomor 3
-- SELECT * FROM customers;
-- SELECT CONCAT((MONTHNAME(paymentDate)), " ",YEAR(paymentDate)) as 'hari pembayaran', COUNT(customers.customerName) as 'jumlah pelanggan', 
-- GROUP_CONCAT(customerName ORDER BY customerName ASC) as 'list pelanggan', SUM(payments.amount) as 'jumlah pembayaran'
-- FROM customers
-- JOIN payments 
-- USING (customerNumber)
-- WHERE MONTH(paymentdate) = 2
-- GROUP BY YEAR(paymentDate) ORDER BY SUM(payments.amount)DESC;

-- Nomor 4
-- SELECT UPPER(p.productName) as 'nama produk' , COUNT(o.customerNumber) as 'jumlah diorder', 
-- GROUP_CONCAT(orderDate) as 'waktu orderan', p.buyPrice as 'harga beli', od.priceEach as 'harga jual', 
-- CONCAT((SUM(od.quantityOrdered *od.priceEach)), "-", SUM(od.quantityOrdered * p.buyprice), "=", (SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyprice))
-- AS "pendapatan - modal = keuntungan"
-- FROM products p
-- JOIN orderdetails od
-- USING (productCode)
-- JOIN orders o
-- USING (orderNumber)
-- WHERE p.productName =  '2001 Ferrari Enzo'
-- GROUP BY priceEach
-- HAVING (SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyprice) > 5000 
-- ORDER BY (SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyprice)DESC;

-- Nomor 5
-- SELECT o.addressLine1 AS 'Alamat', CONCAT(LEFT(o.phone, LENGTH(o.phone)-6), '* ****') AS 'Nomor Telpon',
-- COUNT(DISTINCT e.employeeNumber) AS 'Jumlah Karyawan', COUNT(DISTINCT c.customerName) 'Jumlah Pelanggan', ROUND(AVG(amount), 2) AS 'Rata-rata Penghasilan'
-- FROM offices AS o
-- JOIN employees AS e
-- USING (officeCode)
-- JOIN customers AS c
-- ON c.salesRepEmployeeNumber = e.employeeNumber
-- JOIN payments AS p
-- USING (customerNumber)
-- GROUP BY o.officeCode;