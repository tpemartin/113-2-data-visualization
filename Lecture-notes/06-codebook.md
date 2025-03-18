# Codebook

With proper codebook that describes variables, types, and meanings, we can better understand the dataset so can AI.

  - Have AI generate a codebook with Markdown table syntax.  
  - Confirm variable classes. 
  - Import the data and parse variables according to the codebook.  



```mermaid
graph TD
    A["`Data introduction`"] --> B{"`Will reshaping data help?`"}
    B -->|Yes| C["`Reshape data.`"]
    B -->|No| D["`Generate codebook`"]
    style D fill:#ffcccc
    D --> G["`Review codebook`"]
    C --> D
    G --> F[""`Data parsing`""]
    F --> H["`Data summary table`"]
```

[歷年中華民國國民出國目的地人數統計 reshaped](https://github.com/tpemartin/113-2-econDV-demo/blob/main/travel-destination/reshape/reshaped_travel_data/reshaped_travel_data.csv)

## Generate codebook

Key elements:  

  - A table of variable names, classes, and meanings (give some example if possible).
  - A brief description of the dataset.

## Review codebook

Review codebook (especially variable classes) before importing the data.

## Parsing data

When variable classes are correct as in codebook, you can aske AI for the code to parse the data accordingly. 

> I use R program and follow tidyverse style, and the R for data science book (https://r4ds.had.co.nz/) closely. The data is imported as `reshape_travel_data`. How to parse variables accordingly


## Summary

  - different classes of variables require different ways of summarization.

If you use the same chat that contains the information of variables, you can ask AI to summarize as:  

> For each variable, suggest me how to summarize to each variable's features.

## Final codebook

[Codebook for reshaped travel data](https://github.com/tpemartin/113-2-econDV-demo/blob/main/data/travel-destination/reshape/reshaped_travel_data/codebook-reshaped_travel_data.md)