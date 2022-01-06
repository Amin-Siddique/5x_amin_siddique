{{ config(materialized='table') }}

with 

DATE as (

    select * from {{ ref('Date') }}

),

DTA as (

    select 
	DISTINCT 
    DATE.MONTH,DATE.YEAR,MAX(COVIDSTATS.TOTAL_CASES) AS TOTAL_CASES_BY_MONTH
	FROM COVIDSTATS
    LEFT JOIN DATE USING(DATE_SK)
	GROUP  BY DATE.MONTH,DATE.YEAR

)

select * from DTA 