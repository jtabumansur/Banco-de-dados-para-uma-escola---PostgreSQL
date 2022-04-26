drop database if exists escola;
-- Create database
CREATE DATABASE escola
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
-- Conecte ao banco recem criado
\c escola;

CREATE TABLE IF NOT EXISTS DEPARTAMENTO (
   	codigo_dpto SERIAL PRIMARY KEY,
	nome varchar(100) NOT NULL
	);
	
CREATE TABLE IF NOT EXISTS CURSO (
   	codigo_CURSO SERIAL PRIMARY KEY,
	nome varchar(100) NOT NULL, 
	descricao varchar(500),
	codigo_dpto int,
	CONSTRAINT CURSO_departamento_fk FOREIGN KEY (codigo_dpto)
		REFERENCES DEPARTAMENTO(codigo_dpto)
	);
	
CREATE TABLE IF NOT EXISTS PROFESSOR (
   	matricula_prof SERIAL PRIMARY KEY,
	nome varchar(100) NOT NULL, 
	endereco varchar(200),
	telefone varchar(30),
	data_nascimento date,
	codigo_dpto int,
	data_contratacao date,
	CONSTRAINT professor_departamento_fk FOREIGN KEY (codigo_dpto)
		REFERENCES DEPARTAMENTO(codigo_dpto)
	);
	
CREATE TABLE IF NOT EXISTS DISCIPLINA (
   	codigo_disc SERIAL PRIMARY KEY,
	nome varchar(100) NOT NULL,
	qtde_creditos int NOT NULL, 
	matricula_prof int,
	CONSTRAINT professor_DISCIPLINA_fk FOREIGN KEY (matricula_prof)
		REFERENCES PROFESSOR(matricula_prof)
	);

CREATE TABLE IF NOT EXISTS PREREQUISITO(
	codigo_disc int NOT NULL,
	codigo_prereq int NOT NULL,
	CONSTRAINT prerequisito_pk_composta PRIMARY KEY (codigo_disc, codigo_prereq),
	CONSTRAINT prerequisito_codigo_disc_fk FOREIGN KEY (codigo_disc)
		REFERENCES DISCIPLINA(codigo_disc)
		ON DELETE CASCADE,
	CONSTRAINT cursa_DISCIPLINA_fk FOREIGN KEY (codigo_disc)
		REFERENCES DISCIPLINA(codigo_disc)
		ON DELETE CASCADE
	);

CREATE TABLE IF NOT EXISTS COMPOE (
   	codigo_CURSO int NOT NULL,
	codigo_disc int NOT NULL,		
	CONSTRAINT compoe_pk_composta PRIMARY KEY (codigo_CURSO, codigo_disc),
	CONSTRAINT compoe_CURSO_fk FOREIGN KEY (codigo_CURSO)
		REFERENCES CURSO(codigo_CURSO)
		ON DELETE CASCADE,
	CONSTRAINT cursa_DISCIPLINA_fk FOREIGN KEY (codigo_disc)
		REFERENCES DISCIPLINA(codigo_disc)
		ON DELETE CASCADE
	);
	
CREATE TABLE IF NOT EXISTS ALUNO (
   	cpf varchar(14) NOT NULL PRIMARY KEY,
	nome varchar(100) NOT NULL, 
	endereco varchar(200),
	telefone varchar(30),
	data_nascimento date	
	);
	
CREATE TABLE IF NOT EXISTS MATRICULA (
	codigo_CURSO int NOT NULL,
   	cpf varchar(14) NOT NULL,
	data_matricula date NOT NULL,	
	CONSTRAINT matricula_pk_composta PRIMARY KEY (cpf,codigo_CURSO),
	CONSTRAINT matricula_aluno_fk FOREIGN KEY (cpf)
		REFERENCES ALUNO(cpf)
		ON DELETE CASCADE,
	CONSTRAINT matricula_CURSO_fk FOREIGN KEY (codigo_CURSO)
		REFERENCES CURSO(codigo_CURSO)
		ON DELETE CASCADE
	);

CREATE TABLE IF NOT EXISTS CURSA (
   	cpf varchar(14) NOT NULL,
	codigo_disc int NOT NULL,		
	CONSTRAINT cursa_pk_composta PRIMARY KEY (cpf, codigo_disc),
	CONSTRAINT cursa_aluno_fk FOREIGN KEY (cpf)
		REFERENCES ALUNO(cpf)
		ON DELETE CASCADE,
	CONSTRAINT cursa_DISCIPLINA_fk FOREIGN KEY (codigo_disc)
		REFERENCES DISCIPLINA(codigo_disc)
		ON DELETE CASCADE
	);
