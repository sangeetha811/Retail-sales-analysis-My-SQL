CREATE DATABASE  P1_RETAIL_DB;
CREATE TABLE RETAIL_SALES
   ( transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
ALTER TABLE DATAFORSQLPRJCT MODIFY COLUMN SALE_DATE DATE;
ALTER TABLE DATAFORSQLPRJCT MODIFY COLUMN SALE_TIME TIME;
ALTER TABLE DATAFORSQLPRJCT MODIFY COLUMN TOTAL_SALE FLOAT;
ALTER TABLE DATAFORSQLPRJCT MODIFY COLUMN COGS FLOAT;
ALTER TABLE DATAFORSQLPRJCT MODIFY COLUMN PRICE_PER_UNIT FLOAT;
SELECT * FROM DATAFORSQLPRJCT;
RENAME TABLE DATAFORSQLPRJCT TO DATA;
SELECT COUNT(*) FROM DATA;
SELECT COUNT(CUSTOMER_ID) FROM DATA; 
 SELECT * FROM DATA WHERE  transactions_id IS NULL OR
    sale_date IS NULL OR
    sale_time IS NULL ORdata
    customer_id IS NULL OR
    gender IS NULL OR
    age IS NULL OR
    category IS NULL OR
    qty IS NULL OR
    price_per_unit IS NULL OR
    cogs IS NULL OR
    total_sale IS NULL;
ALTER TABLE DATA RENAME COLUMN QUANTIY TO qty ;
SELECT* FROM DATA WHERE DATE(SALE_DATE)="2022-11-05";
SELECT * FROM DATA WHERE CATEGORY="CLOTHING" AND QTY>4 AND MONTH(SALE_DATE)= 11 AND YEAR(SALE_DATE)=2022;
SELECT CATEGORY,SUM(TOTAL_SALE) AS TOTALSALES FROM DATA  GROUP BY CATEGORY ;
SELECT CATEGORY,AVG(AGE) AS AGE FROM DATA  GROUP BY CATEGORY ;
SELECT  * FROM DATA WHERE TOTAL_SALE>1000;
SELECT COUNT(TRANSACTIONS_ID) COUNTOFID, CATEGORY,GENDER FROM DATA  GROUP BY GENDER,CATEGORY ;
 with monthlysales as              
 ( SELECT YEAR(sale_date) AS Sale_Year,
        MONTH(sale_date) AS Sale_Month,
        AVG(total_sale) AS Average_monthly_sale,
        SUM(total_sale) AS Total_monthly_sale
    FROM 
        data
    GROUP BY 
        YEAR(sale_date), 
        MONTH(sale_date)
	)
    select sale_year,sale_month,Average_monthly_sale,Total_monthly_sale 
    from monthlysales
    where total_monthly_sale=(
    select  max(total_monthly_sale)  from monthlysales as MS
    where MS.sale_year=monthlysales.sale_year
    )
ORDER BY 
    sale_year, 
    sale_month;
  SELECT CUSTOMER_ID ,TOTAL_SALE FROM   (SELECT CUSTOMER_ID,TOTAL_SALE ,DENSE_RANK() OVER(ORDER BY TOTAL_SALE DESC) SALES FROM DATA)
  TEMP LIMIT 5;
select count( distinct customer_id) as Unique_customer_ID,category             
from data 
group by category;
select                                
case 
when hour(sale_time) < 12 then "Morning"
when hour(sale_time) between 12 and 17 then "afternoon"
else "evening"
end as Shift,
count(*)  as total_orders
from data
group by shift;
use p1_retail_db;
select * from data;


