CREATE TABLE Review (
    Review_ID    NUMBER(5) PRIMARY KEY,
    Customer_ID  NUMBER(5),
    Product_ID   NUMBER(5),
    Review_Text  VARCHAR2(500) NOT NULL,
    Review_Date  DATE NOT NULL,
    CONSTRAINT fk_review_customer FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),
    CONSTRAINT fk_review_product FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);

CREATE TABLE Rating (
    Rating_ID    NUMBER(5) PRIMARY KEY,
    Customer_ID  NUMBER(5),
    Product_ID   NUMBER(5),
    Rating       NUMBER(1) NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Rating_Date  DATE NOT NULL,
    CONSTRAINT fk_rating_customer FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),
    CONSTRAINT fk_rating_product FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
);

INSERT INTO Review (Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
VALUES (601, 101, 101, 'Beautiful handmade piece, as described', SYSDATE);

INSERT INTO Review (Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
VALUES (602, 102, 102, 'Lovely craftsmanship, great packaging', SYSDATE);

INSERT INTO Review (Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
VALUES (603, 103, 101, 'Very satisfied with handmade quality', SYSDATE);

INSERT INTO Review (Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
VALUES (604, 104, 103, 'Unique design and worth the price', SYSDATE);

INSERT INTO Rating (Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
VALUES (701, 101, 101, 5, SYSDATE);

INSERT INTO Rating (Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
VALUES (702, 102, 102, 4, SYSDATE);

INSERT INTO Rating (Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
VALUES (703, 103, 101, 5, SYSDATE);

INSERT INTO Rating (Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
VALUES (704, 104, 103, 4, SYSDATE);

COMMIT;

SET LINESIZE 200
COLUMN Customer_Name FORMAT A15
COLUMN Review_Text   FORMAT A44

SELECT r.Review_ID, c.Customer_Name, r.Product_ID, r.Review_Text, r.Review_Date
FROM   Review r
JOIN   Customer c ON r.Customer_ID = c.Customer_ID
ORDER  BY r.Review_Date DESC;

SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM   Rating
GROUP  BY Product_ID;

SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM   Rating
GROUP  BY Product_ID
HAVING AVG(Rating) >= 4
ORDER  BY Average_Rating DESC;

SELECT p.Product_ID,
       p.Product_Name,
       COUNT(r.Rating_ID) AS Total_Ratings,
       AVG(r.Rating)      AS Average_Rating,
       MAX(r.Rating)      AS Highest_Rating,
       MIN(r.Rating)      AS Lowest_Rating
FROM   Rating r
JOIN   Product p ON r.Product_ID = p.Product_ID
GROUP  BY p.Product_ID, p.Product_Name
ORDER  BY Average_Rating DESC;
