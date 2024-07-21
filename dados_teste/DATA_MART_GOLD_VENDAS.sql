#####################DATAMART VENDAS GOLD##########################

-- FATURAMENTO TOTAL
SELECT sum(quantity * unit_price) as Faturamento
from update_sales_customer_gold;


-- CONTAGEM PEDIDO POR CLIENTE
SELECT 
	id_cliente,
    nome, 
    COUNT(order_id) AS contagem_pedido
FROM update_sales_customer_gold
GROUP BY nome, id_cliente;

-- FATURAMENTO MES
select count(order_id) from update_sales_customer_gold;


-- FATURAMENTO PRODUTO TOTAL
SELECT 
    product_name,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales
FROM update_sales_customer_gold
GROUP BY product_name
ORDER BY total_quantity DESC;

-- FATURAMENTO PRODUTO MES

SELECT 
    product_name,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales,
    MONTH(order_date)
FROM update_sales_customer_gold
GROUP BY product_name, order_date
ORDER BY total_quantity DESC;

-- TICKET MÉDIO
SELECT 
    id_cliente,
    CONCAT(nome, ' ', sobrenome) AS nome_completo,
    COUNT(order_id) AS total_pedidos,
    SUM(quantity * unit_price) AS total_gasto,
    SUM(quantity * unit_price) / COUNT(order_id) AS ticket_medio
FROM update_sales_customer_gold
GROUP BY id_cliente, nome_completo
HAVING total_pedidos > 1
ORDER BY ticket_medio DESC;




