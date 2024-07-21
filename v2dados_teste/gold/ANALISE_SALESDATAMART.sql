#CRIAÇÃO PROCEDURES SALES_DATAMART
use v2gold_sales_customer;

#########################


DELIMITER $$
CREATE PROCEDURE sales_contagem_pedidos_cliente()
BEGIN
    SELECT id_cliente, count(order_id) as Qtnd_Pedido
    FROM sales_datamart
    GROUP BY id_cliente
    ORDER BY Qtnd_Pedido DESC;
END$$
DELIMITER ;

#####################


DELIMITER $$
CREATE PROCEDURE sales_vendas_clientes_compra_unica()
BEGIN
    SELECT id_cliente, COUNT(DISTINCT order_id) AS num_compras
	FROM sales_datamart
	GROUP BY id_cliente
	HAVING num_compras = 1;
END$$
DELIMITER ;

###########################################

DELIMITER $$
CREATE PROCEDURE sales_faturamento_mensal()
BEGIN
	SELECT MONTHNAME(order_date) as Mes, YEAR(order_date) AS Ano,
       SUM(quantity * unit_price) AS Total_Faturamento
FROM sales_datamart
GROUP BY MONTHNAME(order_date), YEAR(order_date)
ORDER BY MES DESC;
END$$
DELIMITER ;

########################################################

DELIMITER $$
CREATE PROCEDURE sales_faturamento_produto()
BEGIN
SELECT 
    product_name,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales
FROM sales_datamart
GROUP BY product_name
ORDER BY total_quantity DESC;
END$$
DELIMITER ;



#########################################################

DELIMITER $$
CREATE PROCEDURE sales_faturamento_total()
BEGIN
	SELECT sum(quantity * unit_price) as Faturamento
	from sales_datamart;
END$$
DELIMITER ;

##########################################################

DELIMITER $$
CREATE PROCEDURE sales_ticket_medio()
BEGIN
SELECT 
    id_cliente,
    COUNT(order_id) AS total_pedidos,
    SUM(quantity * unit_price) AS total_gasto,
    SUM(quantity * unit_price) / COUNT(order_id) AS ticket_medio
FROM sales_datamart
GROUP BY id_cliente
HAVING total_pedidos > 1
ORDER BY ticket_medio DESC;
END$$
DELIMITER ;

#################################


DELIMITER $$
CREATE PROCEDURE sales_curva_produto()
BEGIN 
SELECT product_name, SUM(quantity) as quantidade_total
FROM sales_datamart
GROUP BY product_name
ORDER BY quantidade_total DESC;
END$$
DELIMITER ;
