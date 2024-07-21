CREATE view vw_contagem_pedidos_cliente_gold as
SELECT 
	id_cliente,
    nome, 
    COUNT(order_id) AS contagem_pedido
FROM sales_customer_gold
GROUP BY nome, id_cliente;


select * from vw_contagem_pedidos_cliente_gold;

