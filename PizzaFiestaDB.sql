-- Creación de la base de datos
create database if not exists pizzaMaster;
use pizzaMaster;

-- Creación de las tablas
create table if not exists clients(
	idClient int primary key auto_increment,
	name varchar(50) not null,
	contact varchar(15) not null unique,
	adress varchar(50) not null
);

create table if not exists Products(
	idProduct int primary key auto_increment,
	productName varchar(30) not null,
	kind enum("Pizza", "Bebida") not null,
	description varchar(100)
);

create table if not exists Toppings(
	idTopping int primary key auto_increment,
	name varchar(30) not null,
	description varchar(100)
);

create table if not exists Combos(
	idCombo int primary key auto_increment,
	nameCombo varchar(50) not null,
	description varchar(100),
	priceCombo double not null
);

create table if not exists Pedidos(
	idPedido int primary key auto_increment,
	idClient int,
	fechaHoraPedido datetime not null,
	horaRecogidaPedido time not null,
	status enum("Pendiente", "En preparación", "listo") default "Pendiente",
	total double not null,
	foreign key (idClient) references clients(idClient)
);

create table if not exists productsPedido(
	idPedido int,
	idProduct int,
	cantidad int not null,
	extraPrice double,
	foreign key (idPedido) references Pedidos(idPedido),
	foreign key (idProduct) references Products(idProduct),
	primary key (idPedido, idProduct)
);

create table if not exists Pizzas(
	idPizza int primary key auto_increment,
	idProduct int,
	tamaño enum("Pequeña", "Mediana", "Grande") not null,
	price double,
	foreign key (idProduct) references Products(idProduct)
);

create table if not exists ToppingsPizza(
	idPizza int,
	idTopping int,
	foreign key (idPizza) references Pizzas(idPizza),
	foreign key (idTopping) references Toppings(idTopping),
	primary key (idPizza, idTopping)
);

create table if not exists ToppingsPedido(
	idPedido int,
	idPizza int,
	idTopping int,
	foreign key (idPizza) references Pizzas(idPizza),
	foreign key (idTopping) references Toppings(idTopping),
	foreign key (idPedido) references Pedidos(idPedido),
	primary key (idPedido, idPizza, idTopping)
);

create table if not exists PedidoCombos(
	idCombo int,
	idPedido int,
	cantidadCombos int not null,
	foreign key (idCombo) references Combos(idCombo),
	foreign key (idPedido) references Pedidos(idPedido),
	primary key (idCombo, idPedido)
);

create table if not exists Pays(
	idPay int primary key auto_increment,
	idPedido int,
	totalPrice double not null,
	fechaHoraPay datetime not null
);

create table if not exists Bebidas(
	idBebida int primary key auto_increment,
	idProduct int,
	price double not null,
	foreign key (idProduct) references Products(idProduct)
);













































