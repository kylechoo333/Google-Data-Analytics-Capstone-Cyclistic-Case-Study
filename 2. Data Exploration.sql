--Find total number of rows-- 
SELECT
  COUNT(*) AS total_rows
FROM `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata`;

--Find total number of columns-- 
SELECT
  COUNT(*) AS total_columns
FROM `soy-vision-500808-b7.2025_divvy_trip_data.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'overall_2025_divvy_tripdata';

--Verify the schema-- 
SELECT
    column_name,
    data_type
FROM `soy-vision-500808-b7.2025_divvy_trip_data.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'overall_2025_divvy_tripdata'
ORDER BY ordinal_position;

--Check NULL values-- 
SELECT
    COUNTIF(ride_id IS NULL) AS ride_id_null,
    COUNTIF(rideable_type IS NULL) AS rideable_type_null,
    COUNTIF(started_at IS NULL) AS started_at_null,
    COUNTIF(ended_at IS NULL) AS ended_at_null,
    COUNTIF(start_station_name IS NULL) AS start_station_name_null,
    COUNTIF(start_station_id IS NULL) AS start_station_id_null,
    COUNTIF(end_station_name IS NULL) AS end_station_name_null,
    COUNTIF(end_station_id IS NULL) AS end_station_id_null,
    COUNTIF(start_lat IS NULL) AS start_lat_null,
    COUNTIF(start_lng IS NULL) AS start_lng_null,
    COUNTIF(end_lat IS NULL) AS end_lat_null,
    COUNTIF(end_lng IS NULL) AS end_lng_null,
    COUNTIF(member_casual IS NULL) AS member_casual_null
FROM `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata`;

--Check Blank Values--
SELECT
    COUNTIF(TRIM(ride_id) = '') AS blank_ride_id,
    COUNTIF(TRIM(rideable_type) = '') AS blank_rideable_type,
    COUNTIF(TRIM(start_station_name) = '') AS blank_start_station_name,
    COUNTIF(TRIM(start_station_id) = '') AS blank_start_station_id,
    COUNTIF(TRIM(end_station_name) = '') AS blank_end_station_name,
    COUNTIF(TRIM(end_station_id) = '') AS blank_end_station_id,
    COUNTIF(TRIM(member_casual) = '') AS blank_member_casual
FROM `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata`;

--Check Duplicate Values--
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT ride_id) AS unique_ride_ids
FROM `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata`;

--Calculate ride duration statstics--
SELECT 
  MIN(TIMESTAMP_DIFF(ended_at, started_at, SECOND)) AS min_duration_sec,
  MAX(TIMESTAMP_DIFF(ended_at, started_at, SECOND)) AS max_duration_sec,
  ROUND(AVG(TIMESTAMP_DIFF(ended_at, started_at,SECOND)),2) AS avg_duration_sec,
FROM `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata`;

--Calculate frequency of "negative duration", "zero duration" and "over 24 hours" rides
SELECT
    COUNTIF(TIMESTAMP_DIFF(ended_at, started_at, SECOND) < 0) AS negative_duration,
    COUNTIF(TIMESTAMP_DIFF(ended_at, started_at, SECOND) = 0) AS zero_duration,
    COUNTIF(TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 86400) AS over_24_hours
FROM `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata`;

--Further inspection on zero duration ride--
SELECT
    ride_id,
    member_casual,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    end_station_name
FROM `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata`
WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) = 0
LIMIT 20;

--Check how many type of bike type--
SELECT
    rideable_type,
    COUNT(*) AS total_rides
FROM `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata`
GROUP BY rideable_type
ORDER BY total_rides DESC;

--Check how many type of member type--
SELECT
    member_casual,
    COUNT(*) AS total_rides
FROM `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata`
GROUP BY member_casual
ORDER BY total_rides DESC;
