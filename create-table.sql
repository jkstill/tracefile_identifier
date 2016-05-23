
-- create-table.sql

drop table tid_demo purge;

create table tid_demo 
as
select *
from dba_objects;

exec dbms_stats.gather_table_stats(ownname=> USER, tabname=>'TID_DEMO', method_opt=>'for all columns size auto')

