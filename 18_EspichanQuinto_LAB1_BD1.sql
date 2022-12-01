SHOW DATABASES;

/*creamos data base llamada dbElectrodomesticos*/
CREATE DATABASE dbElectrodomesticos;

/*llamamos a  uso la data base creada*/
USE dbelectrodomesticos;


/*creamos tabla cliente*/
CREATE TABLE CLIENTE 
(
	CODCLI char(4),  /*Código del cliente*/
    NOMCLI varchar(60), /*Nombre de cliente.*/
    APECLI varchar(80), /*Apellido de cliente.*/
    EMACLI varchar(80), /*Email del cliente*/
    CELCLI char(9), /*Celular del cliente*/
    DIRCLI varchar(70), /*Dirección del cliente.*/
    ESTCLI char(1), /*A y I*/
    CONSTRAINT CODCLI_PK PRIMARY KEY (CODCLI) 
);

/*creamos tabla vendedor*/
CREATE TABLE VENDEDOR 
(
    CODVEND char(4), /*Código del vendedor*/
    NOMBVEND varchar(60), /*Nombre del vendedor*/
    APEVEND varchar(80), /*Apellidos del vendedor*/
    EMAVEND varchar(80), /*Email del vendedor*/
    CELVEND char(9), /*Celular del vendedor*/
    DIRVEND varchar(70), /*Direccion deL vendedor*/
    ESTVEND char(1), /*A y I*/
	CONSTRAINT CODVEND_PK PRIMARY KEY (CODVEND) 
);

/*creamos tabla producto*/
CREATE TABLE PRODUCTO 
(
	CODPRO char(5), /*Código de producto.*/
    DESCPRO varchar(60), /*Descripción del producto*/
    CETPRO char(1), /*Categorías de Producto: Refrigeración (1), Televisores (2), Computadoras (3) y  Teléfono (4*/
    PREPRO decimal(8.2), /*Precio del producto*/
    STOCKPRO int, /*Stock de producto*/
    ESTPRO char(1), /*A y I*/
    CONSTRAINT CODPRO_PK PRIMARY KEY (CODPRO)
);

/*creamos tabla proveedor*/
CREATE TABLE PROVEEDOR
(
    CODPROV char(1), /*Código de proveedor.*/
    RAZSOCPROV varchar(90), /*Razón social del proveedor*/
    RUCPROV varchar(11), /*RUC del proveedor*/
    EMAPROV varchar(70), /*Email del proveedor*/
    ESTPROV char(1), /*A y I*/
    CONSTRAINT CODPROV_PK PRIMARY KEY (CODPROV) 
);

/*creamos tabla venta*/
CREATE TABLE VENTA 
(
    CODVEN char(5), /*Código de venta*/
    NOMVEN datetime, /*Fecha en que se realizó la venta*/
    APEVEN char(4), /*Código del cliente*/
    EMAVEN char(4), /*Código del vendedor.*/
    CELVEN char(1), /*A y I*/
    CONSTRAINT CODVEN_PK PRIMARY KEY (CODVEN) 
);

CREATE TABLE VENTADETALLE 
(
    IDVENDET int, /*Identificador de detalle de venta (auto incrementable)*/
    CODVEN char(5), /*Código de venta*/
    CODPRO char(5), /*Código de producto*/
    CANTPRO int, /*Cantidad de productos a vender.*/
    CONSTRAINT IDVENDET_PK PRIMARY KEY (IDVENDET) 
);

/*creamos tabla compra*/
CREATE TABLE COMPRA
(
    CODCOM char(5), /*Código de compra*/
    FECCOM datetime, /*Fecha en que se realizó la compra*/
    CODVEND char(4), /*Código de Proveedor*/
    CODPROV char(5), /*Código de vendedor*/
    ESTCOM char(1), /*A y I*/
    CONSTRAINT CODCOM_PK PRIMARY KEY (CODCOM) 
);

/*creamos tabla compra detalle*/
CREATE TABLE COMPRADETALLE
(
    IDCOMDET int, /*Identificador de detalle de compra (auto incrementable)*/
    CODCOM char(5), /*Código de venta*/
    CODPRO char(5), /*Código de producto*/
    CANTPRO int, /*Cantidad de productos comprados*/
    CONSTRAINT IDCOMDET_PK PRIMARY KEY (IDCOMDET) 
);

/*Relacion tabla compra y vendedor*/
ALTER TABLE COMPRA
	ADD CONSTRAINT CODVEND_FK 
    FOREIGN KEY (CODVEND) 
    REFERENCES VENDEDOR (CODVEND);
    
/*Relacion tabla compra y proveedor*/
ALTER TABLE COMPRA
	ADD CONSTRAINT CODPROV_FK 
    FOREIGN KEY (CODPROV) 
    REFERENCES PROVEEDOR (CODPROV);

/*Relacion tabla ventadetalle y producto*/

ALTER TABLE VENTADETALLE
	ADD CONSTRAINT CODPRO_FK
    FOREIGN KEY (CODPRO) 
    REFERENCES PRODUCTO (CODPRO);


/*Relacion tabla ventadetalle y venta*/
ALTER TABLE VENTADETALLE
	ADD CONSTRAINT CODVEN_FK
    FOREIGN KEY (CODVEN) 
    REFERENCES VENTA (CODVEN);

/*Relacion tabla COMPRADETALLE y producto*/

ALTER TABLE COMPRADETALLE
	ADD CONSTRAINT CODPRO_FK 
    FOREIGN KEY (CODPRO) 
    REFERENCES PRODUCTO (CODPRO);

/*Relacion tabla COMPRADETALLE y compra*/
ALTER TABLE COMPRADETALLE
	ADD CONSTRAINT CODCOM_FK
    FOREIGN KEY (CODCOM) 
    REFERENCES COMPRA (CODCOM);