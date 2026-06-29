--Remove ride with negative and zero durations--
CREATE OR REPLACE TABLE
  `soy-vision-500808-b7.2025_divvy_trip_data.cleaned_2025_divvy_tripdata` AS

SELECT *
FROM `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata`
WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 0;
