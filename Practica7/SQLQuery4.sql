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

create table tama�o(
tama�o_id int not null primary key,
detalleTama�o int not null,
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
tama�o_id int not null,
presentacion_id int not null,
uniDeMedida_id int not null,

CONSTRAINT FK_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor (proveedor_id),
CONSTRAINT FK_marca FOREIGN KEY (marca_id) REFERENCES marca (marca_id),
CONSTRAINT FK_tama�o FOREIGN KEY (tama�o_id) REFERENCES tama�o (tama�o_id),
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

ALTER TABLE presentacion
DROP COLUMN detallePresentacion;

ALTER TABLE presentacion
ADD detallePresentacion varchar(15);

ALTER TABLE tama�o
DROP COLUMN detalleTama�o;

ALTER TABLE presentacion
ADD detalleTama�o varchar(20);

INSERT INTO presentacion (presentacion_id, detallePresentacion)
VALUES (01,'embotellado');
INSERT INTO presentacion (presentacion_id, detallePresentacion)
VALUES (02,'bolsa');
INSERT INTO presentacion (presentacion_id, detallePresentacion)
VALUES (03,'plastico');
INSERT INTO presentacion (presentacion_id, detallePresentacion)
VALUES (04,'caja');
INSERT INTO presentacion (presentacion_id, detallePresentacion)
VALUES (05,'paquete');

SELECT*FROM presentacion;

INSERT INTO unidadmedida (uniDeMedida_id , detalleUnidad)
VALUES (1,'kilogramos');
INSERT INTO unidadmedida (uniDeMedida_id , detalleUnidad)
VALUES (2,'litros');
INSERT INTO unidadmedida (uniDeMedida_id , detalleUnidad)
VALUES (3,'mililitros');
INSERT INTO unidadmedida (uniDeMedida_id , detalleUnidad)
VALUES (4,'kilogramos');

SELECT*FROM unidadmedida;
UPDATE unidadmedida  
    SET detalleUnidad = 'miligramos'
	
SELECT*FROM unidadmedida;
DELETE FROM unidadmedida
    WHERE detalleUnidad = 'miligramos'

SELECT*FROM unidadmedida;

INSERT INTO unidadmedida (uniDeMedida_id , detalleUnidad)
VALUES (1,'kilogramos');

INSERT INTO unidadmedida (uniDeMedida_id , detalleUnidad)
VALUES (2,'litros');
INSERT INTO unidadmedida (uniDeMedida_id , detalleUnidad)
VALUES (3,'mililitros');
INSERT INTO unidadmedida (uniDeMedida_id , detalleUnidad)
VALUES (4,'miligramos');

SELECT*FROM unidadmedida;

INSERT INTO tama�o ( tama�o_id, detalleTama�o)
VALUES (1,'chico');

ALTER TABLE presentacion
DROP COLUMN detalleTama�o;
ALTER TABLE presentacion
ADD detalleTama�o varchar(20);

ALTER TABLE tama�o
ADD detalleTama�o varchar(20);

INSERT INTO tama�o ( tama�o_id, detalleTama�o)
VALUES (2,'chico');
INSERT INTO tama�o ( tama�o_id, detalleTama�o)
VALUES (3,'mediano');
INSERT INTO tama�o ( tama�o_id, detalleTama�o)
VALUES (4,'grande');
SELECT*FROM tama�o;
DROP TABLE tama�o;

SELECT*FROM tama�o;

INSERT INTO marca ( marca_id, detalleMarca)
VALUES (01,'Sabritas');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (02,'Pringles');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (03,'Gamesa');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (04,'Vero');

SELECT*FROM marca;
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (05,'Bimbo');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (06,'quaker');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (07,'Marinela');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (08,'Pepsi');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (09,'Coca Cola');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (10,'Pe�afiel');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (11,'Del Valle');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (12,'Ferrero');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (13,'Kosher');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (14,'Ricolino');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (15,'Lucas');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (16,'Sonrics');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (17,'Bubbalob');

SELECT*FROM marca;
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (18,'Barrilitos');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (19,'Big Cola');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (20,'Drew Mountain');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (21,'sidral mundet');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (22,'Electrolit');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (23,'Alpura');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (24,'Lala');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (25,'Sello Rojo');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (27,'Boing');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (28,'Gatorade');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (29,'Red Bull');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (30,'Bonafont');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (31,'Be Light');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (32,'Fuze Tea');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (33,'Epura');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (34,'Valle Fruit');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (35,'Monster');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (36,'Yakult');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (37,'Natures Factory');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (38,' A De Coco');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (39,'Valley Foods');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (40,'Ami');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (41,'Boost');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (42,' Pau-Pau ');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (43,'Cafe Ole');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (44,'Soyapac');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (45,'Frut');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (46,'Vida');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (47,'Bonafont Kids');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (48,' Ciel');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (49,' Calahua');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (50,'Pureza Vital');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (51,'Fuze');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (52,'Powerade');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (53,'Bonafont Levite ');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (54,'Be Light H2o');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (55,'Starbucks');
INSERT INTO marca ( marca_id, detalleMarca)
VALUES (56,'Levite');
