# __Ejercicio 1:__ Escribe una consulta para mostrar el nombre y la población de todos los países del continente europeo.

SELECT Name AS Pais, SUM(Population) AS Poblacion_Total
FROM country
WHERE Continent = 'Europe'
GROUP BY Name
ORDER BY poblacion_total DESC

#  __Ejercicio 2:__ Escribe una consulta para mostrar los nombres y las áreas de superficie de los cinco países más grandes del mundo (en términos de área de superficie)

SELECT Name as Pais, SurfaceArea as Superficie_total
FROM country
ORDER BY Superficie_total DESC
LIMIT 5

# __Ejercicio 3:__ Escribe una consulta para calcular la población total de todos los países de cada continente y mostrar el resultado junto con el nombre del continente.

SELECT continent AS Continente, 
SUM(Population) AS Poblacion_Total
FROM country
GROUP BY continent
ORDER BY Poblacion_Total DESC

#Adicional

SELECT name as Pais, continent as Continente, SUM(Population) as Poblacion_Total
FROM country 
GROUP BY name, continent
ORDER BY continent ASC

#  __Ejercicio 4:__ Escribe una consulta para mostrar el nombre de las ciudades y la población de todos los países de Europa, ordenados por población de la ciudad de manera descendente.

SELECT 
ci.name as Ciudad,
co.name as Pais,
ci.Population as Poblacion_Total
FROM city ci
LEFT JOIN country co ON ci.CountryCode = co.Code
WHERE co.Continent = 'Europe'
ORDER by Poblacion_Total DESC

# __Ejercicio 5:__ Actualiza la población de China (código de país 'CHN') a 1500000000 (1.5 mil millones).

UPDATE country 
SET country.population = 1500000000
WHERE country.code = 'CHN'

SELECT code as Código , name as Pais, Population as Población
FROM country
WHERE code = 'CHN'

# __Ejercicio 6:__ Consulta los idiomas oficiales en Sudamérica y gráfica cuántos países comparten cada idioma oficial.

SELECT cl.Language AS Idioma, COUNT(DISTINCT c.Name) AS Total_Paises
FROM countrylanguage AS cl
LEFT JOIN country AS c ON cl.CountryCode = c.Code
WHERE c.Continent = 'South America' AND cl.IsOfficial = 'T'
GROUP BY cl.Language
ORDER BY Total_Paises DESC;

# Consulta adicional

SELECT cl.Language AS Idioma, c.Name AS Pais
FROM countrylanguage AS cl
LEFT JOIN country AS c ON cl.CountryCode = c.Code
WHERE c.Continent = 'South America' AND cl.IsOfficial = 'T'
ORDER BY Idioma DESC;

# __Ejercicio 7:__ Obtén todos los países con esperanza de vida > 75 años y crea un histograma de su distribución.

SELECT Name AS Pais, LifeExpectancy AS Esperanza_de_Vida
FROM Country
WHERE LifeExpectancy > 75

# __Ejercicio 8:__ Calcula la densidad poblacional de todos los países y muestra un gráfico de dispersión entre superficie y población con el color como función del continente.

SELECT 
  Name AS Pais,
  Continent AS Continente,
  SurfaceArea AS Superficie_km2,
  Population AS Poblacion,
  ROUND(Population / SurfaceArea) AS Densidad_Poblacional
FROM 
  country
WHERE SurfaceArea > 0
ORDER BY Densidad_Poblacional DESC;

# __Ejercicio 9:__ Visualiza las ciudades con más de 5 millones de habitantes en un gráfico horizontal de barras.

SELECT Name as Ciudad,
Population as Poblacion
FROM city
WHERE Population > 5000000
ORDER By Population DESC

# __Ejercicio 10:__ Gráfica cuántos idiomas se hablan por continente usando un gráfico de pastel.

SELECT Continent as Continente,
COUNT(Language) as Total_idiomas
FROM countrylanguage cl
LEFT JOIN country AS c ON cl.CountryCode = c.Code
GROUP BY Continent
ORDER BY Total_idiomas DESC
