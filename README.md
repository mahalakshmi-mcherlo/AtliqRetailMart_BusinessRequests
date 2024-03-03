# AtliqRetailMart_BusinessRequests
Problem Statement
Analyse Promotions and Provide Tangible Insights to Sales Director
Domain: FMCG	Function: Sales / Promotions
AtliQ Mart is a retail giant with over 50 supermarkets in the southern region of India. 
All their 50 stores ran a massive promotion during the Diwali 2023 and Sankranti 2024 (festive time in India) on their AtliQ branded products.
 Now the sales director wants to understand which promotions did well and which did not so that they can make informed decisions for their next promotional period.

This file Provided contains all the meta information regarding the columns described in the CSV files. The 4 CSV files:
1. dim_campaigns
2. dim_products
3. dim_stores
4. fact_events

Column Description for dim_campaigns:
- campaign_id: Unique identifier for each promotional campaign.
- campaign_name: Descriptive name of the campaign (e.g., Diwali, Sankranti).
- start_date: The date on which the campaign begins, formatted as DD-MM-YYYY.
- end_date: The date on which the campaign ends, formatted as DD-MM-YYYY.

*******************************************

Column Description for dim_products:
- product_code: Unique code assigned to each product for identification.
- product_name: The full name of the product, including brand and specifics (e.g., quantity, size).
- category: The classification of the product into broader categories such as Grocery & Staples, Home Care, Personal Care, Home Appliances, etc.


*******************************************

Column Description for dim_stores:
- store_id: Unique code identifying each store location.
- city: The city where the store is located, indicating the geographical market.


*******************************************

Column Description for fact_events:

event_id: Unique identifier for each sales event.  
store_id: Refers to the store where the event took place, linked to the dim_stores table.  
campaign_id: Indicates the campaign under which the event was recorded, linked to the dim_campaigns table.  
product_code: The code of the product involved in the sales event, linked to the dim_products table.  
base_price: The standard price of the product before any promotional discount.   
promo_type: The type of promotion applied (e.g., percentage discount, BOGOF(Buy One Get One Free), cashback).   
quantity_sold(before_promo): The number of units sold in the week immediately preceding the start of the campaign, serving as a baseline for comparison with promotional sales.   
quantity_sold(after_promo): The quantity of the product sold after the promotion was applied.


*******************************************


