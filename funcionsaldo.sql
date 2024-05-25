delimiter //

CREATE FUNCTION CALCULO_NIVEL (saldo decimal(10,2))
returns varchar(10)
deterministic
begin
	declare nivel_tarjeta varchar(10);
    
    if saldo <= 5000 then -- condicion para determinar el nivel de tarjeta
		set nivel_tarjeta = 'PLATA';
	elseif saldo > 5000 and saldo <= 50000 then
		set nivel_tarjeta = 'ORO';
	else
		set nivel_tarjeta = 'PLATINO';
	end if;

	return nivel_tarjeta;

end //

delimiter ; 

-- Para consultar la funcion creada 

select CALCULO_NIVEL(2000) AS info_tarjeta;
select CALCULO_NIVEL(20000) AS info_tarjeta;
select CALCULO_NIVEL(60000) AS info_tarjeta;
