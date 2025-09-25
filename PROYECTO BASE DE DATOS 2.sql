-- Tabla: Categoria
CREATE TABLE categoria (
  cat_id NUMBER PRIMARY KEY,
  cat_nombre VARCHAR2(100) NOT NULL
);

-- Tabla: Producto
CREATE TABLE producto (
  prod_id NUMBER PRIMARY KEY,
  prod_nombre VARCHAR2(100) NOT NULL,
  prod_precio NUMBER(10, 2) NOT NULL,
  prod_stock NUMBER NOT NULL,
  cat_id NUMBER NOT NULL
);
ALTER TABLE producto ADD (pro_id NUMBER);

-- Relaciones de producto
ALTER TABLE producto ADD FOREIGN KEY (cat_id) REFERENCES categoria(cat_id);

-- Tabla: Cliente
CREATE TABLE cliente (
  cli_id NUMBER PRIMARY KEY,
  cli_nombre VARCHAR2(100) NOT NULL,
  cli_apellido VARCHAR2(100) NOT NULL,
  cli_telefono VARCHAR2(15),
  cli_correo VARCHAR2(100),
  cli_direccion VARCHAR2(255)
);

-- Tabla: Cliente Backup
CREATE TABLE cliente_backup (
  cli_id NUMBER PRIMARY KEY,
  cli_nombre VARCHAR2(100) NOT NULL,
  cli_apellido VARCHAR2(100) NOT NULL,
  cli_telefono VARCHAR2(15),
  cli_correo VARCHAR2(100),
  cli_direccion VARCHAR2(255),
  backup_fecha DATE NOT NULL
);

-- Tabla: Metodo de Pago
CREATE TABLE metodo_pago (
  pago_id NUMBER PRIMARY KEY,
  metodo_pago_nombre VARCHAR2(50) NOT NULL
);

-- Tabla: Venta
CREATE TABLE venta (
  ven_id NUMBER PRIMARY KEY,
  ven_fecha DATE NOT NULL,
  cli_id NUMBER NOT NULL,
  ven_total NUMBER(10, 2) NOT NULL,
  pago_id NUMBER NOT NULL
);

-- Relaciones de venta
ALTER TABLE venta ADD FOREIGN KEY (cli_id) REFERENCES cliente(cli_id);
ALTER TABLE venta ADD FOREIGN KEY (pago_id) REFERENCES metodo_pago(pago_id);

-- Tabla: Detalle Venta
CREATE TABLE detalle_venta (
  det_id NUMBER PRIMARY KEY,
  ven_id NUMBER NOT NULL,
  prod_id NUMBER NOT NULL,
  det_cantidad NUMBER NOT NULL,
  det_subtotal NUMBER(10, 2) NOT NULL
);

-- Relaciones de detalle venta
ALTER TABLE detalle_venta ADD FOREIGN KEY (ven_id) REFERENCES venta(ven_id);
ALTER TABLE detalle_venta ADD FOREIGN KEY (prod_id) REFERENCES producto(prod_id);

-- Tabla: Proveedor
CREATE TABLE proveedor (
  pro_id NUMBER PRIMARY KEY,
  pro_nombre VARCHAR2(100) NOT NULL,
  pro_telefono VARCHAR2(15),
  pro_correo VARCHAR2(100),
  pro_direccion VARCHAR2(255)
);

-- Tabla: Respaldo de Venta
CREATE TABLE backup_venta (
  ven_id NUMBER PRIMARY KEY,
  ven_fecha DATE NOT NULL,
  cli_id NUMBER NOT NULL,
  ven_total NUMBER(10, 2) NOT NULL,
  pago_id NUMBER NOT NULL,
  backup_fecha DATE NOT NULL
);

-- Relaciones de backup_venta
ALTER TABLE backup_venta ADD FOREIGN KEY (cli_id) REFERENCES cliente(cli_id);
ALTER TABLE backup_venta ADD FOREIGN KEY (pago_id) REFERENCES metodo_pago(pago_id);

-- Tabla: Respaldo de Detalle de Venta
CREATE TABLE backup_detalle_venta (
  det_id NUMBER PRIMARY KEY,
  ven_id NUMBER NOT NULL,
  prod_id NUMBER NOT NULL,
  det_cantidad NUMBER NOT NULL,
  det_subtotal NUMBER(10, 2) NOT NULL,
  backup_fecha DATE NOT NULL
);


-- Relaciones de backup_detalle_venta
ALTER TABLE backup_detalle_venta ADD FOREIGN KEY (ven_id) REFERENCES backup_venta(ven_id);
ALTER TABLE backup_detalle_venta ADD FOREIGN KEY (prod_id) REFERENCES producto(prod_id);



--poblar la BD  

-- Poblar la tabla Categoria
INSERT INTO categoria (cat_id, cat_nombre) VALUES (1, 'Computadoras');
INSERT INTO categoria (cat_id, cat_nombre) VALUES (2, 'Teléfonos');
INSERT INTO categoria (cat_id, cat_nombre) VALUES (3, 'Accesorios');
INSERT INTO categoria (cat_id, cat_nombre) VALUES (4, 'Electrodomésticos');

-- Poblar la tabla Producto
INSERT INTO producto (prod_id, prod_nombre, prod_precio, prod_stock, cat_id) VALUES (1, 'Laptop HP', 1200.50, 10, 1);
INSERT INTO producto (prod_id, prod_nombre, prod_precio, prod_stock, cat_id) VALUES (2, 'Laptop Dell', 1400.00, 8, 1);
INSERT INTO producto (prod_id, prod_nombre, prod_precio, prod_stock, cat_id) VALUES (3, 'iPhone 14', 999.99, 15, 2);
INSERT INTO producto (prod_id, prod_nombre, prod_precio, prod_stock, cat_id) VALUES (4, 'Samsung Galaxy S23', 799.99, 12, 2);
INSERT INTO producto (prod_id, prod_nombre, prod_precio, prod_stock, cat_id) VALUES (5, 'Audífonos Bluetooth', 49.99, 50, 3);
INSERT INTO producto (prod_id, prod_nombre, prod_precio, prod_stock, cat_id) VALUES (6, 'Teclado Mecánico', 79.99, 25, 3);
INSERT INTO producto (prod_id, prod_nombre, prod_precio, prod_stock, cat_id) VALUES (7, 'Microondas LG', 150.00, 20, 4);
INSERT INTO producto (prod_id, prod_nombre, prod_precio, prod_stock, cat_id) VALUES (8, 'Refrigerador Samsung', 899.99, 5, 4);
INSERT INTO producto (prod_id, prod_nombre, prod_precio, prod_stock, cat_id) VALUES (9, 'Mouse Gamer', 39.99, 40, 3);
INSERT INTO producto (prod_id, prod_nombre, prod_precio, prod_stock, cat_id) VALUES (10, 'Monitor ASUS', 200.00, 10, 1);

-- Poblar la tabla Cliente
INSERT INTO cliente (cli_id, cli_nombre, cli_apellido, cli_telefono, cli_correo, cli_direccion) 
VALUES (1, 'Juan', 'Pérez', '1234567890', 'juan.perez@gmail.com', 'Av. Central 123');
INSERT INTO cliente (cli_id, cli_nombre, cli_apellido, cli_telefono, cli_correo, cli_direccion) 
VALUES (2, 'Ana', 'Gómez', '0987654321', 'ana.gomez@gmail.com', 'Calle Norte 456');
INSERT INTO cliente (cli_id, cli_nombre, cli_apellido, cli_telefono, cli_correo, cli_direccion) 
VALUES (3, 'Carlos', 'Ramírez', '1112223334', 'carlos.ramirez@gmail.com', 'Plaza Sur 789');
INSERT INTO cliente (cli_id, cli_nombre, cli_apellido, cli_telefono, cli_correo, cli_direccion) 
VALUES (4, 'María', 'López', '5556667778', 'maria.lopez@gmail.com', 'Zona Centro 101');

-- Poblar la tabla Metodo de Pago
INSERT INTO metodo_pago (pago_id, metodo_pago_nombre) VALUES (1, 'Efectivo');
INSERT INTO metodo_pago (pago_id, metodo_pago_nombre) VALUES (2, 'Tarjeta de Crédito');
INSERT INTO metodo_pago (pago_id, metodo_pago_nombre) VALUES (3, 'Transferencia Bancaria');

-- Poblar la tabla Venta
INSERT INTO venta (ven_id, ven_fecha, cli_id, ven_total, pago_id) 
VALUES (1, TO_DATE('2024-12-01', 'YYYY-MM-DD'), 1, 1249.99, 2);
INSERT INTO venta (ven_id, ven_fecha, cli_id, ven_total, pago_id) 
VALUES (2, TO_DATE('2024-12-02', 'YYYY-MM-DD'), 2, 150.00, 1);
INSERT INTO venta (ven_id, ven_fecha, cli_id, ven_total, pago_id) 
VALUES (3, TO_DATE('2024-12-03', 'YYYY-MM-DD'), 3, 200.00, 3);
INSERT INTO venta (ven_id, ven_fecha, cli_id, ven_total, pago_id) 
VALUES (4, TO_DATE('2024-12-04', 'YYYY-MM-DD'), 4, 1499.99, 2);

-- Poblar la tabla Detalle Venta
INSERT INTO detalle_venta (det_id, ven_id, prod_id, det_cantidad, det_subtotal) 
VALUES (1, 1, 1, 1, 1200.50);
INSERT INTO detalle_venta (det_id, ven_id, prod_id, det_cantidad, det_subtotal) 
VALUES (2, 1, 5, 1, 49.99);
INSERT INTO detalle_venta (det_id, ven_id, prod_id, det_cantidad, det_subtotal) 
VALUES (3, 2, 7, 1, 150.00);
INSERT INTO detalle_venta (det_id, ven_id, prod_id, det_cantidad, det_subtotal) 
VALUES (4, 3, 10, 1, 200.00);
INSERT INTO detalle_venta (det_id, ven_id, prod_id, det_cantidad, det_subtotal) 
VALUES (5, 4, 2, 1, 1400.00);
INSERT INTO detalle_venta (det_id, ven_id, prod_id, det_cantidad, det_subtotal) 
VALUES (6, 4, 9, 1, 99.99);

-- Poblar la tabla Proveedor
INSERT INTO proveedor (pro_id, pro_nombre, pro_telefono, pro_correo, pro_direccion) 
VALUES (1, 'Proveedor A', '1111111111', 'contacto@proveedora.com', 'Parque Industrial 101');
INSERT INTO proveedor (pro_id, pro_nombre, pro_telefono, pro_correo, pro_direccion) 
VALUES (2, 'Proveedor B', '2222222222', 'ventas@proveedorb.com', 'Zona Comercial 202');

--------------------------------------------------------------------------------------------------------------
/*PROCEDIMIENTOS*/

/*1*/

/*CONSULTAR LOS DATOS POR CATEGORIA*/


CREATE OR REPLACE PROCEDURE consultar_productos_por_categoria AS
BEGIN
    FOR r IN (
        SELECT c.cat_nombre AS Categoria,p.prod_nombre AS Producto, p.prod_precio AS Precio,p.prod_stock AS Stock
        FROM  producto p JOIN categoria c ON p.cat_id = c.cat_id
        ORDER BY c.cat_nombre, p.prod_nombre
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Categoría: ' || r.Categoria ||  ' | Producto: ' || r.Producto ||  ' | Precio: ' || r.Precio || 
                             ' | Stock: ' || r.Stock);
    END LOOP;
END consultar_productos_por_categoria;

EXEC consultar_productos_por_categoria;


/*2*/

/*MOSTRAR PRODUCTO POR PROVEEDOR*/


/*Asignar proveedores a los productos*/

UPDATE producto SET pro_id = 1 WHERE prod_id IN (1, 2, 10); -- Proveedor A
UPDATE producto SET pro_id = 2 WHERE prod_id IN (3, 4, 7, 8); -- Proveedor B

CREATE OR REPLACE PROCEDURE ver_productos_por_proveedor (p_proveedor_id IN NUMBER) AS
BEGIN
    FOR r IN (
        SELECT p.prod_nombre AS Producto,p.prod_precio AS Precio,p.prod_stock AS Stock,pr.pro_nombre AS Proveedor
        FROM producto p JOIN proveedor pr ON p.pro_id = pr.pro_id
        WHERE p.pro_id = p_proveedor_id
        ORDER BY p.prod_nombre
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Proveedor: ' || r.Proveedor ||    ' | Producto: ' || r.Producto || 
                             ' | Precio: ' || r.Precio || 
                             ' | Stock: ' || r.Stock);
    END LOOP;
END ver_productos_por_proveedor;


EXEC ver_productos_por_proveedor(1);
EXEC ver_productos_por_proveedor(2);

/*3*/
/*MOSTRAR TOTALES POR METODO DE PAGO*/
CREATE OR REPLACE PROCEDURE mostrar_totales_por_metodo_pago IS
    CURSOR c_metodos IS
        SELECT mp.pago_id, mp.metodo_pago_nombre, NVL(SUM(v.ven_total), 0) AS total_ventas
        FROM metodo_pago mp
        LEFT JOIN venta v ON mp.pago_id = v.pago_id
        GROUP BY mp.pago_id, mp.metodo_pago_nombre;

    v_pago_id metodo_pago.pago_id%TYPE;
    v_nombre metodo_pago.metodo_pago_nombre%TYPE;
    v_total NUMBER(10, 2);
BEGIN
    FOR metodo IN c_metodos LOOP
        v_pago_id := metodo.pago_id;
        v_nombre := metodo.metodo_pago_nombre;
        v_total := metodo.total_ventas;
        DBMS_OUTPUT.PUT_LINE('Método de Pago: ' || v_nombre || ' (ID: ' || v_pago_id || '), Total Ventas: ' || v_total);
    END LOOP;
END mostrar_totales_por_metodo_pago;


BEGIN
    mostrar_totales_por_metodo_pago;
END;
----------------------------------------------------------------------------------------------------------------------------
/*FUNCIONES*/

/*1*/

/*ven_id de una venta y devolverá el precio total calculado sumando los subtotales de los productos en la venta.*/

CREATE OR REPLACE FUNCTION obtener_precio_total_venta (p_ven_id IN NUMBER) 
RETURN NUMBER IS
    v_precio_total NUMBER(10, 2);
BEGIN
    SELECT SUM(det_subtotal)
    INTO v_precio_total
    FROM detalle_venta
    WHERE ven_id = p_ven_id;

    RETURN v_precio_total;
END obtener_precio_total_venta;

SELECT obtener_precio_total_venta(1) FROM dual;
SELECT obtener_precio_total_venta(2) FROM dual;
SELECT obtener_precio_total_venta(3) FROM dual;

select * from VENTA;
/*2*/

/*Obtener el nombre Y apelldido del cliente*/

CREATE OR REPLACE FUNCTION obtener_nombre_cliente (p_cli_id IN NUMBER) 
RETURN VARCHAR2 IS
    v_nombre_cliente VARCHAR2(200);
BEGIN
    SELECT cli_nombre || ' ' || cli_apellido
    INTO v_nombre_cliente
    FROM cliente
    WHERE cli_id = p_cli_id;

    RETURN v_nombre_cliente;
END obtener_nombre_cliente;

SELECT obtener_nombre_cliente(1) FROM dual;
SELECT obtener_nombre_cliente(2) FROM dual;

SELECT * FROM CLIENTE

/*3*/

/*Calcular el total de ventas por proveedor*/
CREATE OR REPLACE FUNCTION total_ventas_por_proveedor (p_pro_id IN NUMBER)
RETURN NUMBER IS
    v_total_ventas NUMBER(10, 2);
BEGIN
    -- Sumar las ventas por proveedor
    SELECT SUM(dv.det_subtotal)
    INTO v_total_ventas
    FROM detalle_venta dv
    JOIN producto p ON dv.prod_id = p.prod_id
    JOIN venta v ON dv.ven_id = v.ven_id
    WHERE p.pro_id = p_pro_id;

    -- Si no hay ventas, asignar 0
    IF v_total_ventas IS NULL THEN
        v_total_ventas := 0;
    END IF;

    RETURN v_total_ventas;
END total_ventas_por_proveedor;

SELECT total_ventas_por_proveedor(1) FROM dual;
SELECT total_ventas_por_proveedor(2) FROM dual;

SELECT * FROM PROVEEDOR

--------------------------------------------------------------------------------------------------------------
/*TRIGGERS*/

/*1*/

/*CREAR UNA COPIA PARA LOS NUEVOS CLIENTES INSERTADOS DE LA TABLA CLIENTES*/
CREATE OR REPLACE TRIGGER trig_cliente_backup
AFTER INSERT ON cliente
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
    INSERT INTO cliente_backup (cli_id, cli_nombre, cli_apellido, cli_telefono, cli_correo, cli_direccion, backup_fecha)
    VALUES (:NEW.cli_id, :NEW.cli_nombre, :NEW.cli_apellido, :NEW.cli_telefono, :NEW.cli_correo, :NEW.cli_direccion, SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Nuevo cliente registrado y respaldado.');
END;

INSERT INTO cliente (cli_id, cli_nombre, cli_apellido, cli_telefono, cli_correo, cli_direccion) 
VALUES (5, 'Sofía', 'Martínez', '9876543210', 'sofia.martinez@gmail.com', 'Avenida Siempre Viva 742');

SELECT * FROM CLIENTE;
SELECT * FROM cliente_backup;
-----------------------------------------------------------------------------------------------------------------------------
/*2*/

/*ACTUALIZAR LOS PRECIOS DE PRODUCTOS*/

CREATE TABLE producto_seguimiento (
  id_seguimiento NUMBER GENERATED BY DEFAULT AS IDENTITY,
  cod_producto CHAR(5),
  usuario VARCHAR2(30),
  fecha_actualizacion DATE,
  precio_anterior NUMBER(9,2),
  precio_nuevo NUMBER(9,2),
  PRIMARY KEY (id_seguimiento)
);

CREATE OR REPLACE TRIGGER trg_producto_seguimiento
AFTER UPDATE OF prod_precio ON producto
FOR EACH ROW
BEGIN
  INSERT INTO producto_seguimiento (cod_producto, usuario, fecha_actualizacion, precio_anterior, precio_nuevo)
  VALUES (:OLD.prod_id, USER, SYSDATE, :OLD.prod_precio, :NEW.prod_precio);
  DBMS_OUTPUT.PUT_LINE('El usuario ' || USER || ' ha actualizado el precio del producto ' || 
    :OLD.prod_id || ' de ' || :OLD.prod_precio || ' a ' || :NEW.prod_precio || ' el ' || SYSDATE);
END;

/*ACTUALIZAR*/
UPDATE producto SET prod_precio = 1600.00 WHERE prod_id = 1;
UPDATE producto SET prod_precio = 1500.00 WHERE prod_id = 2;
UPDATE producto SET prod_precio = 60.00 WHERE prod_id = 5;

SELECT * FROM PRODUCTO;
SELECT * FROM PRODUCTO_SEGUIMIENTO;

select * from PROVEEDOR

----------------------------------------------------------------------------------------------------------------------------------------

/*3*/

/*COPIA DE BACKUP DE LA TABLA VENTA*/

CREATE OR REPLACE TRIGGER trig_ventas_backup
AFTER INSERT ON venta
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
    INSERT INTO BACKUP_VENTA (ven_id, ven_fecha, cli_id, ven_total, pago_id, backup_fecha)
    VALUES (:NEW.ven_id, :NEW.ven_fecha, :NEW.cli_id, :NEW.ven_total, :NEW.pago_id, SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Nueva venta registrada y respaldada.');
END;

INSERT INTO venta (ven_id, ven_fecha, cli_id, ven_total, pago_id) 
VALUES (5, TO_DATE('2024-12-05', 'YYYY-MM-DD'), 3, 300.00, 1);

INSERT INTO venta (ven_id, ven_fecha, cli_id, ven_total, pago_id) 
VALUES (6, TO_DATE('2024-12-06', 'YYYY-MM-DD'), 4, 450.75, 2);

SELECT * FROM venta;
SELECT * FROM BACKUP_VENTA;










