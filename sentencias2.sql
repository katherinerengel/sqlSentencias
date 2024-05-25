-- Nombre del producto y Precio unidad de aquellos productos con precio superior a 15.99

select NombreProducto, PrecioUnidad from productos
where PrecioUnidad > 15.99;

/* Toda la información de los proveedores cuyo país sea Alemania, Reino Unido o Estados
Unidos y cuyo cargoContacto sea Representante de Ventas*/

select * from proveedores
where Pais in ('Alemania', 'Reino Unido', 'Estados Unidos')
and CargoContacto = 'Representante de ventas';

-- Categorías cuya descripción contenga el texto dulces.

select * from categorias
where Descripcion like '%dulces%';

/*Nombre y longitud del nombre de las categorías, ordenados por longitud del nombre
descendente.*/

select NombreCategoria, length(NombreCategoria) as LongitudCategoria  from categorias
order by LongitudCategoria desc;

-- NombreProducto y precioUnidad de todos los productos de la categoría Condimentos

select NombreProducto, PrecioUnidad from productos p
join categorias c on c.IdCategoria = p.IdCategoria
where c.NombreCategoria = 'Condimentos';

-- Para cada categoría su NombreCategoría y número de productos que tiene.

select NombreCategoria, count(p.IdProducto) as NumeroProducto from categorias c
join productos p on p.IdCategoria = c.IdCategoria;

/*Para aquellas categorías con más de 10 productos obtener su NombreCategoría y
número de productos.*/

select c.NombreCategoria, count(p.IdProducto) as NumeroProducto from categorias c
join productos p on p.IdCategoria = c.IdCategoria
group by NombreCategoria
having count(p.IdProducto) > 10;

-- NombreContacto de los proveedores que tienen productos de la categoría Bebidas.

select pv.NombreContacto from proveedores pv
join productos pd on pd.IdProveedor = pv.IdProveedor
join categorias ca on ca.IdCategoria = pd.IdCategoria
where ca.Nombrecategoria = 'Bebidas';

-- NombreProducto, NombreCompañia de los proveedores de Alemania.

select pd.NombreProducto, pv.NombreCompania from productos pd
join proveedores pv on pv.Id.Proveedor = pd.IdProveedor
where pv.Pais = 'Alemania';

-- Proveedores que solo tienen bebidas

select * from proveedores pv
join productos pd on pd.Id.Proveedor = pv.IdProveedor
join categorias ca on ca.IdCategoria = pd.IdCategoria
where NombreCategoria = 'Bebidas';








