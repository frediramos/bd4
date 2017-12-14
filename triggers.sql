CREATE OR REPLACE FUNCTION check_fornecedor_secundario()
RETURNS TRIGGER AS $BODY$
BEGIN
	IF NEW.nif IN (SELECT nif FROM fornece_sec WHERE ean = NEW.ean) THEN

		RAISE EXCEPTION '% ja e fornecedor secundario de %', NEW.nif, NEW.ean;

	END IF;
	RETURN NEW;
END;

$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER check_fornecedor_secundario_insert BEFORE INSERT OR UPDATE ON produto
FOR EACH ROW EXECUTE PROCEDURE check_fornecedor_secundario();


CREATE OR REPLACE FUNCTION check_fornecedor_primario()
RETURNS TRIGGER AS $BODY$
BEGIN
	IF NEW.nif IN (SELECT nif FROM produto WHERE ean = NEW.ean) THEN

		RAISE EXCEPTION '% ja e fornecedor primario de %', NEW.nif, NEW.ean;

	END IF;
	RETURN NEW;
END;

$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER check_fornecedor_primario_insert BEFORE INSERT OR UPDATE ON fornece_sec
FOR EACH ROW EXECUTE PROCEDURE check_fornecedor_primario();
