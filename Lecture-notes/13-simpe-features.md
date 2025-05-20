# 📘 教學講義：Simple Feature 與自動產生 Codebook（JSON）

## 🧭 1. Simple Feature 是什麼？

`Simple Feature`（簡稱 `sf`）是地理空間資料在 R 語言中常用的資料框類型。每一筆資料可以包含一個幾何圖形（如點、線、多邊形），並與其他屬性資料（欄位）整合成一個資料框。

其特徵包括：

| 特性             | 說明 |
|------------------|------|
| 幾何欄位          | 有一個欄位儲存 `POINT`、`POLYGON` 等空間圖形物件 |
| CRS（座標參考系）| 支援 EPSG/PROJ 轉換 |
| 支援 ggplot2     | 搭配 `geom_sf()` 繪圖 |
| 支援空間操作     | 使用 `st_*()` 函數進行緩衝、交集、距離等空間計算 |

---

## 📂 2. 資料來源與匯入

  - [直轄市、縣市界線(TWD97經緯度)](https://data.gov.tw/dataset/7442)

> 開放資料平台可篩選檔案格式shp會列出更多地理資料

```r
library(sf)

# 資料位置（請確認檔案已下載並放在正確路徑，要和所有解壓縮檔案放一起）
taiwan_shp_filepath <- "COUNTY_MOI_1140318.shp"

# 讀取 SHP 為 sf object
taiwan_sf <- st_read(taiwan_shp_filepath)
```

---

## 🔍 3. 查看基本結構

```r
taiwan_sf
```

與data frame的結構類似，但有一個幾何欄位（`geometry`），這是 `sf` 物件的關鍵。此外，它還有其他meta data:

  - CRS（Coordinate Reference System）  
  - Bounding Box（邊界框）

---

AI >
> 我有一個sf object `taiwan_sf`，如何產生它的codebook（要包含CRS及bounding box資訊）並以JSON格式儲存？

## 📘 4. 自動產生 Codebook JSON 的函數

```r
library(dplyr)
library(tidyr)
library(purrr)
library(jsonlite)

generate_sf_codebook <- function(sf_obj, dataset_name = "sf_object") {
  col_info <- sf_obj |>
    st_drop_geometry() |>
    summarise(across(everything(), ~class(.x)[1])) |>
    pivot_longer(everything(), names_to = "variable", values_to = "class")

  geom_col <- attr(sf_obj, "sf_column")
  col_info <- bind_rows(
    col_info,
    tibble(variable = geom_col, class = class(sf_obj[[geom_col]])[1])
  )

  crs_info <- st_crs(sf_obj)
  bbox_info <- st_bbox(sf_obj)
  geom_type <- unique(st_geometry_type(sf_obj))

  list(
    dataset = dataset_name,
    n_row = nrow(sf_obj),
    n_col = ncol(sf_obj),
    variables = col_info |> mutate(across(everything(), as.character)),
    geometry_metadata = list(
      geom_column = geom_col,
      crs_epsg = crs_info$epsg,
      crs_proj4 = crs_info$proj4string,
      geometry_type = as.character(geom_type),
      bbox = as.list(bbox_info)
    )
  )
}
```

---

## 💾 5. 儲存為 JSON

```r
codebook <- generate_sf_codebook(taiwan_sf, dataset_name = "Taiwan County Boundaries (MOI 1140318)")

# 儲存 JSON 檔
write(
  toJSON(codebook, pretty = TRUE, auto_unbox = TRUE),
  file = "taiwan_sf_codebook.json"
)
```

---

## 📊 6. 使用 `sf` 繪圖

<https://chatgpt.com/share/682bfcdd-fbf4-8006-9052-7a14f9b1c6e9>