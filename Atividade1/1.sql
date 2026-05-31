create database blog_Abelardo;
use blog_Abelardo;
create table Usuarios(
id int primary key auto_increment,
nome varchar(100) not null,
email varchar(100) not null unique,
data_cadastro timestamp default current_timestamp 
);

create table publicacoes_blog(
post_id int primary key auto_increment,
titulo varchar(200) not null,
conteudo text not null,
data_publicacao datetime,
autor_id int
);


create table comentarios_post(
comentario_id int primary key auto_increment,
texto_comentario text not null,
data_comentario datetime,
usuario_id int,
post_id int
);


alter table publicacoes_blog
add constraint fk_autor_id
foreign key (autor_id)
references usuarios(id);


alter table comentarios_post
add constraint fk_usuario_id
foreign key (usuario_id)
references usuarios(id);

alter table comentarios_post
add constraint fk_post_id
foreign key (post_id)
references publicacoes_blog(post_id);


alter table comentarios_post
add column resumo varchar(255);


alter  table Usuarios
modify column nome varchar(150);


ALTER TABLE publicacoes_blog
ADD CONSTRAINT chk_titulo
CHECK (LENGTH(titulo) > 5);

alter table usuarios
rename column data_cadastro to data_de_craicao;

alter table usuarios
rename column data_de_craicao to data_de_criacao;

alter table comentarios_post
drop column resumo;

rename table comentarios_post to publicacoes;







