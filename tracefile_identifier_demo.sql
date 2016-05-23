
-- tracefile_identifier_demo.sql

-- start a new session each time to get new trace file
@@reconnect

-- column variables to capture host, owner and tracefile name
col tracehost new_value tracehost noprint
col traceowner new_value traceowner noprint
col tracefile new_value tracefile noprint

set term off head off feed off

-- get oracle owner
select username traceowner from v$process where pname = 'PMON';

-- get host name
select host_name tracehost from v$instance;

-- set tracefile identifier
alter session set tracefile_identifier = 'MYTRACEFILE';

select value tracefile from v$diag_info where name = 'Default Trace File';

set term on head on feed on

-- do your tracing here 
alter session set events '10046 trace name context forever, level 12';

-- run your SQL here
@@sql2trace

alter session set events '10046 trace name context off';

-- Note: disconnect no longer necessary with 11g+
-- disconnect to ensure all trace data flushed
-- the disconnect must be done in the called script
-- otherwise the values of the defined vars are lost

-- now get the trace file, or other processing

--@@scp '&&traceowner@&&tracehost:&&tracefile' '.'
@@mrskew '&&traceowner@&&tracehost' '&&tracefile'
@@plan '&&traceowner@&&tracehost' '&&tracefile'
--@@tkprof '&&traceowner@&&tracehost' '&&tracefile'





