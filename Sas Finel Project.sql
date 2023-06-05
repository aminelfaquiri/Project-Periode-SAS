use master
-- create New database --------
CREATE DATABASE Online_Retail_DB

use Online_Retail_DB 

SELECT * FROM Online_Retail
-------------------------------------------------------------------------------------
-- des requ�tes pour v�rifier des informations que vous voyez utiles du Dataset : ---
-------------------------------------------------------------------------------------
-----------------------------------------------
-- le nomber de ligne : -----------------------
-----------------------------------------------
SELECT count(*) FROM Online_Retail

-----------------------------------------------
-- le nomber de vente par chaque client :------
-----------------------------------------------
SELECT CustomerID, SUM(UnitPrice * Quantity) AS Total_price
FROM Online_Retail
GROUP BY CustomerID

-----------------------------------------------
-- le pays plus vente   ------------------------
-----------------------------------------------

SELECT TOP 1 Country, SUM(Quantity) AS TotalQuantity
FROM Online_Retail
GROUP BY Country
ORDER BY TotalQuantity DESC

-----------------------------------------------
-- le client plus acheter  : ------------------
-----------------------------------------------
SELECT TOP 1 CustomerID, SUM(Quantity) AS TotalQuantity
FROM Online_Retail
GROUP BY CustomerID
ORDER BY TotalQuantity DESC
-----------------------------------------------------------------------------------------------------------------
-- 2) Cr�er une nouvelle Table : CustomerID et le montant total qu�il a d�pens� chaque ann�e dans notre site : --
-----------------------------------------------------------------------------------------------------------------

SELECT CustomerID, YEAR(InvoiceDate) AS [year], SUM(UnitPrice * Quantity) AS montant_total
INTO d�pens�_customer
FROM Online_Retail
GROUP BY CustomerID, YEAR(InvoiceDate)

SELECT * FROM d�pens�_customer

DROP TABLE d�pens�_customer