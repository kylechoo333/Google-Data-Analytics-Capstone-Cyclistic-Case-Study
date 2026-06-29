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
- NULL values
- Blank values
- Duplicate values

#### Part 3 - Outlier Detection 
- Negative ride duration
- Longer than 24 hours
- Less than 1 minute

#### Part 4 - Column Exploration
- ride_id
- rideable_type
- member_casual
- station names
- latitude/longtitude

### Data Cleaning (SQL #3)

### Analysis & Share (SQL #4)




