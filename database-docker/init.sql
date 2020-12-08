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
--insertamos cosas de prueba
insert into usuarios(dni, nombre, apellidos, clave, correo, telefono, fecha_nacimiento, tipo_usuario)
VALUES ('39488522Y', 'Pepe', 'Flores Martinez', '1234567891011', 'pepe@gmail.com', 566891222, '2006-09-17', 'normal');
insert into usuarios(dni, nombre, apellidos, clave, correo, telefono, fecha_nacimiento, tipo_usuario, tarjeta)
VALUES ('96586512A', 'Julio', 'Ju Martinez', 'xxdc', 'pepe@gmail.com', 566891222, '2006-09-17', 'normal',
        '00A0-56DF-4S5C-33K7');
INSERT INTO catalogo_tienda(id, nombre, categoria, descripcion, precio)
VALUES ('cam1', 'Camiseta 1', 'ropa', 'camiseta mazo cómoda', 12.3);
INSERT INTO catalogo_tienda(id, nombre, categoria, descripcion, precio)
VALUES ('diskfirm', 'Disco firmado 1', 'disco', 'Disco firmado a elegir', 20.0);
insert into existencias(tipo)
values ('cam1');
insert into existencias(tipo)
values ('cam1');
insert into existencias(tipo, usuario)
values ('cam1', '39488522Y');
insert into existencias(tipo)
values ('diskfirm');
insert into existencias(tipo)
values ('diskfirm');
insert into existencias(tipo, usuario)
values ('diskfirm', '39488522Y');