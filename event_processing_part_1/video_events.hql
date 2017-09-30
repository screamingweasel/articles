DROP TABLE IF EXISTS default.video_events;

CREATE TABLE video_events (
  device_id string,
  event_type string,
  event_time timestamp,
  play_time_ms bigint,
  buffer_time_ms bigint)
PARTITIONED BY ( 
  event_year string, 
  event_month string, 
  event_day string,
  event_hour string,
  process_time string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;
