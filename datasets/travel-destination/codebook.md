# Codebook for Traveler Data

## Dataset link

  - <https://docs.google.com/spreadsheets/d/1tbwc7zuVcg3V72DzjFU8F19E7nZ_dsfjYP1ICiqcRcY/edit?gid=2027436314#gid=2027436314>

  - 原始資料連結： https://data.gov.tw/dataset/7325

## Source 

交通部觀光署

## Dataset Description

歷年中華民國國民出國目的地人數統計

## Dimension

578 obs. of 4 variables

## Variable Summary

| Variable Name        | Class       | Meaning                                 | Example              |
|----------------------|-------------|-----------------------------------------|----------------------|
| 首站抵達地           | Factor | The primary destination region of the travelers. In this case, all entries are "亞洲地區" (Asian Region). | 亞洲地區              |
| 細分                 | Factor | Further breakdown of destination, specifically the country. | 日本Japan            |
| Year                 | Numeric     | The year of the observation, ranging from 2002 to 2009. | 2006                 |
| Number_of_Travelers  | Numeric     | The number of travelers visiting Japan in the given year. Missing values are represented as "NA". | 1309847              |
