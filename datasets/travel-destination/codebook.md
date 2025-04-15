# Codebook for Traveler Data

## Dataset link

<https://docs.google.com/spreadsheets/d/1tbwc7zuVcg3V72DzjFU8F19E7nZ_dsfjYP1ICiqcRcY/edit?gid=2027436314#gid=2027436314>

## Dataset Description

歷年中華民國國民出國目的地人數統計

## Dimension

782 obs. of 4 variables

## Variable Summary

| Variable Name        | Class       | Meaning                                 | Example              |
|----------------------|-------------|-----------------------------------------|----------------------|
| 首站抵達地           | Factor | The primary destination region of the travelers. In this case, all entries are "亞洲地區" (Asian Region). | 亞洲地區              |
| 細分                 | Factor | Further breakdown of destination, specifically the country. | 日本Japan            |
| Year                 | Numeric     | The year of the observation, ranging from 2002 to 2009. | 2006                 |
| Number_of_Travelers  | Numeric     | The number of travelers visiting Japan in the given year. Missing values are represented as "NA". | 1309847              |

## Notes
- Missing values (NA) indicate that data for the number of travelers is not available for that specific year.
- The dataset represents a single country within a specific region, focusing solely on traveler counts to Japan.

## Count summary

Below is the summary of `首站抵達地` (Arrival Destination) formatted into a one-row table in Markdown:

### Summary of 首站抵達地 (Arrival Destination)

| 首站抵達地 | Count |
| --- | --- |
| 亞洲地區 | 391 |
| 非洲地區 | 46 |
| 美洲地區 | 69 |
| 大洋洲地區 | 92 |
| 歐洲地區 | 184 |


Below is the summary of `細分` (Details) formatted into a three-column table in Markdown, starting from the specified format:

### Summary of 細分 (Details)

| 細分 | Count |
| --- | --- |
| 日本Japan | 23 |
| 韓國Korea | 23 |
| 香港Hong Kong | 23 |
| 中國大陸China | 23 |
| 澳門Macao | 23 |
| 越南Vietnam | 23 |
| 泰國Thailand | 23 |
| 馬來西亞Malaysia | 23 |
| 新加坡Singapore | 23 |
| 菲律賓Philippines | 23 |
| 汶萊Brunei | 23 |
| 印尼Indonesia | 23 |
| 柬埔寨Cambodia | 23 |
| 緬甸Myanmar | 23 |
| 阿拉伯聯合大公國UAE | 23 |
| 土耳其Turkey | 23 |
| 亞洲其他地區 Others | 23 |
| 南非S. Africa | 23 |
| 非洲其他地區 Others | 23 |
| 美國USA | 23 |
| 加拿大Canada | 23 |
| 美洲其他地區 Others | 23 |
| 澳洲Australia | 23 |
| 紐西蘭New Zealand | 23 |
| 帛琉Palau | 23 |
| 大洋洲其他地區 Others | 23 |
| 法國France | 23 |
| 德國Germany | 23 |
| 義大利Italy | 23 |
| 荷蘭Netherlands | 23 |
| 英國U.K. | 23 |
| 瑞士Switzerland | 23 |
| 奧地利Austria | 23 |
| 歐洲其他地區 Total | 23 |


### Summary of Numerical Statistics

| Year |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| Mean | Median | SD | Max | Min | Range | NA_Proportion |
| 2013 | 2013 | 6.637494861 | 2024 | 2002 | 22 | 0 |


| number_of_traveler |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| Mean | Median | SD | Max | Min | Range | NA_Proportion |
| 288267.7715 | 33000 | 747758.5439 | 6006116 | 0 | 6006116 | 0.2109974425 |


