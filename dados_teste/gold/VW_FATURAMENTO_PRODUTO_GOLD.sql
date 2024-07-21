#########FATURAMENTO_PRODUTO################

CREATE VIEW view_faturamento_produto AS
SELECT 
    product_name,
    SUM(quantity) AS total_quantity,
    SUM(quantity * unit_price) AS total_sales
FROM sales_customer_gold
GROUP BY product_name
ORDER BY total_quantity DESC


select * from view_faturamento_produto;
