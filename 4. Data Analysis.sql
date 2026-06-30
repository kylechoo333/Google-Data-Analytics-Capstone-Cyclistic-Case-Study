--Adding new columns in order to perform our data analysis--
CREATE OR REPLACE TABLE `soy-vision-500808-b7.2025_divvy_trip_data.analysis_2025_divvy_tripdata` AS

  SELECT *,
  TIMESTAMP_DIFF (ended_at, started_at, MINUTE) AS ride_length_min, --Ride duration in minutes
  EXTRACT(HOUR FROM started_at) AS ride_hour, --Hour of the day (0-23)
  EXTRACT(DAYOFWEEK FROM started_at) AS weekday_num, --Weekday number (1= Sunday, 7= Satuday)
  FORMAT_TIMESTAMP('%A',started_at) AS weekday_name, --Weekday name 
  EXTRACT (MONTH FROM started_at) AS month_num, --Month number
  FORMAT_TIMESTAMP('%B',started_at) AS month_name, --Month name
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM started_at) IN (1,7) THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type

FROM `soy-vision-500808-b7.2025_divvy_trip_data.cleaned_2025_divvy_tripdata`;

--Membership Shares--
SELECT
  member_casual,
  COUNT(*) AS total_rides,
  ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER (),2) AS share_percentage
FROM `soy-vision-500808-b7.2025_divvy_trip_data.analysis_2025_divvy_tripdata`
GROUP BY member_casual
ORDER BY total_rides DESC;

--Bike type shares-- (Bike percentage is compared within same member type to give a better picture)
SELECT
  member_casual,
  rideable_type,
  COUNT(*) AS total_rides,
  ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER (PARTITION BY member_casual),2) AS share_percentage
FROM `soy-vision-500808-b7.2025_divvy_trip_data.analysis_2025_divvy_tripdata`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_rides DESC;

--Calculate the average ride duration, median duration, max and min duration--
SELECT
  member_casual,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_min),2) AS avg_ride_length_min,
  APPROX_QUANTILES(ride_length_min, 2)[OFFSET(1)] AS median_ride_length_min,
  MIN(ride_length_min) AS min_ride_length_min,
  MAX(ride_length_min) AS max_ride_length_min
FROM `soy-vision-500808-b7.2025_divvy_trip_data.analysis_2025_divvy_tripdata`
GROUP BY member_casual;

--Time/Date of bike ride--
--#1. Time analysis--
SELECT
  ride_hour,
  member_casual,
  COUNT(*) AS total_rides,
  ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER (PARTITION BY member_casual),2) AS share_percentage
FROM `soy-vision-500808-b7.2025_divvy_trip_data.analysis_2025_divvy_tripdata`
GROUP BY
  ride_hour,
  member_casual
ORDER BY
  ride_hour,
  member_casual;

--#2. Day analysis--
SELECT
  weekday_num,
  weekday_name,
  member_casual,
  COUNT(*) AS total_rides,
  ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER (PARTITION BY member_casual),2) AS share_percentage --share percentage over the week
FROM `soy-vision-500808-b7.2025_divvy_trip_data.analysis_2025_divvy_tripdata`
GROUP BY
  weekday_num,
  weekday_name,
  member_casual
ORDER BY
  weekday_num,
  member_casual;

--#3. Month analysis--
SELECT
  month_num,
  month_name,
  member_casual,
  COUNT(*) AS total_rides,
  ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER (PARTITION BY member_casual),2) AS share_percentage
FROM `soy-vision-500808-b7.2025_divvy_trip_data.analysis_2025_divvy_tripdata`
GROUP BY
  month_num,
  month_name,
  member_casual
ORDER BY
  month_num,
  member_casual;

--Top Station Analysis among annual members and casual members---
--Overall--
SELECT
  start_station_name,
  COUNT(*) AS total_rides
FROM `soy-vision-500808-b7.2025_divvy_trip_data.analysis_2025_divvy_tripdata`
WHERE 
  start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;

--Member--
SELECT
  start_station_name,
  COUNT(*) AS total_rides
FROM `soy-vision-500808-b7.2025_divvy_trip_data.analysis_2025_divvy_tripdata`
WHERE 
  member_casual = 'member'
  AND
  start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;

--Casual rider--
SELECT
  start_station_name,
  COUNT(*) AS total_rides
FROM `soy-vision-500808-b7.2025_divvy_trip_data.analysis_2025_divvy_tripdata`
WHERE 
  member_casual = 'casual'
  AND
  start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;




