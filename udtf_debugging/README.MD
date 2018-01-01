# articles
Supporting Files for "How to troubleshoot Hive UDTF functions"

events.ddl - Sample table definition
events.txt - Sample data 

To create and upload data
hive -f events.ddl
hadoop fs -mkdir /tmp/events
hadoop fs -put events.txt /tmp/events/

parse_events.py - UDTF code with no messages
parse_events_w_stderr.py - UDTF with debug messages

select_json.hql - Run UDTF code with no messages
select_json_w_stderr.hql - Run UDTF code with debug messages


