-- 2. Suponiendo que tenemos la siguiente base de datos representada por el siguiente
-- esquema relacional:

-- Nota: pedidos.IdCliente y detalles_de_pedidos.idPedido son claves externas (foreign keys).
-- Escribir las sentencias de consulta para obtener la siguiente información:

/*1. El NombreContacto y CargoContacto de los clientes.*/

	SELECT NombreContacto,  CargoContacto FROM clientes;

/*2. El nombreContacto y Pais de los clientes cuyo Pais es Alemania.*/

	SELECT  NombreContacto, Pais FROM clientes WHERE Pais = 'Alemania'; 

/* 3. El nombreConctaco de los clientes de Alemania cuyo CargoContacto sea ‘Agente de
ventas’ o ‘Asistente de marketing’. Los nombres deben mostrarse ordenados de forma
ascendente.*/

	SELECT NombreContacto FROM clientes 
		WHERE Pais = 'Alemania' 
		AND CargoContacto IN ('Agente de ventas','Asistente de marketin')
		ORDER BY NombreContacto; 


/* 4. IdPedido, idCliente y Destinatario de los pedidos del cliente con idCliente=’ANTON’*/

	SELECT IdPedido, IdCliente, Destinatario FROM pedidos WHERE IdCliente = 'ANTON';

/* 5. Los cargos (columna Cargo) de los pedidos del cliente con NombreContacto=’Ana Trujillo’*/

	SELECT p.Cargo FROM cliente c
    INNER JOIN pedidos p ON p.IdCliente = c.IdCliente
    WHERE c.NombreContacto = 'Ana Trujillo';

/* 6. Detalles de los pedidos de aquellos clientes cuya ciudad es ‘Londres’.*/

	SELECT p.* FROM cliente c
    INNER JOIN pedidos p ON p.IdCliente = c.IdCliente
    WHERE c.Ciudad = 'Londres';
    
/* 7. NombreCampañia y FechaPedido de aquellos clientes que tienen pedidos con
FechaPedido posterior al 1-1-1997. Nota: El formato de la fecha ha de ser ‘aaaa-mm-dd’, 
ejemplo FechaPedido > ´1997-1-1´*/

SELECT c.NombreCampania, p.FechaPedido
FROM clientes c
JOIN pedidos p ON c.IdCliente = p.IdCliente
WHERE p.FechaPedido > '1997-01-01';


/* 8. La suma del Cargo de todos los pedidos del cliente con NombreContacto = ‘Ana Trujillo’*/

	SELECT SUM(p.Cargo) As SumaDeCargo FROM cliente c
    INNER JOIN pedidos p ON p.IdCliente = c.IdCliente
    WHERE c.NombreContacto = 'Ana Trujillo';
    
/* 9. NombreContacto de los clientes que no tienen ningún pedido */

	SELECT c.NombreContacto
	FROM clientes c
	LEFT JOIN pedidos p ON c.IdCliente = p.IdCliente
	WHERE p.IdPedido IS NULL;

/* 10. Número de pedidos del cliente con NombreContacto=’Ana Trujillo’ */

	SELECT NombreContacto, COUNT(p.IdPedido) As NumeroDePedidos 
    FROM cliente c
    INNER JOIN pedidos p ON p.IdCliente = c.IdCliente
    WHERE c.NombreContacto = 'Ana Trujillo';
