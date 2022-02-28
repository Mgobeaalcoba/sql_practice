 -- Select clasico

 SELECT * FROM platzi.alumnos -- Platzi es el esquema y alumnos es la tabla a consultar

-- Select de columnas

SELECT column1, column2, column3 AS mycolumn
FROM platzi.alumnos

-- Select If

SELECT IF (500 < 1000, 'Yes', 'No');

-- Select Case --> When -- Then -- Else -- End

SELECT orderID, quantity,
CASE 
    WHEN quantity > 30 THEN 'Over 30'
    WHEN quantity = 30 THEN 'Equal 30'
    ELSE 'Under 30'
END AS QuantityText

-- Select con operaciones aritmeticas y group by

SELECT COUNT(id), SUM(quantity), AVG(sales)
FROM platzi.alumnos
GROUP BY carrier;
