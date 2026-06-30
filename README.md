# Google Data Analytics Capstone: Cyclistic Case Study
This is my documentation of a capstone project from https://www.coursera.org/learn/google-data-analytics-capstone

In this case study, I will perform data analysis for a fictional bike-share company named "Cyclistic", in order to help them attract more riders. In order to answer the key business questions, I will follow the steps of data analysis process: Ask, Prepare, Process, Analyse, Share, and Act.

**Quick Links:**
Data Source: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

SQL Queries:
1. Data Consolidation
2. Data Exploration
3. Data Cleaning
4. Data Analysis

5. Data Visualisation: Tableau (To insert link)

## Background
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unclocked from one station and returned to any other station in the system anytime. 

Until now, Cyclistic's marketing strategy rellied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of ites pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. 

Cyclistic's finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attrract more customers, Lily Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be the key to future growth. Rather than creating a marketing campaign that targets all-new customers, MOreno believe there is a solid opportunity to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. 

Morena has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends. 

## Ask
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned me (the data analyst working on the marketing analyst team at Cyclistic) the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?

## Prepare
### Data Source
I will use Cyclistic's historical trip data to analyse and identify patterns from Jan 2025 to Dec 2025, which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).

This is publicly available data that can be used to study how different type of customers are using Cyclistic bikes. But note that data-privacy issues prohibit data users from using riders' personally identifiable information. This means that we won't be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes. 

### Data Structure 
Total of 12 files are used for this analysis, each file represents that data of each month, with the naming convention of YYYYMM-divvy-tripdata

## Process
As there is more than 100k+ data per month, it is clear that SQL/BigQuery should be used to handle the data because it can better process and host huge volumnes of data than google sheets or microsoft excel. Big Query is used to combine monthly dataset and clean it

### Data Consolidation (SQL #1)
SQL Query: Data Consolidation (To embed link here)
12 csv are uploaded as tables in the dataset "2025_divvy_trip_data". Another table named 'overall_2025_divvy_tripdata' is created, combining the trip data for year 2025. There are total of 5,552,994 rows of data for the entire year. 

### Data Exploration (SQL #2)
SQL Query: Data Exploration (To embed link here) 


#### Part 1 - Understand the dataset
- total rows: 5,552,994
- total columns: 13
- schema/ data types

<img width="464" height="390" alt="Screenshot 2026-06-29 at 4 37 28 PM" src="https://github.com/user-attachments/assets/77f51954-917f-4ac3-883b-ad296e43e1b6" />

#### Part 2 - Data Quality
a. NULL values Check
  
  <img width="1788" height="63" alt="Screenshot 2026-06-29 at 11 47 58 PM" src="https://github.com/user-attachments/assets/75840195-0e48-4b5e-9ab3-76f0490762cb" />
  - Both "start_station_name" and "start_station_id" have 1,184,673 missing values
  - Both "end_station_name" and "end_station_id" have 1,2453,305 missing values
  - Both "end_lat" and "end_lng" have 5,535 missing values
  
b. Blank values Check
    
  <img width="967" height="68" alt="Screenshot 2026-06-30 at 12 13 48 AM" src="https://github.com/user-attachments/assets/50c6ae3f-f400-4133-9db1-1a1d6e1c3e48" />

c. Duplicate values Check
    
  <img width="316" height="64" alt="Screenshot 2026-06-30 at 12 20 07 AM" src="https://github.com/user-attachments/assets/7e741660-c7ac-4299-a33a-5902abb7f922" />
  - Confirm that there are no duplicate values

#### Part 3 - Outlier Detection 
Understand the range of ride durations

<img width="445" height="56" alt="Screenshot 2026-06-30 at 12 38 08 AM" src="https://github.com/user-attachments/assets/d704eb20-b0e9-460e-b2fe-d69e04f500d7" />
  - Negative ride duration: min ride duration is negative, which means there is/are incorrect timestamps. This will be considered during data cleaning stage to be removed
  - Max ride duration: 94,494 seconds or 26.25 hours. Is this impossible? Someone could legitimately rent a bike for more than 1 day.
  - Average ride duration: 961 seconds or 16.02 minutes. This looks ok

Further inspection on the frequency for "negative duration", "zero duration" and "over 24 hours" ride.

<img width="445" height="65" alt="Screenshot 2026-06-30 at 12 43 26 AM" src="https://github.com/user-attachments/assets/fda822d8-7f28-43b4-9d72-576f59817b61" />

  - Negative duration: A ride cannot end before it starts. These are dirty data, needs to be removed during cleaning stage
  - Zero duration: There are 1,808 rides with zero duration. Need further inspection
  - Over 24 hours: There are 5,585 rides (which is ~0.1% of total data), these look ok. Could be rare case, not necessarily data errors.

Further inspection on Zero duration: 

<img width="1465" height="563" alt="Screenshot 2026-06-30 at 12 56 12 AM" src="https://github.com/user-attachments/assets/fca4fc1e-e609-4a55-8012-b625a2e19a70" />

  - Zero-duration rides may be caused by various factors, such as system errors, failed bike unlocks, or user cancellations. However, the available dataset does not provide sufficient information to determine the exact cause. As these records do not represent meaningful bicycle usage and would distort ride duration analysis, they will be removed during the data cleaning stage.

#### Part 4 - Column Exploration
- ride_id: Previously verified to be unique, no duplicate values. So this can be used reliably as the unique identifier
- rideable_type: There are only 2 bike types available, electric and classic. Electric bike shares around ~65% and that leaves classic with ~35%
- member_casual: There are 2 riders categories as expected. Members account for ~64% and casual riders ~36%

Remark: The column exploration focused on these three columns as they are the most relevant to the business objective and overall data quality. ride_id was verified to be unique, while rideable_type and member_casual were explored to understand the available bike types and rider groups. The remaining columns will be analyzed later if they contribute to answering the business question.

### Data Cleaning (SQL #3)
- Remove rides with zero and negative ride durations

### Analysis & Share (SQL #4)
- To answer the business question: How do annual members and casual riders use Cyclistic bikes differently? I have listed down a few analysis to study their usage behaviours.
    1. Membership shares
    2. Bike type shares
    3. Bike ride duration 
    4. Time/date of bike ride (e.g. hour, weekday/weekend)
    5. Usage throughout the year
    6. Top stations
 
- In order to perform the analysis above, we will need to create new columns. We will create a analysis table so that we only need to run the calculation one time. The following columns will need to be computed and added to this analysis table,
    1. ride_length_min
    2. ride_hour: 0 - 23
    3. weekday_num: 1 - 7
    4. weekday_name: Monday - Sunday
    5. day_type: Weekday/ Weekend
    6. month_num: 1 - 12
    7. month_name: January - December (For better readability)
 
#### a. Membership Shares

<img width="518" height="88" alt="Screenshot 2026-06-30 at 11 23 21 AM" src="https://github.com/user-attachments/assets/b084ed81-9f30-4262-8e4e-a62e5138e99f" />

Observation: Annual members accounted for 64% for all rides, while casual riders accounted for the remaining 36%.
Insights: Annual members accounted for nearly two-third of all rides in year 2025, indicating that memberships are the primary driver of Cyclistic's ridership. However, there is still significant amount of casual riders, highlighting opportunity to convert them into annual members. 

#### b. Bike type shares
<img width="727" height="160" alt="Screenshot 2026-06-30 at 11 31 12 AM" src="https://github.com/user-attachments/assets/150bdfa3-10b9-45a3-bb4d-5016405e1f66" />

Observation: Both annual members and casual riders showed a preference for electric bikes over classic bikes. However, a substantial proportion of riders were still using classic bikes, indicating continued demand for both bike types.
Insights: Electric bikes are the prefrerred choice among both rider groups, suggesting they play an important role in Cyclistic's bike-sharing service. As classic bikes continue to account for a significant share of rides, maintaining an ideal proportion that meets the preference of both rider groups would help ensure customer demand is met. 

#### c. Bike ride duration

<img width="894" height="95" alt="Screenshot 2026-06-30 at 1 55 47 PM" src="https://github.com/user-attachments/assets/b85f6e44-17f6-445c-a2f6-a69fcb1299ec" />

Observation: Annual members generally took shorter rides than casual riders. The average ride duration for members was 12.33 minutes, compare with 22.60 minutes for casual riders. Similarly, the median ride duration was 8.55 minutes for members and 11.42 for casual riders. This shows that casual riders typically take longer trips than annual members.
Insights: Casual riders tend to use bike for longer trip, suggesting they are more liekly to ride for leisure. In contrast, annual members generally take shorter rides, which may indicate more routine or commuting-related usage.

#### d. Time/Date of bike ride
Time analysis:

<img width="368" height="518" alt="image" src="https://github.com/user-attachments/assets/87ba0552-757a-4b3c-b7dc-d279972cf88d" />
*With the help of gsheet pivot function, we can visualise the traffic throughout the day

Observation: Casual riders were most active between 11am-7pm, with riding activity peaking between 4pm-6pm. In contrast, annual members exhibited two distinct peak periods: a morning peak between 7am-8am, and a more pronounced evening peak between 3pm-7pm.

Insights:
The two distinct peak periods observed among annual members suggest regular commuting or routine travel during typical working hours. Casual riders, on the other hand, showed a more gradual increase in riding activity throughout the day, with demand concentrated in the afternoon and early evening, suggesting greater use for leisure or flexible trips.


Day analysis:
<img width="840" height="407" alt="Screenshot 2026-06-30 at 2 15 44 PM" src="https://github.com/user-attachments/assets/62052ebc-94f3-4f87-a5c1-d54c94c99af5" />

Observation: Casual riders showed higher riding activity during weekends, particularly on Saturday (20.72%) and Sunday (16.59%), with elevated activity also on Friday (16.01%). In contrast, annual members recorded a higher proportion consistently from Monday to Thursday, while weekend activity was comparatively lower.

Insights: The weekday distribution suggests that annual members are more liekly to use Cyclistic bikes as part of their regular routines, such as commuting or other recurring trips, wheareas casual riders exhibit stronger weekend riding patterns, suggesting their trips are more commonly associated with leisure purpose.

Month analysis:


















