CREATE TABLE Seller (
    Seller_ID    INT PRIMARY KEY,
    Seller_Name  VARCHAR2(100) NOT NULL,
    Shop_Name    VARCHAR2(100) NOT NULL,
    Email        VARCHAR2(100) NOT NULL UNIQUE,
    Password     VARCHAR2(50)  NOT NULL,
    Phone_Number VARCHAR2(15)  NOT NULL UNIQUE,
    Address      VARCHAR2(200) NOT NULL,
    Rating       NUMBER(2,1),
    Join_Date    DATE NOT NULL
);

CREATE TABLE Shop (
    Shop_ID     INT PRIMARY KEY,
    Seller_ID   INT NOT NULL UNIQUE,
    Shop_Name   VARCHAR2(100) NOT NULL,
    Description VARCHAR2(255),
    Logo        VARCHAR2(200),
    Location    VARCHAR2(100) NOT NULL,
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID)
);

CREATE TABLE Category (
    Category_ID   INT PRIMARY KEY,
    Category_Name VARCHAR2(100) NOT NULL,
    Description   VARCHAR2(255)
);

CREATE TABLE Product (
    Product_ID   INT PRIMARY KEY,
    Seller_ID    INT NOT NULL,
    Category_ID  INT NOT NULL,
    Product_Name VARCHAR2(100) NOT NULL,
    Description  VARCHAR2(255),
    Price        NUMBER(10,2) NOT NULL,
    Quantity     INT NOT NULL,
    Material     VARCHAR2(50),
    Color        VARCHAR2(30),
    Product_Size VARCHAR2(20),
    Image_URL    VARCHAR2(200),
    Listing_Date DATE NOT NULL,
    FOREIGN KEY (Seller_ID)   REFERENCES Seller(Seller_ID),
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

INSERT INTO Seller VALUES (501, 'Aarthi Handmade Crafts', 'Handmade Haven', 'aarthi.crafts@gmail.com', 'Pass@123', '9000000001', 'Coimbatore', 4.5, '10-JAN-2026');
INSERT INTO Seller VALUES (502, 'Rahul Vintage Store', 'Vintage Vault', 'rahul.vintage@gmail.com', 'Pass@456', '9000000002', 'Chennai', 4.2, '15-FEB-2026');
INSERT INTO Seller VALUES (503, 'Meera Jewel Works', 'Bead and Bloom', 'meera.jewels@gmail.com', 'Pass@789', '9000000003', 'Madurai', 4.8, '02-MAR-2026');
INSERT INTO Seller VALUES (504, 'Karthik Wood Art', 'Woodcraft Studio', 'karthik.wood@gmail.com', 'Pass@321', '9000000004', 'Bangalore', 4.0, '20-MAR-2026');
INSERT INTO Seller VALUES (505, 'Divya Home Decor', 'Decor Diaries', 'divya.decor@gmail.com', 'Pass@654', '9000000005', 'Salem', 3.9, '05-APR-2026');

INSERT INTO Shop VALUES (601, 501, 'Handmade Haven', 'Handmade cotton and jute bags', 'handmade_haven.png', 'Coimbatore');
INSERT INTO Shop VALUES (602, 502, 'Vintage Vault', 'Vintage collectibles and antique decor', 'vintage_vault.png', 'Chennai');
INSERT INTO Shop VALUES (603, 503, 'Bead and Bloom', 'Handcrafted beaded jewellery', 'bead_bloom.png', 'Madurai');
INSERT INTO Shop VALUES (604, 504, 'Woodcraft Studio', 'Wooden toys and carved showpieces', 'woodcraft_studio.png', 'Bangalore');
INSERT INTO Shop VALUES (605, 505, 'Decor Diaries', 'Home decor and wall hangings', 'decor_diaries.png', 'Salem');

INSERT INTO Category VALUES (1, 'Handmade Bags', 'Cloth and jute bags');
INSERT INTO Category VALUES (2, 'Jewellery', 'Handcrafted jewellery');
INSERT INTO Category VALUES (3, 'Home Decor', 'Wall and table decor');
INSERT INTO Category VALUES (4, 'Vintage', 'Vintage and antique items');

INSERT INTO Product VALUES (701, 501, 1, 'Handmade Jute Tote Bag', 'Eco friendly jute bag', 450, 40, 'Jute', 'Brown', 'Medium', 'jute_tote.jpg', '12-JAN-2026');
INSERT INTO Product VALUES (702, 503, 2, 'Beaded Silver Necklace', 'Handcrafted bead necklace', 1200, 25, 'Silver', 'Silver', 'Free', 'bead_necklace.jpg', '05-MAR-2026');
INSERT INTO Product VALUES (703, 504, 3, 'Carved Wooden Elephant', 'Rosewood carved showpiece', 850, 0, 'Wood', 'Brown', 'Small', 'wood_elephant.jpg', '22-MAR-2026');
INSERT INTO Product VALUES (704, 502, 4, 'Vintage Brass Lamp', 'Antique brass table lamp', 2100, 10, 'Brass', 'Golden', 'Medium', 'brass_lamp.jpg', '18-FEB-2026');
INSERT INTO Product VALUES (705, 505, 3, 'Macrame Wall Hanging', 'Cotton macrame wall decor', 700, 15, 'Cotton', 'White', 'Large', 'macrame.jpg', '08-APR-2026');

COMMIT;

SELECT
    s.Seller_ID,
    s.Seller_Name,
    sh.Shop_Name,
    sh.Location,
    s.Rating
FROM Seller s
JOIN Shop sh
    ON s.Seller_ID = sh.Seller_ID
ORDER BY s.Seller_Name;

SELECT
    s.Seller_Name,
    sh.Shop_Name,
    p.Product_Name,
    p.Price,
    p.Quantity
FROM Seller s
JOIN Shop sh
    ON s.Seller_ID = sh.Seller_ID
JOIN Product p
    ON s.Seller_ID = p.Seller_ID
ORDER BY s.Seller_Name;

SELECT
    p.Product_ID,
    p.Product_Name,
    p.Quantity,
    'Available' AS Stock_Status
FROM Product p
WHERE p.Quantity > 0;

SELECT
    p.Product_ID,
    p.Product_Name,
    p.Quantity,
    'Unavailable' AS Stock_Status
FROM Product p
WHERE p.Quantity = 0;

SELECT Product_ID, Product_Name, Quantity
FROM Product
WHERE Quantity = 0;

UPDATE Product
SET Quantity = 30
WHERE Product_ID = 705;

SELECT Product_ID, Product_Name, Quantity
FROM Product
WHERE Product_ID = 705;

SELECT
    s.Seller_Name,
    sh.Shop_Name,
    c.Category_Name,
    p.Product_Name,
    p.Price,
    p.Quantity
FROM Product p
JOIN Seller s
    ON p.Seller_ID = s.Seller_ID
JOIN Shop sh
    ON s.Seller_ID = sh.Seller_ID
JOIN Category c
    ON p.Category_ID = c.Category_ID
ORDER BY s.Seller_Name;

SELECT
    CASE WHEN Quantity > 0 THEN 'Available'
    ELSE 'Unavailable' END AS Stock_Status,
    COUNT(*) AS Total_Products
FROM Product
GROUP BY CASE WHEN Quantity > 0 THEN 'Available'
    ELSE 'Unavailable' END;

SELECT
    s.Seller_Name,
    SUM(p.Quantity) AS Total_Stock
FROM Seller s
JOIN Product p
    ON s.Seller_ID = p.Seller_ID
GROUP BY s.Seller_Name
ORDER BY s.Seller_Name;

SELECT
    p.Product_ID,
    p.Product_Name,
    s.Seller_Name,
    sh.Shop_Name,
    p.Quantity
FROM Product p
JOIN Seller s
    ON p.Seller_ID = s.Seller_ID
JOIN Shop sh
    ON s.Seller_ID = sh.Seller_ID
WHERE p.Quantity = 0;

SELECT
    s.Seller_Name,
    sh.Shop_Name,
    s.Rating
FROM Seller s
JOIN Shop sh
    ON s.Seller_ID = sh.Seller_ID
WHERE s.Rating >= 4.5
ORDER BY s.Rating DESC;

COMMIT;
