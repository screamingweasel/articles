set hive.execution.engine=mr;

DELETE FILE /home/svc.q3bdara/bdarnp/jmb/parse_events_w_stderr.py;
ADD FILE /home/svc.q3bdara/bdarnp/jmb/parse_events_w_stderr.py;

SELECT TRANSFORM (json_text)
USING  'python parse_events_w_stderr.py'
AS
deviceId,
eventType,
eventTime,
errorReason,
errorMsg
FROM  default.events;

