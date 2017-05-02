create database Atividade2BI;

use Atividade2BI;

create table professores(
	matricula int(10) primary key not null,
    nome varchar(50) not null,
    
    index(nome)
);

create table login(
    professores_matricula int(10) not null,
    senha varchar(50) not null,
    
    foreign key (professores_matricula) references
    professores (matricula)
);

insert into professores(matricula, nome)
value(2014790020, 'Paulo Eduardo Costa');

insert into login(professor_matricula, senha)
value(2014790020, '1234');

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
