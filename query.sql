# deprecated
#
# CREATE TABLE [REPORTLINES] (
#     REPORTDATE  TEXT,
#     PROJID      TEXT,
#     PROJNAME    TEXT,
#     STATENUM    TEXT,
#     FEDNUM      TEXT,
#     REGION      TEXT,
#     LOCATION    TEXT,
#     PROJMAN     TEXT,
#     PHONENUM    TEXT,
#     ANTADVDT    TEXT,
#     DESCRIPTION TEXT,
#     ADDLINFO    TEXT,
#     ENGEST      TEXT
# );
# 
# CREATE TABLE [REPORTDATES] (
#     REPORTDATE  TEXT
# );

https://stackoverflow.com/questions/63446143/sql-code-to-detect-change-between-two-tables-without-knowing-the-attributes

SELECT TOP 1 * From
(select Top 2 * from Cinema ORDER BY CinemaID DESC) x                     
ORDER BY CinemaID

#####################################################
# ACTION: DELETED
# select project id from [OLD TABLE] except projects from the [NEW TABLE] to show projects that have dissappeared off the old list. 
#
# query 1:
# select "PROJID" from "2021.12.20" EXCEPT select "PROJID" from "2022.01.18";
# query 1 ver 2:

SELECT * FROM "2021.12.20" old WHERE NOT EXISTS ( SELECT 1 FROM "2022.01.18" new WHERE new.PROJID = old.PROJID )

#####################################################
# ACTION: ADDED
# select project id from [NEW TABLE] except projects from the [OLD TABLE] to show projects that are new to the current list. 
#
# query 2:
# select "PROJID" from "2022.01.18" EXCEPT select "PROJID" from "2021.12.20";
# query 2 ver 2:

SELECT * FROM "2022.01.18" new WHERE NOT EXISTS ( SELECT 1 FROM "2021.12.20" old WHERE new.PROJID = old.PROJID )

#####################################################
# Get all projects that exist in both new and old table.
#
# query 3 ver 1:
SELECT PROJID FROM "2022.01.18" new WHERE EXISTS ( SELECT 1 FROM "2021.12.20" old WHERE new.PROJID = old.PROJID )


 
    select key, 'PROJID', col, name val from [2021.12.20] union all     
    select key, 'PROJNAME' project_name from [2021.12.20] union all 
    select key, 'STATENUM' state_num from [2021.12.20] union all  
    select key, 'FEDNUM' fed_num from [2021.12.20] union all   
    select key, 'REGION' region from [2021.12.20] union all 
    select key, 'LOCATION' location from [2021.12.20] union all   
    select key, 'PROJMAN' proj_man from [2021.12.20] union all 
    select key, 'PHONENUM' phone_num from [2021.12.20] union all   
    select key, 'ANTADVDT' ant_adv_date from [2021.12.20] union all 
    select key, 'DESCRIPTION' from [2021.12.20] union all 
    select key, 'ADDLINFO' from [2021.12.20] union all 
    select key, 'ENGEST'  from [2021.12.20]     



with 
  cte1 as (
    select key, 'PROJID', col, name val from [2021.12.20] union all     
    select key, 'PROJNAME' project_name from [2021.12.20] union all 
    select key, 'STATENUM' state_num from [2021.12.20] union all  
    select key, 'FEDNUM' fed_num from [2021.12.20] union all   
    select key, 'REGION' region from [2021.12.20] union all 
    select key, 'LOCATION' location from [2021.12.20] union all   
    select key, 'PROJMAN' proj_man from [2021.12.20] union all 
    select key, 'PHONENUM' phone_num from [2021.12.20] union all   
    select key, 'ANTADVDT' ant_adv_date from [2021.12.20] union all 
    select key, 'DESCRIPTION' from [2021.12.20] union all 
    select key, 'ADDLINFO' from [2021.12.20] union all 
    select key, 'ENGEST'  from [2021.12.20]   
  ),
  cte2 as (
    select key, 'PROJID', col, name val from [2022.01.18] union all     
    select key, 'PROJNAME' project_name from [2022.01.18] union all 
    select key, 'STATENUM' state_num from [2022.01.18] union all  
    select key, 'FEDNUM' fed_num from [2022.01.18] union all   
    select key, 'REGION' region from [2022.01.18] union all 
    select key, 'LOCATION' location from [2022.01.18] union all   
    select key, 'PROJMAN' proj_man from [2022.01.18] union all 
    select key, 'PHONENUM' phone_num from [2022.01.18] union all   
    select key, 'ANTADVDT' ant_adv_date from [2022.01.18] union all 
    select key, 'DESCRIPTION' from [2022.01.18] union all 
    select key, 'ADDLINFO' from [2022.01.18] union all 
    select key, 'ENGEST'  from [2022.01.18]   
  )  
select row_number() over (order by c1.key, c1.col) id,
       c1.key,
       c1.col [Change Field],
       c1.val [Orig Value],
       c2.val [Updated Value] 
from cte1 c1 inner join cte2 c2
on c2.key = c1.key and c2.col = c1.col and c2.val <> c1.val  
order by c1.key, c1.col  
