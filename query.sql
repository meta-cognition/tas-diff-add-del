# THIS IS A SANDBOX FOR CREATING AND TESTING SQL QUERIES
#
# deprecated:
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

SELECT PROJID, 'DELETED' [Change Field], '' [Orig Value], '' [Updated Value], PROJNAME, REGION, STATENUM, FEDNUM, LOCATION, PROJMAN, PHONENUM,
ANTADVDT, DESCRIPTION, ADDLINFO, ENGEST FROM "2021.12.20" old WHERE NOT EXISTS ( SELECT 1 FROM "2022.01.18" new WHERE new.PROJID = old.PROJID )

#####################################################
# ACTION: ADDED
# select project id from [NEW TABLE] except projects from the [OLD TABLE] to show projects that are new to the current list. 
#
# query 2:
# select "PROJID" from "2022.01.18" EXCEPT select "PROJID" from "2021.12.20";
# query 2 ver 2:

SELECT PROJID, 'ADDED' [Change Field], '' [Orig Value], '' [Updated Value], PROJNAME, REGION, STATENUM, FEDNUM, LOCATION, PROJMAN, PHONENUM,
ANTADVDT, DESCRIPTION, ADDLINFO, ENGEST FROM "2022.01.18" new WHERE NOT EXISTS ( SELECT 1 FROM "2021.12.20" old WHERE new.PROJID = old.PROJID )

#####################################################
# Get all projects that exist in both new and old table.
#
# query 3 ver 1:
SELECT PROJID FROM "2022.01.18" new WHERE EXISTS ( SELECT 1 FROM "2021.12.20" old WHERE new.PROJID = old.PROJID )





with 
  cte1 as (    
    select [PROJID], 'PROJNAME' col, [PROJNAME] val from [2021.12.20] union all 
    select [PROJID], 'STATENUM', [STATENUM] from [2021.12.20] union all  
    select [PROJID], 'FEDNUM', [FEDNUM] from [2021.12.20] union all   
    select [PROJID], 'REGION', [REGION] from [2021.12.20] union all 
    select [PROJID], 'LOCATION', [LOCATION] from [2021.12.20] union all   
    select [PROJID], 'PROJMAN', [PROJMAN] from [2021.12.20] union all 
    select [PROJID], 'PHONENUM', [PHONENUM] from [2021.12.20] union all   
    select [PROJID], 'ANTADVDT', [ANTADVDT] from [2021.12.20] union all 
    select [PROJID], 'DESCRIPTION', [DESCRIPTION] from [2021.12.20] union all 
    select [PROJID], 'ADDLINFO', [ADDLINFO] from [2021.12.20] union all 
    select [PROJID], 'ENGEST', [ENGEST] from [2021.12.20]    
  ),
  cte2 as (
    select [PROJID], 'PROJNAME' col, [PROJNAME] val from [2022.01.18] union all 
    select [PROJID], 'STATENUM', [STATENUM] from [2022.01.18] union all  
    select [PROJID], 'FEDNUM', [FEDNUM] from [2022.01.18] union all   
    select [PROJID], 'REGION', [REGION] from [2022.01.18] union all 
    select [PROJID], 'LOCATION', [LOCATION] from [2022.01.18] union all   
    select [PROJID], 'PROJMAN', [PROJMAN] from [2022.01.18] union all 
    select [PROJID], 'PHONENUM', [PHONENUM] from [2022.01.18] union all   
    select [PROJID], 'ANTADVDT', [ANTADVDT] from [2022.01.18] union all 
    select [PROJID], 'DESCRIPTION', [DESCRIPTION] from [2022.01.18] union all 
    select [PROJID], 'ADDLINFO', [ADDLINFO] from [2022.01.18] union all 
    select [PROJID], 'ENGEST', [ENGEST] from [2022.01.18]   
  ) , 
  cte3 as (
    select * from [2022.01.18]
    )
    SELECT PROJID, 'DELETED' [Change Field], '' [Orig Value], '' [Updated Value], PROJNAME, REGION, STATENUM, FEDNUM, LOCATION, PROJMAN, PHONENUM,
ANTADVDT, DESCRIPTION, ADDLINFO, ENGEST FROM "2021.12.20" old WHERE NOT EXISTS ( SELECT 1 FROM "2022.01.18" new WHERE new.PROJID = old.PROJID )
UNION ALL
SELECT PROJID, 'ADDED' [Change Field], '' [Orig Value], '' [Updated Value], PROJNAME, REGION, STATENUM, FEDNUM, LOCATION, PROJMAN, PHONENUM,
ANTADVDT, DESCRIPTION, ADDLINFO, ENGEST FROM "2022.01.18" new WHERE NOT EXISTS ( SELECT 1 FROM "2021.12.20" old WHERE new.PROJID = old.PROJID )
UNION ALL
select c1.[PROJID],
	   c1.col [Change Field],
	   c1.val [Orig Value],
	   c2.val [Updated Value],
	   c3.PROJNAME,
        c3.REGION,
	   '' STATENUM, '' FEDNUM, '' LOCATION, '' PROJMAN, '' PHONENUM, '' ANTADVDT, '' DESCRIPTION, '' ADDLINFO, '' ENGEST
from cte1 c1 inner join cte2 c2 inner join cte3 c3
on c2.[PROJID] = c1.[PROJID] and c2.col = c1.col and c2.val <> c1.val and c1.PROJID = c3.[PROJID]
order by c3.REGION, c2.val 

p
REPORTDATE|PROJID|PROJNAME|STATENUM|FEDNUM|REGION|LOCATION|PROJMAN|PHONENUM|ANTADVDT|DESCRIPTION|ADDLINFO|ENGEST     