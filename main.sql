drop database if not existis controle_estoque;
create database controle_estoque;
use controle_estoque;

create table cliente(
cliente_id int primary key auto_increment,
nome varchar(50) not null,
cpf_cnpj varchar(20) not null,
telefone varchar(11) not null,
email varchar(50) not null,
endereco varchar(50) not null,
cidade varchar(50) not null,
estado varchar(30) not null,
data_cadastro datetime,
limite_credito int not null,
status varchar(20) not null
);



create table fornecedor(
fornecedor_id int primary key auto_increment,
nome varchar(50) not null,
cpf_cnpj varchar(20) not null,
telefone varchar(20) not null,
email varchar(50) not null,
endereco varchar(50) not null,
cidade varchar(50) not null,
estado varchar(30) not null,
data_cadastro datetime,
status varchar(20) not null
);


create table categoria(
categoria_id int primary key auto_increment,
nome varchar(50) not null,
descricao varchar(50) not null,
status varchar(50) not null
);


create table produto(
produto_id int primary key auto_increment,
codigo varchar(30) not null,
descricao varchar(50) not null,
preco_venda decimal(10,2) not null,
preco_custo decimal(10,2) not null,
estoque_atual int not null,
estoque_minimo int not null,
categoria_id int,
foreign key(categoria_id) references categoria(categoria_id),
unidade_de_medida decimal(10,2) not null,
data_cadastro datetime,
status varchar(20) not null
);

create table funcionario(
funcionario_id int primary key auto_increment,
nome varchar(50) not null,
cnpj varchar(20) not null,
cargo varchar(50) not null,
data_contratacao datetime,
salario decimal(10,2) not null,
telefone varchar(12) not null,
email varchar(60) not null,
status varchar(20) not null
);

create table transportadora(
transportadora_id int primary key auto_increment,
nome varchar(50) not null,
cnpj varchar(20) not null,
telefone varchar(20) not null,
email varchar(50) not null,
status varchar(20) not null
);


create table rota(
rota_id int  primary key auto_increment,
nome varchar(50) not null,
origen varchar(50) not null,
destino varchar(50) not null,
distancia decimal(10,2) not null,
tempo_estimado int not null,
transportadora_id int,
foreign key (transportadora_id) references transportadora(transportadora_id),
status varchar(20) not null
);

create table venda (
venda_id int primary key auto_increment,
data_venda datetime,
cliente_id int not null,
funcionario_id int not null,
foreign key(cliente_id) references cliente(cliente_id),
foreign key(funcionario_id) references funcionario(funcionario_id),
valor_total decimal(10,2) not null,
desconto decimal(10,2) not null,
forma_de_pagamento varchar(20) not null,
status varchar(20) not null,
observacao varchar(50) not null
);

create table item_venda(
 item_venda_id int primary key auto_increment,
 venda_id int not null,
 produto_id int not null,
 foreign key (venda_id) references venda(venda_id),
 foreign key(produto_id) references produto(produto_id),
 quantidade int not null,
 preco_unitario decimal(10,2) not null,
 desconto decimal(10,2) not null,
 valor_total decimal(10,2) not null
);


create table compra(
compra_id int primary key auto_increment,
data_compra datetime,
fornecedor_id int not null,
funcionario_id int not null,
foreign key (fornecedor_id) references fornecedor(fornecedor_id),
foreign key (funcionario_id) references funcionario(funcionario_id),
valor_total decimal(10,2) not null,
status varchar(20) not null,
observacao varchar(50) not null
);

create table item_compra(
item_compra_id int primary key auto_increment,
compra_id int,
foreign key (compra_id) references compra(compra_id),
produto_id int,
foreign key(produto_id) references produto(produto_id) ,
quantidade int not null,
preco_unitario decimal(10,2) not null,
valor_total decimal(10,2) not null
);

create table producao(
producao_id int primary key auto_increment,
data_inicio datetime,
funcionario_id int,
foreign key(funcionario_id) references funcionario(funcionario_id),
status varchar(20) not null,
observacao varchar(50) not null
);


create table item_producao(
item_poducao int primary key auto_increment,
producao_id int,
foreign key (producao_id) references producao(producao_id),
produto_id int,
foreign key (produto_id) references produto(produto_id),
quantidade_planejada int not null,
quantidade_produzida int not null,
custo_unitario int not null,
valor_total int not null
);


create table pedido(
pedido_id int primary key auto_increment,
cliente_id int,
foreign key (cliente_id) references cliente(cliente_id),
funcionario_id int,
foreign key(funcionario_id) references funcionario(funcionario_id),
data_entrega_prevista date not null,
rota_id int,
foreign key (rota_id) references rota(rota_id),
valor_total decimal(10,2) not null,
status varchar(20) not null,
observacao varchar(50) not null
);

create table item_pedido(
item_pedido_id int primary key auto_increment,
pedido_id int,
foreign key (pedido_id) references pedido(pedido_id),
produto_id int,
foreign key  (produto_id) references produto(produto_id),
quantidade int not null,
preco_unitario decimal(10,2) not null,
desconto decimal(10,2) not null,
valor_total decimal(10,2) not null
);






