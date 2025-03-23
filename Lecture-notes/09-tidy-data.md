# Tidy Data

## Data pipeline

```mermaid
flowchart TD
  classDef pink fill:#FFC0CB,stroke:#000,stroke-width:2px;
  A["Local Dataset"] --> B["Generate Codebook"]
  B --> B2["Upload data 
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
  F -- No --> H["Data inventory take"]

  class F pink;
```

  - In each arrow step, you choose to do it manually or through programming code.

## Clean up variables

https://github.com/tpemartin/113-2-econDV-demo/blob/881077f558613c4ceecfceef797be13d1fa9c7b5/travel-destination/reshape/reshaped_travel_data/codebook-reshaped_travel_data.md?plain=1#L29-L31

https://github.com/tpemartin/113-2-econDV-demo/blob/881077f558613c4ceecfceef797be13d1fa9c7b5/travel-destination/reshape/reshaped_travel_data/codebook-reshaped_travel_data.md?plain=1#L37-L66

## Upload data to Google Sheets


### Another way to connect data

  - [Connecting data in Looker Studio](lookerstudio-connect-data.md)

## Data Inventory take



