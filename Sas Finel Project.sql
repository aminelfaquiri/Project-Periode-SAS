use master
-- create New database --------
CREATE DATABASE Online_Retail_DB

use Online_Retail_DB 

SELECT * FROM Online_Retail
-------------------------------------------------------------------------------------
-- des requêtes pour vérifier des informations que vous voyez utiles du Dataset : ---
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
-- 2) Créer une nouvelle Table : CustomerID et le montant total qu’il a dépensé chaque année dans notre site : --
-----------------------------------------------------------------------------------------------------------------

SELECT CustomerID, YEAR(InvoiceDate) AS [year], SUM(UnitPrice * Quantity) AS montant_total
INTO dépensé_customer
FROM Online_Retail
GROUP BY CustomerID, YEAR(InvoiceDate)

SELECT * FROM dépensé_customer

DROP TABLE dépensé_customer