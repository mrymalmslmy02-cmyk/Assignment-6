CREATE TABLE IF NOT EXISTS suppliers(
  SupplierID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  SupplierName text,
  ContactNumber text
) ;

CREATE TABLE IF NOT EXISTS products (
  ProductID INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ProductName text,
  Price decimal(10,2) ,
  StockQuantity INT(11),
  SupplierID INT(11) ,
  FOREIGN KEY (SupplierID) REFERENCES  suppliers(SupplierID)

) ;

CREATE TABLE IF NOT EXISTS Sales(
     SaleID INT PRIMARY KEY AUTO_INCREMENT ,
      QuantitySold INT,
       SaleDate DATE, 
       ProductID INT, 
       FOREIGN KEY (ProductID) REFERENCES Products(ProductID) 
       );

---------------------------------------------------
--2
ALTER TABLE products ADD Category VARCHAR(255) ;
--3
ALTER TABLE products DROP Category ;
--4
ALTER TABLE suppliers MODIFY ContactNumber VARCHAR(15);
--5
ALTER TABLE products MODIFY ProductName text NOT NULL  ;
--6
--A
INSERT INTO `suppliers`( `SupplierName`, `ContactNumber`) VALUES ("FreshFoods","01001234567");
--B 
--I
INSERT INTO products (ProductName , Price ,StockQuantity,SupplierID)VALUES("Milk",15.00 ,50 ,1);
--II
INSERT INTO products (ProductName , Price ,StockQuantity,SupplierID)VALUES("Bread",10.00 ,30 ,1);
--III
 INSERT INTO products (ProductName , Price ,StockQuantity,SupplierID)VALUES("Eggs",20.00 ,40 ,1);
--C
INSERT INTO Sales (QuantitySold ,SaleDate ,ProductID)VALUES(2,  '2025-05-20',1);
--7
UPDATE Products SET Price = 25.00 WHERE ProductName = 'bread';
--8
DELETE FROM Products WHERE ProductName = 'Eggs'
--9
SELECT products.ProductName , SUM(sales.QuantitySold)  AS TotalSold
from sales
JOIN products ON sales.ProductID = products.ProductID
Group by products.ProductName;

--10
Select*FROM Products WHERE StockQuantity = (Select MAX(StockQuantity) FROM Products )
--11
SELECT* FROM suppliers WHERE SupplierName LIKE 'F%'
--12
SELECT* FROM Products WHERE ProductID NOT IN (SELECT ProductID FROM Sales)
--13
SELECT Products.ProductName , Sales.SaleDate
FROM Products
JOIN Sales
ON Sales.ProductID = Products.ProductID;
--14
CREATE USER 'store_manager'@'localhost';
GRANT SELECT ,INSERT,UPDATE ON *.* TO 'store_manager'@'localhost';
--15
REVOKE UPDATE ON *.* FROM 'store_manager'@'localhost';
--16
GRANT DELETE ON Sales TO 'store_manager'@'localhost';