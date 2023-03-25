CREATE OR ALTER VIEW VENDAS_INTERNET AS
SELECT
	fis.salesOrderNumber AS 'N° PEDIDO',
	fis.OrderDate AS 'DATA PEDIDO',
	dpc.englishProductCategoryName AS 'CATEGORIA PRODUTO',
	CONCAT(FirstName, ' ',LastName) AS 'NOME CLIENTE',
	dc.Gender AS 'SEXO',
	dst.salesTerritoryCountry AS 'PAÍS',
	fis.orderQuantity AS 'QTD. VENDIDA',
	fis.totalProductCost AS 'CUSTO VENDA',
	fis.salesAmount AS 'RECEITA VENDA'
FROM FactInternetSales fis
	INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey  
		INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey  
			INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey  
	INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
	INNER JOIN DimSalesTerritory dst ON fis.SalesTerritoryKey = dst.SalesTerritoryKey
WHERE YEAR(OrderDate) = 2013



