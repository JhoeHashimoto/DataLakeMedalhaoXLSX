USE v2silver_sales_customer;

-- Desativar modo seguro
SET SQL_SAFE_UPDATES = 0;

-- INSERINDO NOVAS LINHAS QUE NÃO ESTÃO NO TARGET
INSERT INTO v1join_sales_customer_silver (id_cliente, nome, sobrenome, email, telefone, endereco, numero, order_id, product_name, quantity, unit_price, order_date, Data_Cadastro)
    SELECT source.id_cliente, source.nome, source.sobrenome, source.email, source.telefone, source.endereco, source.numero, source.order_id, source.product_name, source.quantity, source.unit_price, source.order_date, source.Data_Cadastro
    FROM v2join_sales_customer_silver AS source
    LEFT JOIN v1join_sales_customer_silver AS target ON source.order_id = target.order_id
    WHERE target.order_id IS NULL;


-- ATUALIZANDO REGISTROS EXISTENTES
UPDATE v1join_sales_customer_silver AS target
JOIN v2join_sales_customer_silver AS source ON target.order_id = source.order_id
SET 
    target.id_cliente = source.id_cliente,
    target.nome = source.nome, 
    target.sobrenome = source.sobrenome,
    target.email = source.email,
    target.telefone = source.telefone,
    target.endereco = source.endereco,
    target.numero = source.numero,
    target.product_name = source.product_name,
    target.quantity = source.quantity,
    target.unit_price = source.unit_price,
    target.order_date = source.order_date,
    target.Data_Cadastro = source.Data_Cadastro;


-- Delete rows in the target that do not exist in the source
DELETE target
FROM v1join_sales_customer_silver AS target
LEFT JOIN v2join_sales_customer_silver AS source ON target.order_id = source.order_id
WHERE source.order_id IS NULL;


-- Ativar modo seguro novamente
SET SQL_SAFE_UPDATES = 1;


SELECT Max(Data_Cadastro) FROM v1join_sales_customer_silver;
