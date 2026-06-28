# Google Data Analytics Capstone: Cyclistic Case Study
This is my documentation of a capstone project from https://www.coursera.org/learn/google-data-analytics-capstone

In this case study, I will perform data analysis for a fictional bike-share company named "Cyclistic", in order to help them attract more riders. In order to answer the key business questions, I will follow the steps of data analysis process: Ask, Prepare, Process, Analyse, Share, and Act.

**Quick Links:**
Data Source: [divvy-tripdata](divvy-tripdata.s3.amazonaws.com/index.html)

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
I will use Clclistic's historical trip data to analyse and identify patterns from Jan 2025 to Dec 2025, which can be downloaded from [divvy_tripdata](divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).
