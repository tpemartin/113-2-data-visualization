# Tidy Data

## Data pipeline

```mermaid
flowchart TD
  classDef pink fill:#FFC0CB,stroke:#000,stroke-width:2px;
  A["Local CSV Dataset"] --> B["Generate Codebook"]
  B --> B2["Upload CSV 
  to Looker Studio"]
  B --> C["Upload Data 
  to Google Sheets"]
  B2 --> D
  C --> D["Connect Data 
  in Looker Studio"]
  D --> D2["Parsing Data"]
  D2 --> E["Data Summary"]
  E --> F{"Anomaly?"}
  F -- Yes --> G["Clean up Data"]
  G --> A
  F -- No --> H["Data inventory taking "]

  class F pink;
```

  - In each arrow step, you choose to do it manually or through programming code.

## Upload Data to Google Sheets

先開一個Google sheets。

<img src="../img/2025-03-23-11-02-09.png" width="500px"/>

  - Upload `reshaped_travel_data.csv` to Google Sheets as `reshaped_travel_data` sheet.

> slido: 請貼上可以把`reshaped_travel_data`由R上傳到Google Sheets的程式碼。


## Connect data to Looker Studio

  - [Connecting data in Looker Studio](lookerstudio-connect-data.md)

## Parsing data

## Data summary

<img src="../img/2025-03-23-13-31-56.png" width="500px"/>


## Clean up variables

Factor levels should be:  
  - 互斥 (mutually exclusive)
  - 完整 (exhaustive)

https://github.com/tpemartin/113-2-econDV-demo/blob/881077f558613c4ceecfceef797be13d1fa9c7b5/travel-destination/reshape/reshaped_travel_data/codebook-reshaped_travel_data.md?plain=1#L29-L31

https://github.com/tpemartin/113-2-econDV-demo/blob/881077f558613c4ceecfceef797be13d1fa9c7b5/travel-destination/reshape/reshaped_travel_data/codebook-reshaped_travel_data.md?plain=1#L37-L66

  資料移除：  
    - `首站抵達地` 是 "全區"，或 
    - `細分` 中出現"合計"或"總計"字眼



> slide: 寫下你的prompt, 任務是得到能夠完成以下任務的程式：資料移除任務，並存成csv檔案同時上傳更新到Google Sheets。



## Upload data to Google Sheets (again)

  - Google Sheets更新後，與之連結的Looker Studio的資料也會更新(內訂15分鐘更新一次)；或

<img src="../img/2025-03-23-13-36-21.png" width="300px"/>



## Data inventory taking

  - 最終版的分析資料
  - 資料codebook  
  - 其他資料相關訊息

<https://classroom.google.com/c/Njg4NjgzMjEyOTI4/m/NzU5NzE4NDA5MzAw/details>