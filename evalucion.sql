/*Seleccione los nombres del asesor, el id de la asesoría, la fecha y hora de la asesoría de las asesorías 
en estado Asignada. Asegúrese de mostrar TODOS los registros de asesores así tengan o no tengan 
asesorías relacionadas.*/
select a.nombres, se.idasesoria,se.fecha,se.hora from asesores a inner join asesorias se
on se.asesor =a.codigo where estado ='asignada'group by se.idasesoria ;

/*Seleccione los apellidos y nombres del aprendiz, el nombre del programa de formación de los jugadores 
que Juegan video juegos O que son de sexo masculino.*/
select  ap.nombres,ap.apellidos,p.nombre from aprendices ap inner join programas p 
on ap.programa=p.codigo  where jugadorvd='S'or sexo='M';

/*Seleccione los datos de la asesoría, idasesoria, fecha y hora, los apellidos y nombres 
del aprendiz, el nombre del programa de formación de los jugadores, nombre del instructor y nombre del 
asesor. SIEMPRE debe existir los datos del aprendiz y del instructor, pero no interesa si existe o no datos 
del asesor (pueden quedar nulos). Ordene los datos por el id de la asesoría.*/
select  a.idasesoria,a.fecha,a.hora,ap.nombres,ap.apellidos,i.nombre as instructor,
ase.nombres as asesor,a.estado from asesorias a left join asesores ase on a.asesor=ase.codigo
inner join instructores i on a.instructor=i.login inner join aprendices ap on ap.documento=a.aprendiz
order by a.idasesoria;
/*Seleccione los datos de las asesorías, id de la asesoría, fecha y hora de la asesoría y relacione en la 
consulta los nombres y apellidos del aprendiz que tiene relacionada la asesoría y el nombre del instructor 
que se relacionó en la asesoría. SIEMPRE debe salir los datos del instructor pero los datos del aprendiz 
pueden estar allí o pueden quedar nulos. Ordene los datos por el id de la asesoría*/

select  a.idasesoria,a.fecha,a.hora,ap.nombres,ap.apellidos,i.nombre as instructor from asesorias a left join asesores ase on a.asesor=ase.codigo
inner join instructores i on a.instructor=i.login left join aprendices ap on ap.documento=a.aprendiz order by a.idasesoria;

/*Cuántas asesorías brindó cada asesor? Muestre el nombre del asesor y la cantidad de asesorías
ofrecidas por cada uno de ellos. si el asesor no está relacionado, debe salir de todas formas la cifra con 
un asesor no identificado.*/
select a.nombres,count(se.idasesoria)as numeroAsesorias from asesores a right join asesorias se
on se.asesor =a.codigo
group by a.nombres
order by a.nombres 