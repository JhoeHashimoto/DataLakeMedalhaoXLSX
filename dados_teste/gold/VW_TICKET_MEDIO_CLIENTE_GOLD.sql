CREATE VIEW vw_ticket_medio_cliente_gold AS
SELECT 
    id_cliente,
    CONCAT(nome, ' ', sobrenome) AS nome_completo,
    COUNT(order_id) AS total_pedidos,
    SUM(quantity * unit_price) AS total_gasto,
    SUM(quantity * unit_price) / COUNT(order_id) AS ticket_medio
FROM sales_customer_gold
GROUP BY id_cliente, nome_completo
HAVING total_pedidos > 1
ORDER BY ticket_medio DESC;
###############

SELECT * FROM vw_ticket_medio_cliente_gold;