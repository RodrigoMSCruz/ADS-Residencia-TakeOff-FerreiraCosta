CREATE DATABASE sfc_bd;

USE sfc-bd;

CREATE TABLE SFC_PEDIDO_VENDA (
    Tipo varchar(3),
    Nota int,
    Datamovim date,
    Fornecedor varchar(14),
    ValorTotal float
);

CREATE TABLE SFC_PEDIDO_VENDA_IT (
    Tipo varchar(3),
    Nota int,
    Datamovim date,
    Fornecedor varchar(14),
    Codigo int,
    Qtd int,
    Precounit float,
    Precototal float,
    ValorTotal float
);

CREATE TABLE PRODUTO (
    Codigo int,
    Descricao varchar(255),
    Preco float
);