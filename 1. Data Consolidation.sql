--Combining all the 12months bike trip data into a single table for analysis purpose--
CREATE OR REPLACE TABLE `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata` AS 
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202501-divvy-tripdata`
  UNION ALL
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202502-divvy-tripdata`
  UNION ALL
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202503-divvy-tripdata`
  UNION ALL
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202504-divvy-tripdata`
  UNION ALL
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202505-divvy-tripdata`
  UNION ALL
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202506-divvy-tripdata`
  UNION ALL
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202507-divvy-tripdata`
  UNION ALL
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202508-divvy-tripdata`
  UNION ALL
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202509-divvy-tripdata`
  UNION ALL
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202510-divvy-tripdata`
  UNION ALL
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202511-divvy-tripdata`
  UNION ALL
  SELECT * FROM `soy-vision-500808-b7.2025_divvy_trip_data.202512-divvy-tripdata`;

SELECT COUNT(*)
FROM `soy-vision-500808-b7.2025_divvy_trip_data.overall_2025_divvy_tripdata`;
