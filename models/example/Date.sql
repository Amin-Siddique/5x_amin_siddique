{{ config(materialized='table') }}


SELECT distinct regexp_replace(DATE,'-','') AS DATE_SK, DATE
        ,YEAR(DATE) AS YEAR
        ,MONTH(DATE) AS MONTH
        ,MONTHNAME(DATE) AS MONTHNAME
        ,DAY(DATE) AS DAY
        ,DAYOFWEEK(DATE) AS DAYOFTHEWEEK
        ,WEEKOFYEAR(DATE) AS WEEKOFYEAR
        ,DAYOFYEAR(DATE) AS DAYOFYEAR
        from full_extract
