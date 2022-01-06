{{ config(materialized='view') }}


with 

DATE as (

    select * from {{ ref('Date') }}

),

DTA as (

    select
	DISTINCT DATE.DATE,DATE.YEAR,
    MAX(COVIDSTATS.NEW_CASES) AS NEW_CASES,
    MAX(COVIDSTATS.NEW_ACTIVE_CASES) AS NEW_ACTIVE_CASES,
    MAX(COVIDSTATS.NEW_DEATHS) AS NEW_DEATHS
	FROM COVIDSTATS
    LEFT JOIN DATE USING(DATE_SK)
	GROUP  BY DATE.DATE,DATE.YEAR


)

select * from DTA 