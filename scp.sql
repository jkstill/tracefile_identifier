
col scp_src new_value scp_src noprint
col scp_target new_value scp_target noprint

set term off feed off verify off echo off

select '&&1' scp_src from dual;
select '&&2' scp_target from dual;

set feed on term on verify on

--disconnect

host scp &&scp_src &&scp_target

