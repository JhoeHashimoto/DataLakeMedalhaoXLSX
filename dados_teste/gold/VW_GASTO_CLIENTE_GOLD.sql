#####################VIEW_GASTO_CLIENTE#####################
CREATE VIEW vw_gasto_cliente AS
SELECT 
    id_cliente, 
    nome, 
    SUM(quantity * unit_price) AS total_gasto
FROM sales_customer_gold
GROUP BY id_cliente, nome;


SELECT * FROM vw_gasto_cliente;