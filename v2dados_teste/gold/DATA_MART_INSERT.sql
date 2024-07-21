#POPULANDO OS DATAMARTS

-- Datamart Customer

INSERT INTO v2gold_sales_customer.customer_datamart (id_cliente, nome, sobrenome, email, telefone, endereco, numero, data_Cadastro)
SELECT id_cliente, nome, sobrenome, email, telefone, endereco, numero, data_Cadastro
FROM v2silver_sales_customer.v1join_sales_customer_silver;

select * from customer_datamart;

-- Datamart Sales

INSERT INTO v2gold_sales_customer.sales_datamart (order_id, id_cliente, product_name, quantity, unit_price, order_date)
SELECT order_id, id_cliente, product_name, quantity, unit_price, order_date
FROM v2silver_sales_customer.v1join_sales_customer_silver;

select * from sales_datamart;
