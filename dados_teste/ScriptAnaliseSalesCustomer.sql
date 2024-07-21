use sales_customer_refined;


/*FATURAMENTO TOTAL*/
SELECT SUM(unit_price * quantity) AS faturamento_total
FROM sales_customer_refined;

#CRIANDO A VIEW DE FATURAMENTO
CREATE VIEW vw_Faturamento_Total AS
SELECT SUM(unit_price * quantity) AS faturamento_total
FROM sales_customer_refined;

#TRATANDO O CAMPO DATA
ALTER TABLE sales_customer_refined
MODIFY COLUMN order_date DATE;


/*---------------------------------------------*/

#EXTRAINDO O MÊS e printando o faturamento mensal
SELECT MONTH(order_date) AS mes, 
       SUM(quantity * unit_price) AS total_faturamento
FROM sales_customer_refined
GROUP BY mes;

#CRIANDO A VIEW DE Faturamento_Mês
CREATE VIEW vw_Faturamento_Mes AS
SELECT MONTH(order_date) AS mes, 
       SUM(quantity * unit_price) AS total_faturamento
FROM sales_customer_refined
GROUP BY mes;



/*---------------SELECT DAS VIEWS----------------*/
select * from vw_faturamento_mes;
select * from vw_faturamento_total;


