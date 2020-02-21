CREATE schema
IF NOT EXISTS import;

DROP TABLE IF EXISTS import.master_plan;

CREATE TABLE import.master_plan
(
    start_time_utc text,
    duration text,
    date text,
    team text,
    spass_type text,
    target text,
    request_name text,
    library_definition text,
    title text,
    description text
);

COPY import
.master_plan
FROM '/c-moon-vol/data/master_plan.csv'
WITH DELIMITER ',' HEADER CSV;

