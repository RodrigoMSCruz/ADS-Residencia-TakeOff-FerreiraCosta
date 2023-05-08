CREATE DATABASE sfc_bd;

USE sfc_bd;
DROP DATABASE sfc_bd;

CREATE TABLE SFC_PEDIDO_VENDA (
    Tipo varchar(3),
    Nota INT IDENTITY(1,1) PRIMARY KEY,
	Datamovim date,
    Fornecedor varchar(14),
    ValorTotal float
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

select * from SFC_PRODUTOS_ESTOQUE;

INSERT INTO SFC_PEDIDO_VENDA (Tipo, Datamovim, Fornecedor, ValorTotal)
VALUES('VD', getDate(), '10230480001960', 0);

select * from SFC_PEDIDO_VENDA

DELETE FROM SFC_PEDIDO_VENDA_IT

select * from SFC_PEDIDO_VENDA_IT;