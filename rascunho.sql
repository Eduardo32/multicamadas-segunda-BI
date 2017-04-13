create database Atividade2BI;

use Atividade2BI;

create table login(
	cod_Login int(4) primary key auto_increment not null,
    login varchar(50) not null,
    senha varchar(50) not null
);

create table professores(
	login_cod_Login int(4) not null,
    nome varchar(50) not null,
    
    index(nome),
    
    foreign key (login_cod_Login) references
    login (cod_Login)
);

insert into login(login, senha)
value('Eduardo32', '1234');

insert into professores(login_cod_Login, nome)
value(1, 'Paulo Eduardo Costa');

-- --------------------------------------------------------------------------
-- TABELA DE CAMPUS
-- --------------------------------------------------------------------------

create table campus(
	cod_Campus int(2) primary key auto_increment not null,
    nome varchar(25) not null,
    
    index(nome)
);

insert into campus(nome)
values('Abaetetuba'),
('Altamira'),
('Ananindeua'),
('Belém'),
('Bragança'),
('Breves'),
('Cametá'),
('Castanhal'),
('Conceição do Araguaia'),
('Marabá - Industrial'),
('Marabá - Rural'),
('Itaituba'),
('Óbidos'),
('Parauapebas'),
('Paragominas'),
('Santarém'),
('Tucuruí'),
('Vigia');

-- --------------------------------------------------------------------------
-- TABELA DE BLOCOS
-- --------------------------------------------------------------------------

create table blocos(
	cod_Bloco int(2) primary key auto_increment not null,
    nome varchar(10) not null
    
    index (nome);
);
