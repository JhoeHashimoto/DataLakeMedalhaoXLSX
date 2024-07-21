create view vw_faturamento_total_gold AS
SELECT sum(quantity * unit_price) as Faturamento
from sales_customer_gold;


select * from vw_faturamento_total_gold;

