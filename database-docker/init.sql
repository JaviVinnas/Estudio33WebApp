--borramos si existen estas tablas
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS catalogo_tienda;
DROP TABLE IF EXISTS existencias;
DROP SEQUENCE IF EXISTS seq_id_elemento_tienda;
--creamos la secuencia para los ids de las existencias
create sequence seq_id_elemento_tienda;
--creamos tablas
CREATE TABLE usuarios
(
    dni              char(9)      not null primary key,
    nombre           varchar(40)  not null,
    apellidos        varchar(100) not null,
    clave            varchar(100) not null,
    correo           varchar(100) not null,
    telefono         integer      not null,
    fecha_nacimiento date         not null,
    tipo_usuario     varchar(100) not null,
    tarjeta          varchar(100),
    pin_tarjeta      integer
);

CREATE TABLE catalogo_tienda
(
    id          varchar(10) not null primary key,
    nombre      varchar(40) not null,
    categoria   varchar(40) not null,
    descripcion varchar(150),
    precio      float

);

CREATE TABLE existencias
(
    id      integer default nextval('seq_id_elemento_tienda') not null,
    tipo    varchar(10)                                       not null,
    usuario char(9),
    vendida boolean default false,
    primary key (id, tipo),
    foreign key (usuario) references usuarios (dni) on delete restrict on update cascade,
    foreign key (tipo) references catalogo_tienda (id) on delete restrict on update cascade
);





-----------insertamos datos de prueba

--creamos dos usuarios
insert into usuarios(dni, nombre, apellidos, clave, correo, telefono, fecha_nacimiento, tipo_usuario)
VALUES ('39488522Y', 'Pepe', 'Flores Martinez', '1234567891011', 'pepe@gmail.com', 566891222, '2006-09-17', 'normal');
insert into usuarios(dni, nombre, apellidos, clave, correo, telefono, fecha_nacimiento, tipo_usuario, tarjeta)
VALUES ('96586512A', 'Julio', 'Ju Martinez', 'xxd4hs3654s4hdc', 'pepe@gmail.com', 566891222, '2006-09-17', 'normal',
        '00A0-56DF-4S5C-33K7');

--creamos 5 productos diferentes
INSERT INTO catalogo_tienda(id, nombre, categoria, descripcion, precio)
VALUES ('cam', 'Camiseta con logo', 'ropa', 'Camiseta de algodón con el logo del estudio. Unisex-talla única', 8.5);
INSERT INTO catalogo_tienda(id, nombre, categoria, descripcion, precio)
VALUES ('exitos', 'Grandes éxitos del estudio', 'musica', 'LP de larga duración con los temas más famosos del estudio', 20.0);
INSERT INTO catalogo_tienda(id, nombre, categoria, descripcion, precio)
VALUES ('chapa', 'Chapa con logo', 'accesorios', 'Chapa de latón con el logo del estudio', 2.0);
INSERT INTO catalogo_tienda(id, nombre, categoria, descripcion, precio)
VALUES ('visera', 'Visera firmada', 'ropa', 'Gorra firmada por nuestro fundador: Alberto García', 5.0);
INSERT INTO catalogo_tienda(id, nombre, categoria, descripcion, precio)
VALUES ('sudadera', 'Sudadera con logo', 'ropa', 'Sudadera con el logo del estudio. 100% algodón.  Unisex-talla única', 17.5);

--insertamos 10 existencias de cada producto
INSERT INTO existencias(tipo) values ('cam');
INSERT INTO existencias(tipo) values ('cam');
INSERT INTO existencias(tipo) values ('cam');
INSERT INTO existencias(tipo) values ('cam');
INSERT INTO existencias(tipo) values ('cam');
INSERT INTO existencias(tipo) values ('cam');
INSERT INTO existencias(tipo) values ('cam');
INSERT INTO existencias(tipo) values ('cam');
INSERT INTO existencias(tipo) values ('cam');
INSERT INTO existencias(tipo) values ('cam');
INSERT INTO existencias(tipo) values ('exitos');
INSERT INTO existencias(tipo) values ('exitos');
INSERT INTO existencias(tipo) values ('exitos');
INSERT INTO existencias(tipo) values ('exitos');
INSERT INTO existencias(tipo) values ('exitos');
INSERT INTO existencias(tipo) values ('exitos');
INSERT INTO existencias(tipo) values ('exitos');
INSERT INTO existencias(tipo) values ('exitos');
INSERT INTO existencias(tipo) values ('exitos');
INSERT INTO existencias(tipo) values ('exitos');
INSERT INTO existencias(tipo) values ('chapa');
INSERT INTO existencias(tipo) values ('chapa');
INSERT INTO existencias(tipo) values ('chapa');
INSERT INTO existencias(tipo) values ('chapa');
INSERT INTO existencias(tipo) values ('chapa');
INSERT INTO existencias(tipo) values ('chapa');
INSERT INTO existencias(tipo) values ('chapa');
INSERT INTO existencias(tipo) values ('chapa');
INSERT INTO existencias(tipo) values ('chapa');
INSERT INTO existencias(tipo) values ('chapa');
INSERT INTO existencias(tipo) values ('visera');
INSERT INTO existencias(tipo) values ('visera');
INSERT INTO existencias(tipo) values ('visera');
INSERT INTO existencias(tipo) values ('visera');
INSERT INTO existencias(tipo) values ('visera');
INSERT INTO existencias(tipo) values ('visera');
INSERT INTO existencias(tipo) values ('visera');
INSERT INTO existencias(tipo) values ('visera');
INSERT INTO existencias(tipo) values ('visera');
INSERT INTO existencias(tipo) values ('visera');
INSERT INTO existencias(tipo) values ('sudadera');
INSERT INTO existencias(tipo) values ('sudadera');
INSERT INTO existencias(tipo) values ('sudadera');
INSERT INTO existencias(tipo) values ('sudadera');
INSERT INTO existencias(tipo) values ('sudadera');
INSERT INTO existencias(tipo) values ('sudadera');
INSERT INTO existencias(tipo) values ('sudadera');
INSERT INTO existencias(tipo) values ('sudadera');
INSERT INTO existencias(tipo) values ('sudadera');
INSERT INTO existencias(tipo) values ('sudadera');
