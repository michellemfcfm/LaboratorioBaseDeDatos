create table presentacion(
presentacion_id int not null primary key,
detallePresentacion int not null,
)
go

create table unidadmedida(
uniDeMedida_id int not null primary key,
detalleUnidad varchar(50) not null,
)
go

create table tamaño(
tamaño_id int not null primary key,
detalleTamaño int not null,
)
go


create table marca(
marca_id int not null primary key,
detalleMarca varchar(50) not null,
)
go

create table proveedor(
proveedor_id int not null primary key,
detalleProveedor varchar(50) not null,
)
go

create table producto(
producto_id varchar(20) not null primary key,
proveedor_id int not null,
marca_id int not null,
tamaño_id int not null,
presentacion_id int not null,
uniDeMedida_id int not null,

CONSTRAINT FK_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor (proveedor_id),
CONSTRAINT FK_marca FOREIGN KEY (marca_id) REFERENCES marca (marca_id),
CONSTRAINT FK_tamaño FOREIGN KEY (tamaño_id) REFERENCES tamaño (tamaño_id),
CONSTRAINT FK_presentacion FOREIGN KEY (presentacion_id) REFERENCES presentacion (presentacion_id),
CONSTRAINT FK_uniDeMedida FOREIGN KEY (uniDeMedida_id) REFERENCES unidadmedida (uniDeMedida_id),
)
go

create table ticketdetalle(
ticketDetalle_id varchar(20) not null,
producto_id varchar(20) not null,
CONSTRAINT FK_producto FOREIGN KEY (producto_id) REFERENCES producto (producto_id),
)
go

create table formaDePago(
formaPago_id varchar(20) not null,
contado int not null,
tarjeta int,
factura int,
)
go

create table empleado(
empleado_id int not null primary key,
nombre varchar(50) not null,
primerApellido varchar(20) not null,
edad int not null,
direccion varchar(50) not null,
email varchar(20) not null,
estadoCivil varchar(10) not null,
nombreCompleto as (nombre + ' ' + primerApellido + ' '),

)
go 

create table negocio(
negocio_id int not null primary key,
direccion varchar(50) not null,
horario int not null,
datosGenerales as (direccion + ' ' + horario + ' '),
)
go  


create table ticket(
ticket_id int not null primary key,
negocio_id int not null,
empleado_id int not null,
CONSTRAINT FK_infoNegocio FOREIGN KEY (negocio_id) REFERENCES negocio (negocio_id),
CONSTRAINT FK_infoEmpleado FOREIGN KEY (empleado_id) REFERENCES empleado (empleado_id),

)
go

