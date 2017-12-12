DROP TABLE IF EXISTS categoria CASCADE;
DROP TABLE IF EXISTS categoria_simples CASCADE;
DROP TABLE IF EXISTS super_categoria CASCADE;
DROP TABLE IF EXISTS super_categoria CASCADE;
DROP TABLE IF EXISTS constituida CASCADE;
DROP TABLE IF EXISTS produto CASCADE;
DROP TABLE IF EXISTS fornecedor CASCADE;
DROP TABLE IF EXISTS fornece_sec CASCADE;
DROP TABLE IF EXISTS corredor CASCADE;
DROP TABLE IF EXISTS prateleira CASCADE;
DROP TABLE IF EXISTS planograma CASCADE;
DROP TABLE IF EXISTS evento_reposicao CASCADE;
DROP TABLE IF EXISTS reposicao CASCADE;

CREATE TABLE categoria(
	nome VARCHAR(255) NOT NULL UNIQUE,
	CONSTRAINT pk_categoria PRIMARY KEY(nome));

CREATE TABLE categoria_simples(
	nome VARCHAR(255) NOT NULL UNIQUE,
	CONSTRAINT pk_categoria_simples PRIMARY KEY(nome),	
	CONSTRAINT fk_categoria_simples FOREIGN KEY(nome) REFERENCES categoria(nome) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE super_categoria(
	nome VARCHAR(255) NOT NULL UNIQUE,
	CONSTRAINT pk_super_categoria PRIMARY KEY(nome),
	CONSTRAINT fk_super_categoria FOREIGN KEY(nome) REFERENCES categoria(nome) ON DELETE CASCADE ON UPDATE CASCADE);	

CREATE TABLE constituida(
	super_categoria VARCHAR(255) NOT NULL,
	categoria VARCHAR(255) NOT NULL UNIQUE,
	CONSTRAINT pk_constituida PRIMARY KEY(super_categoria, categoria),
	CONSTRAINT fk_super FOREIGN KEY(super_categoria) REFERENCES super_categoria(nome) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_categoria FOREIGN KEY(categoria) REFERENCES categoria(nome) ON DELETE CASCADE ON UPDATE CASCADE);		
	
CREATE TABLE fornecedor(
	nif CHAR(9) NOT NULL UNIQUE,
	nome VARCHAR(200) NOT NULL,
	CONSTRAINT pk_fornecedor PRIMARY KEY(nif));
	
CREATE TABLE produto(
	ean CHAR(13) NOT NULL UNIQUE,
	categoria VARCHAR(255),
	nif CHAR(9) NOT NULL,
	design VARCHAR(255),
	data DATE NOT NULL,
	CONSTRAINT pk_produto PRIMARY KEY(ean),
	CONSTRAINT fk_categoria FOREIGN KEY(categoria) REFERENCES categoria(nome) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_forn FOREIGN KEY(nif) REFERENCES fornecedor(nif) ON DELETE CASCADE ON UPDATE CASCADE);
	
CREATE TABLE fornece_sec(
	nif CHAR(9) NOT NULL,
	ean CHAR(13) NOT NULL,
	CONSTRAINT pk_forn_sec 	PRIMARY KEY(nif, ean),
	CONSTRAINT fk_fornecedor FOREIGN KEY(nif) REFERENCES fornecedor(nif) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_produto FOREIGN KEY(ean) REFERENCES produto(ean) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE corredor(
	nro INT NOT NULL UNIQUE,
	largura	SMALLINT NOT NULL,
	CONSTRAINT pk_corredor PRIMARY KEY(nro));

CREATE TABLE prateleira(
	nro INT NOT NULL UNIQUE,
	lado SMALLINT NOT NULL,
	altura SMALLINT	NOT NULL,
	CONSTRAINT pk_prateleira PRIMARY KEY(nro,lado,altura),
	CONSTRAINT fk_corredor FOREIGN KEY(nro) REFERENCES corredor(nro) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE planograma(
	ean CHAR(13) NOT NULL UNIQUE,
	nro INT NOT NULL,
	lado SMALLINT NOT NULL,
	altura SMALLINT NOT NULL,
	face  SMALLINT NOT NULL,
	unidades INT NOT NULL,
	loc INT NOT NULL,
	CONSTRAINT pk_planograma PRIMARY KEY(ean,nro,lado,altura),
	CONSTRAINT fk_planogram_produto FOREIGN KEY(ean) REFERENCES produto(ean) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_planogram_prateleira FOREIGN KEY(nro,lado,altura) REFERENCES prateleira(nro,lado,altura) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE evento_reposicao(
	operador VARCHAR(255) NOT NULL,
	instante TIMESTAMP NOT NULL,
	CONSTRAINT pk_evento_reposicao PRIMARY KEY(operador, instante),
	CHECK (instante <= CURRENT_TIMESTAMP));


CREATE TABLE reposicao(
	ean CHAR(13) NOT NULL,
	nro INT NOT NULL,
	lado SMALLINT NOT NULL,
	altura SMALLINT NOT NULL,
	operador VARCHAR(255) NOT NULL,
	instante TIMESTAMP NOT NULL,
	unidades INT NOT NULL,
	CONSTRAINT pk_reposicao PRIMARY KEY(ean,nro,lado,altura,operador,instante),
	CONSTRAINT fk_planogram_reposicao FOREIGN KEY(ean,nro,lado,altura) REFERENCES planograma(ean,nro,lado,altura) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_evento_reposicao FOREIGN KEY(operador, instante) REFERENCES evento_reposicao(operador, instante) ON DELETE CASCADE ON UPDATE CASCADE);
