-- Qual é o ticket médio?
-- O ticket médio geral é de 105 reais.
SELECT 
  ROUND(AVG(order_amount), 2)
FROM delivery_center_dataset.orders;

-- Quais são os dias que mais vende?
SELECT
  ROUND(SUM(order_amount)) AS valor_pedido,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM order_moment_created) = 1 THEN "Domingo"
    WHEN EXTRACT(DAYOFWEEK FROM order_moment_created) = 2 THEN "Segunda" 
    WHEN EXTRACT(DAYOFWEEK FROM order_moment_created) = 3 THEN "Terça" 
    WHEN EXTRACT(DAYOFWEEK FROM order_moment_created) = 4 THEN "Quarta" 
    WHEN EXTRACT(DAYOFWEEK FROM order_moment_created) = 5 THEN "Quinta"
    WHEN EXTRACT(DAYOFWEEK FROM order_moment_created) = 6 THEN "Sexta" 
    ELSE "Sábado" 
  END AS dia_semana
FROM delivery_center_dataset.orders
GROUP BY dia_semana
ORDER BY valor_pedido DESC; 

-- Qual é o faturamento de cada Hubs?
WITH invoicing_hubs AS (
  SELECT
    hubs.hub_name AS hub,
    ROUND(SUM(orders.order_amount), 2) AS faturamento
  FROM
    delivery_center_dataset.hubs
    INNER JOIN delivery_center_dataset.stores
      ON stores.hub_id = hubs.hub_id
    INNER JOIN delivery_center_dataset.orders
      ON orders.store_id = stores.store_id
  GROUP BY hub
  ORDER BY faturamento DESC
)
SELECT * FROM invoicing_hubs;

-- Qual é o tipo de pagamento mais preferido?
WITH category_payments AS(
  SELECT
    payment_method AS pagamentos,
    COUNT(payment_method) AS contagem_pagamentos, 
    ROUND(SUM(payment_amount), 2) AS total_vendas
  FROM
    delivery_center_dataset.payments
  GROUP BY pagamentos
),
ranked_sales AS(
  SELECT
    pagamentos,
    contagem_pagamentos,
    total_vendas,
    RANK() OVER(ORDER BY total_vendas DESC) as ranque
  FROM
    category_payments
)

SELECT
  pagamentos,
  contagem_pagamentos,
  total_vendas,
  ranque
FROM
  ranked_sales
ORDER BY ranque;
