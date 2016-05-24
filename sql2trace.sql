
-- sql2trace.sql

set line 200 trimspool on
set pagesize 60

select owner, object_name, object_id, object_type, to_char(created,'yyyy-mm-dd hh24:mi:ss') created
from tid_demo
where owner = 'SYS'
and object_type = 'OPERATOR'
/


