use v2silver_sales_customer;


SAVEPOINT Savepoint1;

    -- Etapa 1: Inserir ou atualizar registros
    INSERT INTO v1join_sales_customer_silver (id_cliente, nome, sobrenome, email, telefone, endereco, numero, order_id, product_name, quantity, unit_price, order_date, Data_Cadastro)
    SELECT id_cliente, nome, sobrenome, email, telefone, endereco, numero, order_id, product_name, quantity, unit_price, order_date, Data_Cadastro
    FROM v2join_sales_customer_silver
    ON DUPLICATE KEY UPDATE
        id_cliente = VALUES(id_cliente),
        nome = VALUES(nome),
        sobrenome = VALUES(sobrenome),
        email = VALUES(email),
        telefone = VALUES(telefone),
        endereco = VALUES(endereco),
        order_id = VALUES(order_id),
        product_name = VALUES(product_name),
        quantity = VALUES(unit_price),
        order_date = VALUES(order_date),
        Data_Cadastro = VALUES(Data_Cadastro);

-- Desativar modo seguro
SET SQL_SAFE_UPDATES = 0;
-- Executar a operação de DELETE
DELETE FROM v2silver_sales_customer.update_sales_customer_silver
WHERE order_id NOT IN (SELECT order_id FROM v2gold_sales_customer.update_sales_customer_gold);
-- Ativar modo seguro novamente
SET SQL_SAFE_UPDATES = 1;



select count(order_id) from v1join_sales_customer_silver;