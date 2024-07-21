-- CRIANDO OS SCHEMAS DATAMARTS NA GOLD 
use v2gold_sales_customer;

CREATE TABLE customer_datamart (
    id_cliente INT,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    email VARCHAR(50),
    telefone VARCHAR(20),
    endereco VARCHAR(50),
    numero INT,
    Data_Cadastro DATE
);

CREATE TABLE sales_datamart (
    order_id INT PRIMARY KEY,
    id_cliente INT,
    product_name VARCHAR(50),
    quantity INT,
    unit_price FLOAT,
    order_date DATE
);
