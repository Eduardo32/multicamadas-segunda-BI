create database Atividade2BI;

use Atividade2BI;

-- --------------------------------------------------------------------------
-- TABELA DE PROFESSORES
-- --------------------------------------------------------------------------

create table professores(
    matricula varchar(15) primary key not null,
    nome varchar(50) not null,
    coordenador varchar(50) not null,
    campus varchar(25) not null,
        
    index(nome)
);

-- --------------------------------------------------------------------------
-- TABELA DE LOGIN
-- --------------------------------------------------------------------------

create table login(
    professores_matricula varchar(15) not null,
    senha varchar(50) not null,
    
    foreign key (professores_matricula) references
    professores (matricula)
);

-- --------------------------------------------------------------------------
-- TABELA DE FICHAS
-- --------------------------------------------------------------------------

create table fichas(
    cod_Ficha int(3) auto_increment primary key not null,
    numeroDeAulas int(1) not null,
    professores_matricula varchar(15) not null,
    ano int(4) not null,
    semestre int(1) not null,
    dataAtendimento date not null,
    horaAtendimento time not null,
    bloco varchar(15) not null,
    sala varchar(15) not null,
    atividade varchar(50) not null,
    
    foreign key (professores_matricula) references
    professores (matricula)
);
