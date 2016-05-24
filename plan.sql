

-- plan.sql

col ssh_target new_value ssh_target noprint
col scp_filename new_value scp_filename noprint

set term off feed off verify off echo off

select '&&1' ssh_target from dual;
select '&&2' scp_filename from dual;

set feed on term on verify on

--disconnect

-- uid=0 is SYS - skip these
-- command types are 2:insert 3:select 6:update 7:delete
-- see v$sqlcommand

-- C will be the cursor number
-- it is assumed there is only 1 user SQL DML statement in the trace file

--host ssh &&ssh_target 'C=$(cat &&scp_filename | grep -E "PARSING.*uid=[^0].*oct=[2367]" | awk "{ print \$4 }" ); grep "^STAT $C" &scp_filename' 
host ssh &&ssh_target 'C=$( grep -E "PARSING.*uid=[^0].*oct=[2367]"  &&scp_filename | awk "{ print \$4 }" ); grep "^STAT $C" &scp_filename' 



