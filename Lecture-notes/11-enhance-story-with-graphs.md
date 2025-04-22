# Enhance Story with Graphs

## Choose highlight 

Choose the highlight points from the data summary report.

  - <https://github.com/tpemartin/113-2-data-visualization/blob/7d2f3e1e7f87ea32e04a671ae912d03b1a4b4e15/datasets/travel-destination/reports/data-summary.md>

***

挑選有趣的重點：

  - 時間序列分析揭示出亞洲長期居於主導地位。  
  - 歷年平均旅客人數排名，前五大目的地全數位於東亞地區。

---

## Design graphs

將重點及其依據的json交給AI, 請AI設定可以強調這些重點的圖表。


### Key elements

:exclamation: 圖形要能self-explain，所以**一定要**有以下的良好標記：
  - title: 標題清楚說明故事主題  
  - subtitle: 度量的定義  
  - caption: 數據來源

座標軸不使用變數名稱，而是中文易讀的名稱。

> 在codebook加上數據來源，這樣AI的每張圖都可以自動生成caption。

### Output

:exclamation: 圖形要考慮輸出的環境。

圖形輸出必須適合A4紙張印刷，且標題字體大小要為12pt，內文字體大小要為10pt，其寛高比例要維持4:3。

---

### Prompt context

每一張圖都必需要有適當的title, subtitle, caption，規定如下：
  - title: 標題清楚說明故事主題  
  - subtitle: 度量的定義  
  - caption: 數據來源

圖形輸出圖形輸出必須適合A4紙張印刷，且標題字體大小要為12pt，內文字體大小要為10pt，其寛長比例要維持4:3。

## Next... 

Pick an angle to cut in further.

下一個切入點是進一步聚焦在亞洲地區的旅遊趨勢。