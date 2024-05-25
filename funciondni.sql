DELIMITER //

CREATE FUNCTION LINEA_INFORME (dni_alumno CHAR(9))
RETURNS VARCHAR(250)
DETERMINISTIC
begin -- Inicio

	declare nota1 decimal(4,2); -- Declaración de variables para obtener los valores de la calificacion
    declare nota2 decimal(4,2);
    declare nota_media decimal(4,2);
    declare nota_aprobada varchar(10);
    declare texto varchar(250); -- Esta al ser la variable que retornara se utilizara el declarado en el retorno de la funcion
    declare apellido1 varchar(30);
    declare apellido2 varchar(30);
    declare nombre varchar(30);
    
	select calific1, calific2, ape1, ape2, nombre
    into nota1, nota2, apellido1, apellido2, nombre
	from expediente_alumno
    where dni = dni_alumno;
    
    set nota_media = (nota1 + nota2)/2; -- Hasta aqui se calculo la media de ambas calificaciones
    
    if nota_media >= 5 then -- Aqui creamos la toma de decision de si esta aprobado o no
		set nota_aprobada = 'aprobado';
	else 
		set nota_aprobada = 'suspenso';
	end if; -- Aqui finaliza la decision
	
    set texto = concat(dni_alumno, ' ', -- La construccion del texto pedido
    upper(apellido1), ' ', 
    upper(apellido2), ', ', 
    upper(nombre), ' (', 
    nota_aprobada, ': ', 
    cast(nota_media as char(10)), ')'); -- esto es para cambiar el valor de decimal a texto    
    
    return texto; -- Aqui retorna el texto pedio
    
end//
DELIMITER ;

select LINEA_INFORME('12345678Z') as info_ejemplo;
select LINEA_INFORME('88845678X') as info_ejemplo;