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

create table negocio(
negocio_id int not null primary key,
direccion varchar(50) not null,
horario int not null,
datosGenerales as (direccion + ' ' + horario + ' '),
)
go  

create table ticket(
ticket_id int not null primary key,
CONSTRAINT FK_infoNegocio FOREIGN KEY (negocio_id) REFERENCES sucursal (negocio_id),
CONSTRAINT FK_infoEmpleado FOREIGN KEY (numeroDeEmpleado) REFERENCES empleado (numeroDeEmpleado),
CONSTRAINT FK_datosProducto FOREIGN KEY (producto_id) REFERENCES producto (producto_id),
)
go

create table formaDePago(
formaPago_id var(20) not null,
contado int not null,
tarjeta int;
factura int;
)
go

create table producto(
producto_id var(50) not null,
CONSTRAINT FK_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor (proveedor_id),
CONSTRAINT FK_marca FOREIGN KEY (marca_id) REFERENCES marca (marca_id),
CONSTRAINT FK_tamaño FOREIGN KEY (tamaño_id) REFERENCES tamaño (tamaño_id),
CONSTRAINT FK_presentacion FOREIGN KEY (presentacion_id) REFERENCES presentacion (presentacion_id),
CONSTRAINT FK_uniDeMedida FOREIGN KEY (uniDeMedida_id) REFERENCES unidad de medida (uniDeMedida_id),
)
go

create table ticket detalle(
ticketDetalle_id var(20) not null,
CONSTRAINT FK_producto FOREIGN KEY (producto_id) REFERENCES producto (producto_id),
)
go

create table ordenDeCompra(
ordenDeCompra_id int not null,
CONSTRAINT FK_producto FOREIGN KEY (producto_id) REFERENCES producto (producto_id),
)
go

create table proveedor(
proveedor_id int not null,
detalleProveedor var(50) not null;
)
go

create table marca(
marca_id int not null,
detalleMarca var(50) not null;
)
go

create table tamaño(
tamaño_id int not null,
detalleTamaño int not null;
)
go

create table presentacion(
presentacion_id int not null,
detallePresentacion int not null;
)
go

create table unidad de medida(
uniDeMedida_id int not null,
detalleUnidad var(50) not null;
)
go
