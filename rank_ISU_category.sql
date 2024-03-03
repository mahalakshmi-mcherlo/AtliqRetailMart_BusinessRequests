-- 4.	Produce a report that calculates the Incremental Sold Quantity (ISU%) for each category
-- during the Diwali campaign. Additionally, provide rankings for the categories based on their ISU%.
-- The report will include three key fields: category, isu%, and rank order. 
with isu as(
SELECT 
category,
sum(quantity_sold_before_promo) as sales_before_promo,
sum(CASE
	WHEN promo_type = "bogof" THEN quantity_sold_after_promo *2
	ELSE quantity_sold_after_promo
	END) as  sales_after_promo
FROM 
dim_products dp
JOIN
fact_events fe
ON dp.product_code = fe.product_code
JOIN dim_campaigns dc
ON fe.campaign_id = dc.campaign_id
WHERE campaign_name = "diwali"
GROUP BY category
),
isu_pct as (
SELECT
*,
round(
((sales_after_promo - sales_before_promo)/sales_before_promo)*100,2) as ISU_pct
FROM isu
)
SELECT
*,rank() over(order by ISU_pct desc)as  rank_order
FROM isu_pct;

