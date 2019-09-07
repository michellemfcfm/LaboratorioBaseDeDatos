create table empleado(
numeroDeEmpleado int not null primary key,
nombre varchar(50) not null,
primerApellido varchar(20) not null,
direccion varchar(50) not null,
email varchar(20) not null,
estadoCivil varchar(10) not null,
nombreCompleto as (nombre + ' ' + primerApellido + ' '),
)
go 

create table sucursal(
negocio_id int not null primary key,
direccion varchar(50) not null,
horario int not null,
datosGenerales as (direccion + ' ' + horario + ' '),
)
go  

create table puestoDeEempleado(
producto_id int not null primary key,
nombreProducto varchar(30) not null,
fechaDeCaducidad int not null,
precio int not null, 
existencia varchar(2) not null, 
)
go

create table ticket(
ticket_id int not null primary key,
)
go

