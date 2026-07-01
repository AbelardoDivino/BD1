drop database IF NOT EXISTS controle_estoque;
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

