#INVOCANDO AS PROCEDURES

use v2gold_sales_customer;



call customer_listar_clientes();

call customer_quantidade_cadastro_ano_();

call customer_quantidade_cadastro_ano_mes();

-----------------------------------------------


call sales_contagem_pedidos_cliente();

call sales_faturamento_total();

call sales_faturamento_mensal();

call sales_faturamento_produto();

call sales_vendas_clientes_compra_unica();
