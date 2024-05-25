/*2. Suponiendo que tenemos la siguiente base de datos representada por el siguiente
esquema relacional:
Nota: pedidos.IdCliente, pedidos.FormaEnvío y pedidos.IdEmpleado son claves externas
(foreign keys).
Escribir las sentencias de consulta para obtener la siguiente información:*/

/* 1. El NombreContacto y CargoContacto de los clientes. */

	SELECT NombreContacto, CargoContacto FROM clientes;

/* 2. El nombreContacto y Pais de los clientes cuyo Pais es España. */
	
    SELECT NombreContacto, Pais FROM clientes WHERE Pais = 'España';

/* 3. El nombreConctaco de los clientes de Alemania cuyo CargoContacto sea ‘Agente de
ventas’ o ‘Asistente de marketing’. Los nombres deben mostrarse ordenados de forma
ascendente y todo en mayúscula. */

	SELECT UPPER(NombreContacto) FROM clientes WHERE Pais = 'Alemania'
    AND CargoContacto IN ('Agente de ventas', 'Asistente de marketing')
    ORDER BY NombreContacto;
    
/* 4. IdPedido, idCliente y DirecciónDestinatario de los pedidos del cliente con
idCliente=’BOLID’. El idCliente debe mostrase en minúsculas. */

	SELECT IdPedido, LOWER(IdCliente), DireccionDestinatario FROM pedidos 
		WHERE IdCliente= 'BOLID';

/* 5. Los cargos (columna Cargo) de los pedidos del empleado cuyo nombre en mayúsculas
es ‘ANTONIO MORENO’. Las cantidades del cargo se han de mostrar con el símbolo € a
su derecha */

	SELECT CONCAT(p.Cargo, ' €') As CargoFormato FROM pedidos p
    JOIN empleados e ON e.IdEmpleado = p.IdEmpleado 
    WHERE UPPER(e.Nombre) = 'ANTONIO MORENO';

/* 6. Las distintas compañía de envío de aquellos pedidos servidos por los los empleados de
‘Londres’. */

	SELECT c.* FROM campania_de_envio c
    JOIN pedidos p ON p.FormaEnvio = c.IdCompaniaEnvios
    JOIN empleados e ON e.IdEmpleado = p.IdEmpleado
    WHERE e.Ciudad = 'Londres';

/* 7. NombreCampañia y FechaPedido de aquellos clientes que tienen pedidos en el año
1997. Nota: El formato de la fecha ha de ser ‘aaaa-mm-dd’, ejemplo FechaPedido >
'1997-1-1' */

	SELECT NombreCampania, FechaPedido FROM campania_de_envio ce
    JOIN pedidos p ON p.FormaEnvio = ce.IdCompaniaEnvios
    JOIN clientes c ON c.IdCliente = p.IdCliente
    WHERE YEAR(FechaPedido) = 1997;

/* 8. Los empleados que han servido pedidos al cliente de la compañía ‘Ana Trujillo
Emparedados y helados’ */

	SELECT e.* FROM empleados e
    JOIN pedidos p ON p.IdEmpleado = e.IdEmpleado
    JOIN clientes c ON c.IdCliente = p.IdCliente
    WHERE NombreCompania = 'Ana Trujillo Emparedados y helados';

/* 9. La suma del Cargo de los pedidos de cada País cliente. Mostrar las cabeceras de
columna: “País Cliente”, “Suma Cargo”. Los países se han de mostrar en mayúscula.
Los registros se han de mostrar ordenados por la suma del cargo de forma
descendente. */

	SELECT UPPER(c.Pais) AS "Pais Cliente", SUM(p.Cargo) AS "Suma Cargo" FROM pedidos p
    JOIN clientes c ON c.IdCliente = p.IdCliente
    ORDER BY "Suma Cargo" DESC;

/* 10. Mostrar el nombre de las compañías de envíos, número de envíos que han realizado
por país cliente, y país cliente del envío, para las compañías de envío que han realizado
más de 25 envíos para los clientes de Alemania, México o Francia. El país del cliente de
envío se ha de mostrar con sus 3 primeras letras en mayúscula, ejemplo: MÉX, FRA,
ALE. Ejemplo de datos extraídos */

	SELECT ce.NombreCompania, COUNT(c.Pais) NumeroEnvios, UPPER(SUBSTRING(c.Pais, 1, 3)) AS PaisCliente
    FROM clientes c
    JOIN pedidos p ON p.IdCliente = c.IdCliente
    JOIN campania_de_envio ce ON ce.IdCompaniaEnvios = p.FormaEnvio
    WHERE c.Pais IN ('Alemania', 'México', 'Francia')
    GROUP BY ce.NombreCompania, PaisCliente
    HAVING COUNT(c.Pais) > 25

	