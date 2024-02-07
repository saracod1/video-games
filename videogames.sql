#Ventas globales totales para cada género de juego 
SELECT Genre, ROUND(SUM(Global_Sales),2) AS Total_sales
FROM videogames.sales
GROUP BY Genre
ORDER BY Total_sales DESC;

#Top 15 de videojuegos vendidos
SELECT Name,
	   ROUND(SUM(Global_Sales),2) as total_sales
FROM videogames.sales
GROUP BY Name
ORDER BY total_sales DESC
LIMIT 15;

#Ventas globales por género en diferentes regiones
SELECT Genre, 
       ROUND(SUM(NA_Sales),2) AS Total_NA_Sales, 
       ROUND(SUM(EU_Sales),2) AS Total_EU_Sales, 
       ROUND(SUM(JP_Sales),2) AS Total_JP_Sales, 
       ROUND(SUM(Other_Sales),2) AS Total_Other_Sales
FROM videogames.sales
GROUP BY Genre
ORDER BY Total_NA_Sales DESC,
		 Total_EU_Sales DESC,
         Total_JP_Sales DESC,
         Total_Other_Sales DESC;

#Ventas globales por año de lanzamiento
SELECT Year, ROUND(SUM(Global_Sales),2) AS Total_Sales
FROM videogames.sales
GROUP BY Year
ORDER BY Total_Sales DESC;

#Top 15 de los editores con más ventas en Norte américa
SELECT Publisher, ROUND(SUM(NA_Sales),2) AS Totalsales_NA
FROM videogames.sales
GROUP BY Publisher
ORDER BY Totalsales_NA DESC
LIMIT 15;

#Recuento de videojuegos realizadas por editoriales
SELECT Publisher, COUNT(DISTINCT Name) AS N_videogames
FROM videogames.sales
GROUP BY Publisher
ORDER BY N_videogames DESC;

#Participación en el mercado de las editoriales
SELECT Publisher, 
SUM(Global_Sales) AS Total_Global_Sales,
SUM(Global_Sales) / (SELECT SUM(Global_Sales) FROM videogames.sales) * 100 AS Market_Share
FROM videogames.sales
GROUP BY Publisher
ORDER BY Total_Global_Sales DESC;

#Valor maximo de venta por país
SELECT
ROUND(SUM(NA_Sales),2) as total_NA,
ROUND(SUM(EU_Sales),2) as total_EU,
ROUND(SUM(JP_Sales),2) as total_JP
FROM videogames.sales;



