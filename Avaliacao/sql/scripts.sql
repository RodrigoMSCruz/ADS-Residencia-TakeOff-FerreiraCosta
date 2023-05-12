CREATE DATABASE sfc_bd;

USE sfc_bd;

DROP DATABASE sfc_bd;

CREATE TABLE SFC_PEDIDO_VENDA (
    Tipo varchar(3),
    Nota INT IDENTITY(1,1) PRIMARY KEY,
	Datamovim date,
    Fornecedor varchar(14),
);

DROP TABLE SFC_PEDIDO_VENDA;

CREATE TABLE SFC_PEDIDO_VENDA_IT (
    Tipo varchar(3),
    Nota int,
    Datamovim date,
    Fornecedor varchar(14),
    Codigo int,
    Qtd int,
    Precounit float,
    Precototal float,
	CONSTRAINT FK_SFC_PEDIDO_VENDA_IT_SFC_PEDIDO_VENDA FOREIGN KEY (Nota) REFERENCES SFC_PEDIDO_VENDA (Nota),
	CONSTRAINT FK_SFC_PEDIDO_VENDA_IT_SFC_PRODUTO FOREIGN KEY (Codigo) REFERENCES SFC_PRODUTOS_ESTOQUE (Codigo)
);

DROP TABLE SFC_PEDIDO_VENDA_IT;

CREATE TABLE SFC_PRODUTOS_ESTOQUE (
    Codigo int primary key,
    Descricao varchar(255),
    Preco float
);

DROP TABLE SFC_PRODUTOS_ESTOQUE;





INSERT INTO SFC_PRODUTOS_ESTOQUE (Codigo, Descricao, Preco) VALUES (100, 'Faqueiro Tramotina', 359.6);
INSERT INTO SFC_PRODUTOS_ESTOQUE (Codigo, Descricao, Preco) VALUES (200, 'Torneira 3/4 Tigre', 30.9);
INSERT INTO SFC_PRODUTOS_ESTOQUE (Codigo, Descricao, Preco) VALUES (220, 'Geladeira', 2000);
INSERT INTO SFC_PRODUTOS_ESTOQUE (Codigo, Descricao, Preco) VALUES (360, 'Cadeira Tramontina', 120.99);
INSERT INTO SFC_PRODUTOS_ESTOQUE (Codigo, Descricao, Preco) VALUES (400, 'Chaleira', 200);
INSERT INTO SFC_PRODUTOS_ESTOQUE (Codigo, Descricao, Preco) VALUES (500, 'TV Samsung 52', 1899);
INSERT INTO SFC_PRODUTOS_ESTOQUE (Codigo, Descricao, Preco) VALUES (600, 'Piso Elizabeth', 60);

SELECT Codigo, Descricao, Preco from SFC_PRODUTOS_ESTOQUE;

INSERT INTO SFC_PEDIDO_VENDA_IT (Tipo, Nota, Datamovim, Fornecedor, Codigo, Qtd, Precounit, Precototal)
VALUES ('VD', 1, getDate(), '10230480001960', 600, 20, 60, 1200);

INSERT INTO SFC_PEDIDO_VENDA_IT (Tipo, Nota, Datamovim, Fornecedor, Codigo, Qtd, Precounit, Precototal)
VALUES ('VD', 1, getDate(), '10230480001960', 200, 3, 30.9, 92.7);

SELECT Tipo, Nota, Datamovim, Fornecedor FROM SFC_PEDIDO_VENDA


SELECT A.Tipo, A.Nota, A.Datamovim, A.Fornecedor, A.Codigo, B.Descricao, A.Qtd, A.Precounit, A.Precototal
FROM SFC_PEDIDO_VENDA_IT AS A
INNER JOIN SFC_PRODUTOS_ESTOQUE AS B ON A.Codigo = B.Codigo
WHERE Nota = 1;

SELECT  Fornecedor, Codigo, Qtd, Precounit, Precototal 
FROM SFC_PEDIDO_VENDA_IT
WHERE Nota = 1;

SELECT  * 
FROM SFC_PEDIDO_VENDA_IT

DELETE FROM SFC_PEDIDO_VENDA_IT WHERE Nota = 4 AND Codigo = 200

SELECT A.Fornecedor, A.Codigo, B.Descricao, A.Qtd, A.Precounit, A.Precototal 
FROM SFC_PEDIDO_VENDA_IT AS A INNER JOIN SFC_PRODUTOS_ESTOQUE AS B ON A.Codigo = B.Codigo

SELECT SUM(Precototal) AS SOMA FROM SFC_PEDIDO_VENDA_IT WHERE Nota = 1;


SELECT A.Tipo, A.Nota, A.Datamovim, A.Fornecedor, B.Precototal
FROM SFC_PEDIDO_VENDA AS A
INNER JOIN SFC_PEDIDO_VENDA_IT AS B ON A.Nota = B.Nota;

SELECT A.Nota, Sum(B.Precototal)
FROM SFC_PEDIDO_VENDA AS A
INNER JOIN SFC_PEDIDO_VENDA_IT AS B ON A.Nota = B.Nota
GROUP BY A.Nota;

SELECT DISTINCT A.Tipo, A.Nota, A.Datamovim AS 'Data de Movimento' , A.Fornecedor, C.Total AS 'Valor Total'
FROM SFC_PEDIDO_VENDA AS A
LEFT JOIN SFC_PEDIDO_VENDA_IT AS B ON A.Nota = B.Nota
LEFT JOIN (
	SELECT A.Nota, Sum(B.Precototal) As Total
	FROM SFC_PEDIDO_VENDA AS A
	INNER JOIN SFC_PEDIDO_VENDA_IT AS B ON A.Nota = B.Nota
	GROUP BY A.Nota
	) AS C ON C.Nota = A.Nota