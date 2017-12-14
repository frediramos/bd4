DROP TABLE IF EXISTS d_produto CASCADE;
DROP TABLE IF EXISTS d_tempo CASCADE;
DROP TABLE IF EXISTS f_reposicoes CASCADE;

CREATE TABLE d_produto (
	cean CHAR(13) NOT NULL UNIQUE,
	categoria VARCHAR(255) NOT NULL,
	nif_fornecedor_primario CHAR(9) NOT NULL,
	CONSTRAINT pk_d_produto PRIMARY KEY (cean)
);

CREATE TABLE d_tempo (
	timeid SERIAL,
	dia NUMERIC(2) NOT NULL,
	mes NUMERIC(2) NOT NULL,
	ano NUMERIC(4) NOT NULL,
	CONSTRAINT pk_d_tempo PRIMARY KEY (timeid)
);

CREATE TABLE f_reposicoes (
	cean CHAR(13) NOT NULL,
	timeid INT NOT NULL,
	unidades INT NOT NULL,
	CONSTRAINT pk_f_reposicoes PRIMARY KEY (cean, timeid),
	CONSTRAINT fk_rep_produto FOREIGN KEY (cean) REFERENCES d_produto(cean) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_rep_tempo FOREIGN KEY (timeid) REFERENCES d_tempo(timeid) ON DELETE CASCADE ON UPDATE CASCADE
);