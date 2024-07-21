#CRIAÇÃO PROCEDURES CUSTOMER_DATAMART
use v2gold_sales_customer;

#########################
DELIMITER $$

CREATE PROCEDURE customer_listar_clientes()
BEGIN
    SELECT id_cliente, nome, sobrenome, email, telefone
    FROM customer_datamart;
END$$

DELIMITER ;

#####################

DELIMITER $$

CREATE PROCEDURE customer_quantidade_cadastro_ano_ano()
BEGIN
    -- Variável para armazenar a quantidade de registros em 2020
    DECLARE qtnd_2020 INT;
    
    -- Obtém a quantidade de registros em 2020
    SELECT COUNT(id_cliente) INTO qtnd_2020
    FROM customer_datamart
    WHERE YEAR(Data_Cadastro) = 2020;

    -- Seleciona os dados por ano com crescimento percentual em relação a 2020
    SELECT 
        YEAR(Data_Cadastro) AS Ano,
        COUNT(id_cliente) AS Qtnd_Registros,
        CASE
            WHEN qtnd_2020 = 0 THEN 0 -- Evita divisão por zero
            ELSE ROUND(((COUNT(id_cliente) / qtnd_2020) * 100) - 100, 2)
        END AS Crescimento_Percentual
    FROM customer_datamart
    GROUP BY Ano
    ORDER BY Ano DESC;
END$$
DELIMITER ;