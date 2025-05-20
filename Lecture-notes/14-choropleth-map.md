# Choropleth map

## R

  - 生成初婚資料codebook <https://chatgpt.com/share/682bfc91-1c68-8006-97b7-b7c115af1e90>
  - 與simple feature結合 <https://chatgpt.com/share/682bfcdd-fbf4-8006-9052-7a14f9b1c6e9>

:exclamation: **請注意** `join`的主資料集必須是`sf`物件，否則合併後的data frame會失去`sf`的屬性而無法使用`geom_sf()`繪圖。



## Looker Studio

[<img src="../img/2025-05-20-11-51-51.png" width="500">](https://lookerstudio.google.com/reporting/1b1f1d14-ce20-412f-be09-76262a4f15ac
)

  - field type: GEO
  - color metric vs. color dimension  
  - filter