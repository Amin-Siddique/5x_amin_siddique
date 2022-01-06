{{ config(materialized='table') }}

with 

DATE as (

    select * from {{ ref('Date') }}

),

DTA as (

    select
	DISTINCT DATE.WEEKOFYEAR,DATE.YEAR,MAX(COVIDSTATS.TOTAL_CASES) AS TOTAL_CASES_BY_WEEK
	FROM COVIDSTATS
    LEFT JOIN DATE USING(DATE_SK)
	GROUP  BY DATE.WEEKOFYEAR,DATE.YEAR

)

select * from DTA 