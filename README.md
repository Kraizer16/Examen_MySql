# Examen_MySql
## Sistema de Gestión de Pizzeria "PizzaMaster"
### Descripción General
Este proyecto está diseñado para gestionar una pizzería llamada "PizzaMaster". La base de datos tiene como objetivo organizar y almacenar la información relacionada con los clientes, productos (pizzas, bebidas y toppings), pedidos, combos y pagos. La estructura de la base de datos se ha diseñado utilizando tablas interrelacionadas para asegurar que se mantenga la integridad de los datos, permitiendo operaciones eficientes en cuanto a la gestión de pedidos, productos y clientes.

Este documento proporciona una descripción general de las consultas SQL implementadas en el proyecto, incluyendo la lógica detrás de ellas, y cómo interactúan con la base de datos para realizar las operaciones requeridas.

#### Instrucciones de Ejecución
#### Requisitos Previos:
#### MySQL o MariaDB instalado en tu sistema.
Acceso a una consola MySQL o a una herramienta de gestión como phpMyAdmin, MySQL Workbench, o DBeaver.
Pasos para ejecutar el archivo SQL:
Crear la base de datos:

Abre tu consola de MySQL o herramienta de gestión.

Conéctate a tu servidor MySQL usando el siguiente comando:

bash
Copiar
mysql -u root -p
Ingresa tu contraseña de MySQL cuando se te pida.

Luego, ejecuta el siguiente comando para crear la base de datos pizzaMaster:


CREATE DATABASE IF NOT EXISTS pizzaMaster;
USE pizzaMaster;
Ejecutar las consultas de creación de tablas:

Copia y pega las consultas SQL para crear las tablas (detalladas en el proyecto) en tu consola de MySQL.
Ejecuta las consultas para crear las tablas necesarias, como clients, products, Pedidos, etc.
Ejecutar las consultas de inserción de datos:

Una vez que las tablas estén creadas, puedes ejecutar las consultas de inserción para registrar datos en las tablas, como la información de los clientes, productos, pedidos, etc.
Consultar la base de datos:

Después de ejecutar las inserciones, puedes comenzar a realizar consultas sobre la base de datos para obtener información como detalles de pedidos, productos, combos, etc.
Consultas SQL y Explicación
### Consulta #1: Registrar un nuevo cliente

INSERT INTO clients (name, contact, adress)
VALUES ('Juan Pérez', '555-123456', 'Calle Ficticia 123, CiudadCampuslands');
Explicación: Esta consulta inserta un nuevo cliente en la tabla clients. Se proporciona el nombre, contacto y dirección del cliente. La columna idClient es auto-incremental, por lo que no es necesario especificarla.

### Consulta #2: Agregar un nuevo producto (pizza) al menú

INSERT INTO Products (productName, kind)
VALUES ("Pizza-1", "Pizza");

INSERT INTO Pizzas (idProduct, tamaño, price)
VALUES (1, 'Mediana', 100);
Explicación: Primero se inserta un nuevo producto en la tabla Products, con el nombre "Pizza-1" y tipo "Pizza". Luego, se registra un producto en la tabla Pizzas, asociando el producto con un tamaño "Mediana" y un precio de 100.

### Consulta #3: Registrar una bebida en el menú

INSERT INTO Products (productName, kind)
VALUES ("Coca-Cola", "Bebida");

INSERT INTO Bebidas (idProduct, price)
VALUES (2 , 20);
Explicación: En esta consulta, se agrega una bebida al menú. Primero, se inserta un producto en la tabla Products con el nombre "Coca-Cola" y tipo "Bebida". Luego, se inserta en la tabla Bebidas el precio de la bebida.

### Consulta #4: Agregar un ingrediente a la base de datos

INSERT INTO Toppings (name, description)
VALUES ("Pepperoni", "Rodajas de pepperoni de la mas alta calidad");
Explicación: Se inserta un nuevo topping o ingrediente en la tabla Toppings, con el nombre "Pepperoni" y una descripción de alta calidad.

### Consulta #5: Crear un pedido para un cliente

INSERT INTO Pedidos (idClient, fechaHoraPedido, horaRecogidaPedido, status, total)
VALUES (1, NOW(), "18:00:00", "Listo", 60);

INSERT INTO productsPedido (idPedido, idProduct, cantidad)
VALUES (1, 2, 3);
Explicación: Aquí se crea un nuevo pedido para el cliente con idClient 1. Se inserta la fecha y hora del pedido, junto con la hora de recogida y el estado inicial ("Listo"). Luego, en la tabla productsPedido, se asocia el pedido con un producto (en este caso, la bebida Coca-Cola con idProduct 2), y se indica que se han pedido 3 unidades.

### Consulta #6: Agregar productos a un pedido específico

INSERT INTO productsPedido (idPedido, idProduct, cantidad)
VALUES (1, 1, 1);
Explicación: Esta consulta agrega un producto adicional (en este caso, la pizza con idProduct 1) al pedido con idPedido 1. Se indica que la cantidad de pizzas solicitadas es 1.

### Consulta #7: Agregar ingredientes adicionales a una pizza en un pedido

INSERT INTO ToppingsPizza (idPizza, idTopping)
VALUES (1, 1);

INSERT INTO ToppingsPedido (idPedido, idPizza, idTopping)
VALUES (1, 1, 1);
Explicación: Se agrega un topping ("Pepperoni") a la pizza con idPizza 1. Luego, se registra el topping en el pedido correspondiente.

### Consulta #8: Consultar los detalles de un pedido

SELECT p.productName, p.kind 
FROM Products p 
JOIN productsPedido pp ON pp.idPedido = 1
WHERE pp.idPedido = 1;
Explicación: Esta consulta devuelve los productos relacionados con un pedido específico. Se usa un JOIN entre las tablas Products y productsPedido para obtener los detalles del producto solicitado en el pedido con idPedido 1.

### Consulta #9: Alterar el precio de una pizza

UPDATE Pizzas
SET price = 80
WHERE price = 100;
Explicación: Aquí se actualiza el precio de todas las pizzas que actualmente tienen un precio de 100, cambiándolas a un nuevo precio de 80.

### Consulta #10: Alterar la dirección de un cliente

UPDATE clients
SET adress = "Calle Ficticia 123, Charala"
WHERE adress = "Calle Ficticia 123, CiudadCampuslands";
Explicación: Esta consulta actualiza la dirección de un cliente que tenía una dirección específica.

### Consulta #11: Consultar todos los pedidos de un cliente

SELECT *
FROM Pedidos
WHERE idClient = 1;
Explicación: Esta consulta selecciona todos los pedidos realizados por el cliente con idClient 1.

### Consulta #12: Listar todos los productos disponibles en el menú

SELECT *
FROM Products;
Explicación: Se obtienen todos los productos (pizzas, bebidas, etc.) que están disponibles en el menú.

### Consulta #13: Listar todos los ingredientes disponibles para personalizar una pizza

SELECT *
FROM Toppings;
Explicación: Esta consulta muestra todos los ingredientes disponibles para agregar a una pizza.

### Consulta #14: Listar todos los combos que existan

SELECT *
FROM Combos c;
Explicación: Se consultan todos los combos disponibles en el menú.

### Consulta #15: Buscar pizzas con un precio mayor a 50

SELECT p.price, pp.productName
FROM Pizzas p
JOIN Products pp ON p.idProduct = pp.idProduct
WHERE p.price > 50;
Explicación: Se buscan todas las pizzas que tienen un precio mayor a 50. Se utiliza un JOIN para obtener tanto el nombre del producto como su precio.

## Conclusión
Este sistema de gestión de pedidos para una pizzería permite registrar información sobre clientes, productos, pedidos, ingredientes y pagos de forma estructurada. Las consultas proporcionadas permiten realizar una variedad de operaciones sobre la base de datos, como la inserción de datos, la modificación de precios y la consulta de detalles específicos de productos y pedidos.

Asegúrese de ejecutar las consultas en orden y verificar la integridad de los datos para garantizar el buen funcionamiento del sistema.
