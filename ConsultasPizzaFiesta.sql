use pizzaMaster;

-- Consulta #1 Registra un nuevo cliente
INSERT INTO clients (name, contact , adress)
VALUES ('Juan Pérez', '555-123456', 'Calle Ficticia 123, CiudadCampuslands');

-- Consulta #2 Agregar un nuevo producto (pizza) al menú
INSERT INTO Products (productName, kind)
VALUES ("Pizza-1", "Pizza");

INSERT INTO Pizzas (idProduct ,tamaño, price)
VALUES (1, 'Mediana',100);

-- Consulta #3 Registrar una bebida en el menú
INSERT INTO Products (productName, kind)
VALUES ("Coca-Cola", "Bebida");

INSERT INTO Bebidas (idProduct, price)
VALUES (2 , 20);

-- Consulta #4 Agregar un ingrediente a la base de datos
INSERT INTO Toppings (name, description)
VALUES ("Pepperoni", "Rodajas de pepperoni de la mas alta calidad");

-- Consulta #5 Crear un pedido para un cliente
INSERT INTO Pedidos (idClient, fechaHoraPedido, horaRecogidaPedido, status, total)
VALUES (1, NOW(), "18:00:00", "Listo", 60);

INSERT INTO productsPedido (idPedido, idProduct, cantidad)
VALUES (1, 2, 3);

-- Consulta #6 Agregar Productos a un pedido especifico

INSERT INTO productsPedido (idPedido, idProduct, cantidad)
VALUES (1, 1, 1);

-- Consulta #7 Agregar Ingredientes adicionales a una pizza en un pedido
INSERT INTO ToppingsPizza (idPizza, idTopping)
Values (1, 1);

INSERT INTO ToppingsPedido (idPedido, idPizza, idTopping)
values(1, 1, 1);

-- Consulta #8 Consulta los detalles de un pedido
SELECT p.productName, p.kind 
from Products p 
join productsPedido pp on pp.idPedido = 1
where pp.idPedido = 1;

-- Consulta #9 Alterar el precio de una pizza
UPDATE Pizzas
set price = 80
where price = 100;

-- Consulta #10 alterar la direccion de un cliente
UPDATE clients 
set adress = "Calle Ficticia 123, Charala"
where adress = "Calle Ficticia 123, CiudadCampuslands";

-- Consulta #11 Consultar todos los pedidos de un cliente
select *
from Pedidos
where idClient = 1;

-- Consulta #12 Listar todos los productos disponibles del menù
select *
from Products;

-- Consulta #13 Listar todos los ingredientes disponibles para personalizar una pizza
select *
from Toppings;

-- Consulta # 14 Listar todos los combos que existan
SELECT *
from Combos c;

-- Consulta #15 Buscar pizzas con un precio mayor a 50
select p.price, pp.productName  
from Pizzas p
join Products pp on p.idProduct = pp.idProduct 
where p.price > 50;



