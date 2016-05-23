
-- mrskew.sql

col ssh_target new_value ssh_target noprint
col scp_filename new_value scp_filename noprint

set term off feed off verify off echo off

select '&&1' ssh_target from dual;
select '&&2' scp_filename from dual;

set feed on term on verify on

--disconnect

host ssh &&ssh_target 'cat &&scp_filename' | mrskew

