DROP INDEX IF EXISTS nif_index;
DROP INDEX IF EXISTS category_index;
DROP INDEX IF EXISTS ean_forn_index;
DROP INDEX IF EXISTS ean_produto_index;

--aliena 1.
CREATE INDEX nif_index ON fornecedor USING HASH(nif);
CREATE INDEX category_index ON produto USING HASH(categoria);

--alinea 2.
CREATE INDEX ean_forn_index ON fornecedor USING HASH(ean);
CREATE INDEX ean_produto_index ON produto(ean);