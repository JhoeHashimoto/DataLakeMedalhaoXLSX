create schema sales_customer_gold;

use sales_customer_gold;


select * from sales_customer_gold;
select count(order_id) from sales_customer_gold;

##############VIEW_FATURAMENTO_MENSAL#########################

CREATE VIEW vw_faturamento_mensal AS
SELECT MONTH(order_date) AS Mes,
       SUM(quantity * unit_price) AS Total_Faturamento
FROM sales_customer_gold
GROUP BY Mes;


###############EXIBINDO A VIEW##################################
Select * from vw_faturamento_mensal;