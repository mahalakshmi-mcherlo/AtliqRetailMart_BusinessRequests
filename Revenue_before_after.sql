-- 3.	Generate a report that displays each campaign along with the
--  total revenue generated before and after the campaign? 
-- The report includes three key fields: campaign_name,total_revenue(before_promotion),total_revenue(after_promotion).  
    SELECT 
    campaign_name,
    ROUND(SUM(quantity_sold_before_promo * base_price) / 1000000,
            2) AS revenue_before_promo_mlns,
    ROUND(SUM(CASE
                WHEN promo_type = 'BOGOF' THEN (quantity_sold_after_promo * 2) * (base_price * 0.5)
                WHEN promo_type = '25% OFF' THEN (quantity_sold_after_promo) * (base_price * 0.75)
                WHEN promo_type = '50% OFF' THEN (quantity_sold_after_promo) * (base_price * 0.5)
                WHEN promo_type = '33% OFF' THEN (quantity_sold_after_promo) * (base_price * 0.67)
                WHEN promo_type = '500 Cashback' THEN (quantity_sold_after_promo * (base_price - 500))
                ELSE quantity_sold_after_promo * base_price
            END) / 1000000,
            2) AS revenue_after_promo_mlns
FROM
    fact_events fe
        JOIN
    dim_campaigns dc ON fe.campaign_id = dc.campaign_id
GROUP BY dc.campaign_name
