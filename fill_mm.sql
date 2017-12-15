CREATE OR REPLACE FUNCTION load_time()
RETURNS VOID AS $$
DECLARE full_date TIMESTAMP;
BEGIN
	full_date := '2010-01-01 00:00:00';
	WHILE full_date < '2019-01-01 00:00:00' LOOP
		INSERT INTO d_tempo (dia, mes, ano) VALUES (date_part('day', full_date), date_part('month', full_date), date_part('year', full_date));
		full_date := full_date + INTERVAL '1 day';
	END LOOP;
END;

$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION load_products()
RETURNS VOID AS $$
DECLARE prod produto%rowtype;
BEGIN
	FOR prod IN SELECT * FROM produto LOOP
		INSERT INTO d_produto (cean, categoria, nif_fornecedor_primario) VALUES (prod.ean, prod.categoria, prod.nif);
	END LOOP;
END;

$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION load_reposicoes()
RETURNS VOID AS $$
DECLARE prod CURSOR FOR SELECT * FROM produto NATURAL JOIN planograma;
BEGIN
	FOR prod_reg IN prod LOOP
		INSERT INTO f_reposicoes(cean,timeid,unidades) VALUES 
			((SELECT cean FROM d_produto WHERE d_produto.cean = prod_reg.ean),
			 (SELECT timeid FROM d_tempo WHERE 	d_tempo.dia = date_part('day',prod_reg.data)
			 	 AND d_tempo.mes = date_part('month',prod_reg.data) 
			 	 AND d_tempo.ano = date_part('year',prod_reg.data)),
			 (SELECT prod_reg.unidades));
	
	END LOOP;
		 
END;

$$ LANGUAGE plpgsql;