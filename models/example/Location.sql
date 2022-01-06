
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}


Select 
row_number() over(order by location) as LOC_SK,
Location,
Location_ISO_Code as LOC_CODE,
LOCATION_LEVEL,
PROVINCE,
COUNTRY,
ISLAND,
CONTINENT,
Longitude,
Latitude,
Special_Status
FROM 
Full_Extract

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
