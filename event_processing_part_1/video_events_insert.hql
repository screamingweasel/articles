set hive.exec.dynamic.partition.mode=nonstrict;
set hive.optimize.sort.dynamic.partition=true;

INSERT INTO TABLE default.video_events
PARTITION (event_year, event_month, event_day, event_hour, process_time)
SELECT 
device_id,
event_type,
CAST(regexp_replace(regexp_replace(event_time,'Z',''),'T',' ') as timestamp) as event_time,
play_time_ms,
buffer_time_ms,
substr(event_time,1,4)  AS event_year,
substr(event_time,6,2)  AS event_month,
substr(event_time,9,2)  AS event_day,
substr(event_time,12,2) AS event_hour,
substr(regexp_extract(input__file__name, '.*\/(.*)', 1),1,10) AS process_time
FROM default.video_events_stg;

show partitions default.video_events;
