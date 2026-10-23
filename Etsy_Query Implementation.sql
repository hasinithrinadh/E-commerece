SELECT * FROM Product;

SELECT Product_ID, Product_Name, Price
FROM Product;


SELECT *
FROM Product
WHERE Price < 1000;

SELECT *
FROM Product
WHERE Price > 100;


SELECT Product_ID, Product_Name, Price
FROM Product
ORDER BY Price ASC;

SELECT Product_ID, Product_Name, Price
FROM Product
ORDER BY Price DESC;


SELECT DISTINCT Category_ID
FROM Product
ORDER BY Category_ID;


SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price BETWEEN 100 AND 500;

SELECT Product_ID, Product_Name, Category_ID
FROM Product
WHERE Category_ID = 1;

SELECT Product_ID, Product_Name, Stock_Quantity
FROM Product
WHERE Stock_Quantity > 0;

SELECT Product_ID, Product_Name, Stock_Quantity
FROM Product
WHERE Stock_Quantity < 10
ORDER BY Stock_Quantity ASC;

SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Product_Name LIKE '%Handmade%';


SELECT Customer_ID, Customer_Name, Email, Contact_No
FROM Customer;

SELECT *
FROM Customer
WHERE Customer_ID = 101;


SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price < 2000
AND Category_ID = 2;

SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Category_ID = 1
OR Category_ID = 3;

SELECT Product_ID, Product_Name, Category_ID
FROM Product
WHERE NOT Category_ID = 1;

SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Category_ID IN (1, 2, 3);

SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price BETWEEN 100 AND 300;


SELECT
    Product_ID,
    Product_Name,
    Price
FROM Product
ORDER BY Price DESC;


SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
ORDER BY o.Order_Date DESC;


SELECT
    oi.Order_ID,
    oi.Product_ID,
    oi.Quantity,
    oi.Unit_Price,
    oi.Subtotal
FROM Order_Item oi
ORDER BY oi.Subtotal DESC;


SELECT
    c.Customer_ID,
    c.Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Orders DESC;


SELECT
    c.Customer_ID,
    c.Customer_Name,
    SUM(o.Total_Amount) AS Total_Purchase
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Purchase DESC;