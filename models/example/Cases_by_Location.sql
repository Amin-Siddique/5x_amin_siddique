{{ config(materialized='table') }}


with Location as (

    select * from {{ ref('Location') }}

),

DTA AS (
SELECT DISTINCT 
LOCATION.LOCATION,LOCATION.PROVINCE,LOCATION.COUNTRY,LOCATION.ISLAND,
MAX(C.TOTAL_CASES) AS TOTAL_CASES_BY_LOCATION
FROM COVIDSTATS C LEFT JOIN LOCATION ON C.LOC_SK=LOCATION.LOC_SK
GROUP BY 1,2,3,4
)
SELECT * FROM DTA
