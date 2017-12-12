--categoria
INSERT INTO categoria VALUES ('Bebidas');
INSERT INTO categoria VALUES ('Doces');
INSERT INTO categoria VALUES ('Roupa');
INSERT INTO categoria VALUES ('Ferramentas');
INSERT INTO categoria VALUES ('Desporto');
INSERT INTO categoria VALUES ('Livros');
INSERT INTO categoria VALUES ('Armas');
INSERT INTO categoria VALUES ('Alcool');
INSERT INTO categoria VALUES ('Sumo');
INSERT INTO categoria VALUES ('Gomas');
INSERT INTO categoria VALUES ('Chocolates');
INSERT INTO categoria VALUES ('Tennis');
INSERT INTO categoria VALUES ('Camisolas');
INSERT INTO categoria VALUES ('Eletricas');
INSERT INTO categoria VALUES ('Mecanicas');
INSERT INTO categoria VALUES ('Romance');
INSERT INTO categoria VALUES ('Thriller');
INSERT INTO categoria VALUES ('Shotguns');
INSERT INTO categoria VALUES ('Rifles');
INSERT INTO categoria VALUES ('Suplementos');
INSERT INTO categoria VALUES ('Equipamentos');

--categoria_simples
INSERT INTO categoria_simples VALUES ('Alcool');
INSERT INTO categoria_simples VALUES ('Sumo');
INSERT INTO categoria_simples VALUES ('Gomas');
INSERT INTO categoria_simples VALUES ('Chocolates');
INSERT INTO categoria_simples VALUES ('Tennis');
INSERT INTO categoria_simples VALUES ('Camisolas');
INSERT INTO categoria_simples VALUES ('Eletricas');
INSERT INTO categoria_simples VALUES ('Mecanicas');
INSERT INTO categoria_simples VALUES ('Romance');
INSERT INTO categoria_simples VALUES ('Thriller');
INSERT INTO categoria_simples VALUES ('Shotguns');
INSERT INTO categoria_simples VALUES ('Rifles');
INSERT INTO categoria_simples VALUES ('Suplementos');
INSERT INTO categoria_simples VALUES ('Equipamentos');

--super_categoria
INSERT INTO super_categoria VALUES ('Bebidas');
INSERT INTO super_categoria VALUES ('Doces');
INSERT INTO super_categoria VALUES ('Roupa');
INSERT INTO super_categoria VALUES ('Ferramentas');
INSERT INTO super_categoria VALUES ('Desporto');
INSERT INTO super_categoria VALUES ('Livros');
INSERT INTO super_categoria VALUES ('Armas');

--constituida
INSERT INTO constituida VALUES ('Roupa','Tennis');
INSERT INTO constituida VALUES ('Roupa','Camisolas');
INSERT INTO constituida VALUES ('Doces','Chocolates');
INSERT INTO constituida VALUES ('Doces','Gomas');
INSERT INTO constituida VALUES ('Bebidas','Alcool');
INSERT INTO constituida VALUES ('Bebidas','Sumo');
INSERT INTO constituida VALUES ('Ferramentas','Eletricas');
INSERT INTO constituida VALUES ('Ferramentas','Mecanicas');
INSERT INTO constituida VALUES ('Desporto','Suplementos');
INSERT INTO constituida VALUES ('Desporto','Equipamentos');
INSERT INTO constituida VALUES ('Livros','Romance');
INSERT INTO constituida VALUES ('Livros','Thriller');
INSERT INTO constituida VALUES ('Armas','Shotguns');
INSERT INTO constituida VALUES ('Armas','Rifles');

--fornecedor
INSERT INTO fornecedor VALUES ('123456789','DrinksInc');
INSERT INTO fornecedor VALUES ('987654321','CandyCorp');
INSERT INTO fornecedor VALUES ('191919191','ClothesSA');
INSERT INTO fornecedor VALUES ('557895799','ToolsComp');
INSERT INTO fornecedor VALUES ('234555671','Nike');
INSERT INTO fornecedor VALUES ('723522525','BooksOC');
INSERT INTO fornecedor VALUES ('435647421','Colt');
INSERT INTO fornecedor VALUES ('689999445','Mutante');
INSERT INTO fornecedor VALUES ('434647756','BMW');
INSERT INTO fornecedor VALUES ('562112122','Razer');
INSERT INTO fornecedor VALUES ('565673333','Mazzetti');

--produtos
INSERT INTO produto VALUES ('0011223344555','Alcool','123456789','bacano',  '2017-12-09');
INSERT INTO produto VALUES ('0014568344555','Rifles','435647421','porreiro','2017-12-09');
INSERT INTO produto VALUES ('1134356224547','Gomas', '987654321','colorido','2017-12-09');
INSERT INTO produto VALUES ('6735758334365','Tennis','234555671','horrivel','2017-12-09');
INSERT INTO produto VALUES ('6445675131111','Suplementos','689999445','bacano','2017-12-09');

--fornecedor secundario
INSERT INTO fornece_sec VALUES ('987654321','0011223344555');
INSERT INTO fornece_sec VALUES ('557895799','6735758334365');
INSERT INTO fornece_sec VALUES ('234555671','0014568344555');
INSERT INTO fornece_sec VALUES ('723522525','6445675131111');
INSERT INTO fornece_sec VALUES ('689999445','1134356224547');
INSERT INTO fornece_sec VALUES ('123456789','0014568344555');
INSERT INTO fornece_sec VALUES ('987654321','0014568344555');
INSERT INTO fornece_sec VALUES ('191919191','0014568344555');
INSERT INTO fornece_sec VALUES ('557895799','0014568344555');
INSERT INTO fornece_sec VALUES ('723522525','0014568344555');
INSERT INTO fornece_sec VALUES ('435647421','0014568344555');
INSERT INTO fornece_sec VALUES ('434647756','0014568344555');
INSERT INTO fornece_sec VALUES ('562112122','0014568344555');
INSERT INTO fornece_sec VALUES ('565673333','0014568344555');

--corredor
INSERT INTO corredor VALUES (123456789,7);
INSERT INTO corredor VALUES (99,10);
INSERT INTO corredor VALUES (54675,4);

--prateleira
INSERT INTO prateleira VALUES (123456789,3,7);
INSERT INTO prateleira VALUES (99,5,9);
INSERT INTO prateleira VALUES (54675,1,4);

--planograma
INSERT INTO planograma VALUES ('0011223344555',123456789,3,7,2,89,13);
INSERT INTO planograma VALUES ('6445675131111',99,5,9,1,47,15);
INSERT INTO planograma VALUES ('0014568344555',54675,1,4,3,19,8);
INSERT INTO planograma VALUES ('1134356224547',54675,1,4,3,33,22);
INSERT INTO planograma VALUES ('6735758334365',123456789,3,7,7,66,17);

--evento_reposicao
INSERT INTO evento_reposicao VALUES ('Alfredo Soares', '2017-12-09 19:06:00');
INSERT INTO evento_reposicao VALUES ('Alfredo Soares', '2017-12-09 19:06:01');
INSERT INTO evento_reposicao VALUES ('Alfredo Soares', '2017-12-09 19:06:02');
INSERT INTO evento_reposicao VALUES ('Henrique Tavares', '2017-12-09 19:04:00');
INSERT INTO evento_reposicao VALUES ('Joao Viegas', '2017-12-09 13:12:00');
INSERT INTO evento_reposicao VALUES ('Joao Viegas', '2017-12-20 13:12:01');

--reposicao
INSERT INTO reposicao VALUES ('0011223344555',123456789,3,7,'Alfredo Soares', '2017-12-09 19:06:00',69);
INSERT INTO reposicao VALUES ('0011223344555',123456789,3,7,'Alfredo Soares', '2017-12-09 19:06:01',69);
INSERT INTO reposicao VALUES ('0011223344555',123456789,3,7,'Alfredo Soares', '2017-12-09 19:06:02',69);
INSERT INTO reposicao VALUES ('6445675131111',99,5,9,'Henrique Tavares', '2017-12-09 19:04:00', 99);
INSERT INTO reposicao VALUES ('0014568344555',54675,1,4,'Joao Viegas', '2017-12-09 13:12:00',20);
INSERT INTO reposicao VALUES ('1134356224547',54675,1,4,'Joao Viegas', '2017-12-20 13:12:01',13);
INSERT INTO reposicao VALUES ('6735758334365',123456789,3,7,'Alfredo Soares', '2017-12-09 19:06:00',88);