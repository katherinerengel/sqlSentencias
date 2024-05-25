/* 2. Suponiendo que tenemos la siguiente base de datos representada por el siguiente
esquema relacional:
Nota: pedidos.idCliente y detalles_de_pedidos.idPedido son claves externas (foreign keys).
Escribir las sentencias de consulta para obtener la siguiente información: */

/* 1. El NombreContacto y CargoContacto de los clientes. */

	SELECT NombreContacto, CargoContacto FROM clientes;

/* 2. El nombreContacto y Pais de los clientes que no tengán información de la Región. */

	SELECT NombreContacto, Pais FROM clientes WHERE Region IS NULL;

/* 3. El nombreConctaco, CargoContacto de los clientes de Alemania y España cuyo
CargoContacto sea ‘Agente de ventas’ o ‘Asistente de marketing’. Los nombres deben
mostrarse en mayúscula y ordenados de forma ascendente. */

	SELECT UPPER(NombreContacto) AS NombreCliente, CargoContacto FROM clientes 
    WHERE Pais IN ('Alemania', 'España')
    AND CargoContacto IN ('Agente de ventas', 'Asistente de marketing')
    ORDER BY NombreContacto;

/* 4. NombreCompañía de los clientes que tengan más de 10 pedidos. */

	SELECT c.NombreCompania FROM clientes c
    JOIN pedidos p ON p.IdCliente = c.IdCliente
    GROUP BY c.NombreCompania
    HAVING COUNT(p.IdPedido) > 10;

/* 5. NombreCompañía de los clientes que tengan más de 10 pedidos con más de 10
detalles de pedido. */

	SELECT c.NombreCompania FROM clientes c
    JOIN pedidos p ON p.IdCliente = c.IdCliente
    JOIN (
		SELECT IdPedido FROM detalles_de_pedidos
        GROUP BY c.NombreCompania
		HAVING COUNT(p.IdPedido) > 10
    ) dp ON dp.IdPedido = p.IdPedido
    GROUP BY c.NombreCompania
    HAVING COUNT(p.IdPedido) > 10;
    
/* 6. NombreCompañia, total de cargos, de los clientes que realizaron pedidos en el año
1996, por un importe total de más de 500€ */

	SELECT c.NombreCompania, SUM(p.Cargo) AS TotalCargo FROM clientes c
    JOIN pedidos p ON p.IdCliente = c.IdCliente
    WHERE YEAR(p.FechaPedido) = 1996
    GROUP BY c.NombreCompania
    HAVING SUM(p.Cargo) > 500;

/* 7. NombreCompañía , el máximo cargo realizado en 1997. */

	SELECT c.NombreCompania, MAX(p.Cargo) AS TotalCargo 
    FROM clientes c
    JOIN pedidos p ON p.IdCliente = c.IdCliente
    WHERE YEAR(p.FechaPedido) = 1997
    GROUP BY c.NombreCompania;

/* 8. Cuantos detalles de pedido tiene el cliente con NombreContacto = ‘Ana Trujillo’ */

SELECT  COUNT(od.OrderID) AS CantidadDetalle
FROM clientes c
JOIN pedidos p ON c.IdCliente = p.IdCliente
JOIN detalles_de_pedidos dp ON dp.IdPedido = p.IdPedido
WHERE c.NombreContacto = 'Ana Trujillo';
    
/* 9. Clientes que no tienen pedidos. */

	SELECT c.* FROM clientes c
    LEFT JOIN pedidos p ON p.IdCliente = c.IdCliente
    WHERE p.IdPedido IS NULL;
    
/* 10. Clientes que han realizado pedidos que aun no se han enviado. */
	
	SELECT c.* FROM clientes c
    JOIN pedidos p ON p.IdCliente = c.IdCliente
    WHERE p.FechaEnvio IS NULL;
	