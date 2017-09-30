DROP TABLE IF EXISTS default.video_events_stg;

CREATE EXTERNAL TABLE default.video_events_stg (
  device_id string,
  event_type string,
  event_time string,
  play_time_ms bigint,
  buffer_time_ms bigint)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
LOCATION '/landing/video_events_stg';
