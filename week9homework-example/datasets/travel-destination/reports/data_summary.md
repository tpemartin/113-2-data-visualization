
# Data Description and Summary

The dataset used in this study originates from the Ministry of Transportation and Communications, Taiwan, and records the **annual number of Taiwanese outbound travelers by primary destination**. Each observation identifies the traveler's first arrival region (`首站抵達地`) and a more detailed subdivision (`細分`), across the time span from **2002 to 2024**, yielding a total of **782 observations** as stated in the [codebook](codebook.md).

There are **four key variables** in the dataset:  

1. `首站抵達地` (Arrival Region): a factor variable comprising five regions—亞洲地區, 非洲地區, 美洲地區, 大洋洲地區, and 歐洲地區—with 亞洲地區 being the most prevalent (391 records).

2. `細分` (Destination Details): another factor variable with 34 levels including "日本Japan", "中國大陸China", and "香港Hong Kong", each appearing 23 times.

3. `Year`: an integer variable indicating the calendar year, ranging from **2002 to 2024** with a mean and median of **2013**, and a standard deviation of 6.64.

4. `Number_of_Travelers`: a numeric variable capturing the total number of travelers for a given destination-year pair. This variable exhibits high dispersion with a **mean of 288,268**, a **median of 33,000**, and values ranging from **0 to over 6 million**. The missing rate is significant at **21.1%**, due to unreported entries in certain years or destinations.

# Temporal and Regional Dynamics

A detailed aggregation of travelers by region and year reveals a **sharp growth in Asian-bound travel** from 2005 onwards, peaking in 2024 with **over 15 million outbound travelers** recorded for Asian destinations alone. Conversely, African destinations consistently received minimal Taiwanese travelers, with many years reporting fewer than 50 entries. Travel to Europe, Oceania, and the Americas also exhibited growth over time but at a slower rate relative to Asia.

# Top Destinations

A ranking of destinations by their **average number of travelers across all years** highlights the dominance of East Asian countries. **Japan** emerges as the most visited country with a **mean of over 2.68 million travelers per year**, followed by **China** and **Hong Kong**. These top three destinations are reflective of Taiwan’s geographic proximity, cultural ties, and strong economic relations with these countries.

# Data Quality and Missingness

An evaluation of data completeness reveals that while `首站抵達地`, `細分`, and `Year` are fully observed across all records, the `Number_of_Travelers` variable contains **165 missing entries**, corresponding to over one-fifth of the dataset. Researchers should account for this in model specification, possibly by applying multiple imputation or limiting analyses to complete cases depending on the purpose of estimation.

# References

- [Codebook](codebook.md)
- [Single-variable summary](single-variable-summary.json)
- [Yearly total by region](yearly-total-by-region.json)
- [Top 5 destinations](top5-avg-destinations.json)
- [Missing summary](missing-summary.json)
