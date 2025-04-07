# Summary Table: multiple variables

## Table in Looker Studio

  [Connecting data in Looker Studio](lookerstudio-connect-data.md)

![](../img/2025-03-11-12-47-01.png)

Make a copy of the following dashboard:
[歷年中華民國國民出國目的地人數統計2002-2024 dashboard](https://lookerstudio.google.com/reporting/c0b8fea5-3335-4713-8b01-ed45cbf8f392)

### Dimension and Metrics in Looker

  - **Dimensions**: a field/fields that is/are used to group data
  - **Metric**: a field that is used to calculate data

> Dimensions呈現有多少可能的組別，Metrics 則是對這些組別進行某些field特徵計算。

<img src="../img/Metric-calculation.png" width="500px">

> slido: 把能呈現不同首站抵達地的旅客人數佔比的表格metric設定貼上來(dimension? metric? metric aggregation? comparison computation? etc.)

### Dimension and Metrics in R

  - **group by**: dimensions  
  - **summarise**: metrics

## Harness both tools

### Looker Studio to R

> 你可以把Looker Studio的設定，當成prompt predicate 的context來請求R程式碼。 

> slido: 如何下prompt得到可以呈現不同首站抵達地的旅客人數佔比的表格之R程式。
>

### R to Looker Studio

<https://github.com/tpemartin/113-2-econDV-demo/blob/9d041e4e8cdb3bc7b1f63bfeed435b8240b848eb/travel-destination/reshape/reshaped_travel_data/parsing_summary/travel_summary.R#L18-L31>

> slido: 問AI如何在Google Looker Studio得到相同的表

### Summary table to Google sheets

  - A data frame in R can always be exported to a Google sheets.  
  - Google sheets is easy for table editing and sharing.  
    - [Generate Markdown Table extension](https://workspace.google.com/marketplace/app/generatemarkdowntable/23306117760)


<img src="../img/2025-03-21-14-57-05.png" width="500px"/>

  - Spreadsheet link/shared link  
  - Sheet

```R
# import googlesheets4 library
library(googlesheets4)

# write data frame to Google Sheets
write_sheet(data, ss = "google-sheets-url", sheet = "sheet-name")
```


