create table empleado(
numeroDeEmpleado int not null primary key,
nombre varchar(50) not null,
primerApellido varchar(20) not null,
edad int not null,
direccion varchar(50) not null,
email varchar(20) not null,
estadoCivil varchar(10) not null,
nombreCompleto as (nombre + ' ' + primerApellido + ' '),
CONSTRAINT mayorEdad CHECK (edad>=18)
CONSTRAINT estadoCivil CHECK (soltero or soltera),
)
go 

create table sucursal(
negocio_id int not null primary key,
direccion varchar(50) not null,
horario int not null,
datosGenerales as (direccion + ' ' + horario + ' '),
)
go  

create table producto(
producto_id int not null primary key,
nombreProducto varchar(30) not null,
fechaDeCaducidad int not null,
precio int not null, 
existencia varchar(2) not null, 
CONSTRAINT precio CHECK (precio>=0)
)
go

create table puestoEmpleado(
empleado_Puesto var(20) not null,
tiempoTrabajando int not null,
CONSTRAINT tiempoTrajando CHECK (tiempoTrabajando>0)
)
go


create table ticket(
ticket_id int not null primary key,
CONSTRAINT FK_infoNegocio FOREIGN KEY (negocio_id) REFERENCES sucursal (negocio_id),
CONSTRAINT FK_infoEmpleado FOREIGN KEY (numeroDeEmpleado) REFERENCES empleado (numeroDeEmpleado),
CONSTRAINT FK_datosProducto FOREIGN KEY (producto_id) REFERENCES producto (producto_id),
CONSTRAINT FK_puestoEmpleado FOREIGN KEY (empleado_Puesto) REFERENCES puestoEmpleado (empleado_Puesto),
)
go

 