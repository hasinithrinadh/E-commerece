CREATE TABLE Orders (
    Order_ID     NUMBER PRIMARY KEY,
    Customer_ID  NUMBER NOT NULL,
    Order_Date   DATE NOT NULL,
    Order_Status VARCHAR2(20),
    Total_Amount NUMBER(10,2),
    CONSTRAINT fk_order_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),
    CONSTRAINT chk_order_status
        CHECK (Order_Status IN
        ('Pending', 'Confirmed', 'Shipped', 'Delivered', 'Cancelled'))
);

CREATE TABLE Order_Items (
    Order_Item_ID NUMBER PRIMARY KEY,
    Order_ID      NUMBER NOT NULL,
    Product_ID    NUMBER NOT NULL,
    Quantity      NUMBER NOT NULL,
    Price         NUMBER(10,2) NOT NULL,
    Sub_total     NUMBER(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Order_Status, Total_Amount)
VALUES (2001, 201, TO_DATE('22-09-2026', 'DD-MM-YYYY'), 'Pending', 1450);

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Order_Status, Total_Amount)
VALUES (2002, 202, TO_DATE('21-09-2026', 'DD-MM-YYYY'), 'Confirmed', 890);

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Order_Status, Total_Amount)
VALUES (2003, 203, TO_DATE('20-09-2026', 'DD-MM-YYYY'), 'Shipped', 1800);

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Order_Status, Total_Amount)
VALUES (2004, 201, TO_DATE('19-09-2026', 'DD-MM-YYYY'), 'Delivered', 650);

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Order_Status, Total_Amount)
VALUES (2005, 204, TO_DATE('18-09-2026', 'DD-MM-YYYY'), 'Cancelled', 420);

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Order_Status, Total_Amount)
VALUES (2006, 205, TO_DATE('17-09-2026', 'DD-MM-YYYY'), 'Pending', 980);

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Order_Status, Total_Amount)
VALUES (2007, 206, TO_DATE('16-09-2026', 'DD-MM-YYYY'), 'Cancelled', 1350);

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Order_Status, Total_Amount)
VALUES (2008, 201, TO_DATE('10-09-2026', 'DD-MM-YYYY'), 'Delivered', 1750);

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Order_Status, Total_Amount)
VALUES (2009, 207, TO_DATE('11-09-2026', 'DD-MM-YYYY'), 'Shipped', 2600);

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Order_Status, Total_Amount)
VALUES (2010, 209, TO_DATE('21-09-2026', 'DD-MM-YYYY'), 'Confirmed', 3200);

INSERT INTO Order_Items VALUES (1, 2001, 301, 1, 850, 850);
INSERT INTO Order_Items VALUES (2, 2002, 304, 1, 890, 890);
INSERT INTO Order_Items VALUES (3, 2003, 307, 2, 900, 1800);
INSERT INTO Order_Items VALUES (4, 2004, 303, 1, 650, 650);
INSERT INTO Order_Items VALUES (5, 2005, 309, 1, 420, 420);
INSERT INTO Order_Items VALUES (6, 2006, 302, 2, 490, 980);
INSERT INTO Order_Items VALUES (7, 2007, 308, 1, 1350, 1350);
INSERT INTO Order_Items VALUES (8, 2008, 305, 2, 875, 1750);
INSERT INTO Order_Items VALUES (9, 2009, 310, 1, 2600, 2600);
INSERT INTO Order_Items VALUES (10, 2010, 306, 2, 1600, 3200);
INSERT INTO Order_Items VALUES (11, 2001, 306, 1, 600, 600);

COMMIT;

SELECT * FROM Orders;

SELECT * FROM Order_Items;

UPDATE Orders
SET Order_Status = 'Confirmed'
WHERE Order_ID = 2001;

UPDATE Orders
SET Order_Status = 'Shipped'
WHERE Order_ID = 2002;

SELECT * FROM Orders WHERE Order_ID IN (2001, 2002);

UPDATE Order_Items
SET Quantity = 2
WHERE Order_Item_ID = 1;

UPDATE Order_Items
SET Price = Price + 50
WHERE Order_Item_ID = 3;

UPDATE Order_Items
SET Quantity = 3
WHERE Order_Item_ID = 10;

SELECT * FROM Order_Items WHERE Order_Item_ID IN (1, 3, 10);

COMMIT;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    oi.Product_ID,
    oi.Quantity,
    oi.Price,
    oi.Sub_total
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
JOIN Order_Items oi
    ON o.Order_ID = oi.Order_ID
ORDER BY c.Customer_ID, o.Order_Date;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    COUNT(o.Order_ID)   AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Amount
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Customer_Name
ORDER BY
    c.Customer_ID;

COMMIT;
