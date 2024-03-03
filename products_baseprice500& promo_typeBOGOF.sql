-- 1 . Provide a list of products with a base price greater than 500 
-- and that are featured in promo type of 'BOGOF' (Buy One Get One Free). 
SELECT 
    distinct(product_name),
    fe.base_price,
    fe.promo_type        
FROM 
    fact_events fe
JOIN 
    dim_products dm 
    ON fe.product_code = dm.product_code 
WHERE 
    fe.base_price > 500 AND fe.promo_type = 'bogof'    
    order by fe.base_price asc
