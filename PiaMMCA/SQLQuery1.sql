INSERT INTO proveedor (proveedor_id , detalleProveedor)
VALUES (20,'Gamesa');
INSERT INTO proveedor (proveedor_id , detalleProveedor)
VALUES (21,'SuperMarket');
INSERT INTO proveedor (proveedor_id , detalleProveedor)
VALUES (22,'WaterCo');
INSERT INTO proveedor (proveedor_id , detalleProveedor)
VALUES (23,'LasPapas');
INSERT INTO proveedor (proveedor_id , detalleProveedor)
VALUES (24,'PapasMaster');
INSERT INTO proveedor (proveedor_id , detalleProveedor)
VALUES (25,'Pringles');

select * from proveedor

Create Trigger trEliminaSoloUnaCategoria
on marca for delete
As
IF (Select COUNT(*) from Deleted)>1
BEGIN
Rollback Tran
END
go

Create Trigger trEliminaCategoria
on proveedor for delete
As
IF (Select COUNT(*) from Deleted)>1
BEGIN
Rollback Tran
END
go

Create Trigger trEliminaproductos
on producto for delete
As
IF (Select COUNT(*) from Deleted)>1
BEGIN
Rollback Tran
END
go


select  *  from  sys.triggers
go

CREATE PROCEDURE Eliminar_marca
@id int = 0
AS
BEGIN
SET NOCOUNT ON;

DELETE FROM marca WHERE marca_id = @id;
END

CREATE PROCEDURE Eliminar_proveedor
@id int = 0
AS
BEGIN
SET NOCOUNT ON;

DELETE FROM proveedor WHERE proveedor_id = @id;
END

CREATE PROCEDURE Eliminar_producto
@id int = 0
AS
BEGIN
SET NOCOUNT ON;

DELETE FROM producto WHERE producto_id = @id;
END

CREATE PROCEDURE Eliminar_ticket
@id int = 0
AS
BEGIN
SET NOCOUNT ON;

DELETE FROM ticket WHERE ticket_id = @id;
END

CREATE PROCEDURE Eliminar_ticketDetalle
@id int = 0
AS
BEGIN
SET NOCOUNT ON;

DELETE FROM ticketdetalle WHERE ticketDetalle_id = @id;
END

CREATE FUNCTION dbo.producto(@ProductID int)  
RETURNS int   
AS   
BEGIN  
    DECLARE @ret int;  
    SELECT @ret = SUM(producto_id)   
    FROM producto 
    WHERE producto.producto_id = producto.producto_id
        AND producto.producto_id = '6';  
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END