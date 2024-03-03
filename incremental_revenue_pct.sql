-- 5.	Create a report featu ring the Top 5 products, ranked by Incremental Revenue Percentage (IR%),
-- across all campaigns.The report will provide essential information including product name, category, and ir%.  --

set sql_mode ="";
with ir as(
SELECT 
product_name,
category,
round(SUM(fe.quantity_sold_before_promo * fe.base_price)/1000000,2) as revenue_before_promo_mln,
round(SUM(CASE
	WHEN fe.promo_type = 'BOGOF' THEN (fe.quantity_sold_after_promo *2) * (fe.base_price * 0.5)
	WHEN fe.promo_type = '25% OFF' THEN (fe.quantity_sold_after_promo) * (fe.base_price * 0.75)
    WHEN promo_type = '50% OFF'  THEN (fe.quantity_sold_after_promo) * (fe.base_price * 0.5)
    WHEN promo_type = '33% OFF'  THEN (fe.quantity_sold_after_promo) * (fe.base_price * 0.67)
    WHEN promo_type = '500 Cashback'  THEN (fe.quantity_sold_after_promo * (fe.base_price-500) )             
    ELSE fe.quantity_sold_after_promo * fe.base_price				
	END)/1000000,2) as revenue_after_promo_mln  
FROM 
dim_products dp
JOIN
fact_events fe
ON dp.product_code = fe.product_code
GROUP BY product_name
),
ir_pct as (
SELECT 
*,
round(((revenue_after_promo_mln - revenue_before_promo_mln)/revenue_before_promo_mln)*100,2) as IR_pct
FROM ir
)
SELECT
product_name,
category,
ir_pct,
rank() over(order by IR_pct desc)as  rank_order
from ir_pct
ORDER BY IR_pct desc
LIMIT 5



