library(sf)

# 資料位置（請確認檔案已下載並放在正確路徑）
taiwan_shp_filepath <- "~/Documents/GitHub/113-2-data-visualization/datasets/taiwan-maps/直轄市、縣(市)界線1140318/COUNTY_MOI_1140318.shp"

# 讀取 SHP 為 sf object
taiwan_sf <- st_read(taiwan_shp_filepath)

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

codebook <- generate_sf_codebook(taiwan_sf, dataset_name = "Taiwan County Boundaries (MOI 1140318)")

# 儲存 JSON 檔
write(
  toJSON(codebook, pretty = TRUE, auto_unbox = TRUE),
  file = "taiwan_sf_codebook.json"
)

## initial plot------

library(ggplot2)
library(sf)

# Assuming taiwan_sf is already loaded as a simple feature (sf) object
ggplot(data = taiwan_sf) +
  geom_sf(fill = "lightblue", color = "black") +
  labs(title = "Taiwan County Boundaries",
       subtitle = "Source: MOI 1140318") +
  theme_minimal()

## crop----

library(ggplot2)
library(sf)

ggplot(data = taiwan_sf) +
  geom_sf(fill = "lightblue", color = "black") +
  coord_sf(
    xlim = c(118, NA),  # 118E以東
    ylim = c(21, NA)    # 21N以北
  ) +
  labs(title = "Taiwan County Boundaries (Clipped)",
       subtitle = "Filtered to lat ≥ 21N and lon ≥ 118E") +
  theme_minimal()

## simplify ----

library(sf)
library(rmapshaper)

# 對 taiwan_sf 進行簡化
taiwan_sf_simple <- rmapshaper::ms_simplify(taiwan_sf, keep = 0.05, keep_shapes = TRUE)

ggplot(data = taiwan_sf_simple) +
  geom_sf(fill = "lightblue", color = "black") +
  coord_sf(xlim = c(118, 123.5), ylim = c(21, 26.5)) +
  labs(title = "Simplified Taiwan County Boundaries") +
  theme_minimal()

## 面量圖----

library(dplyr)
library(ggplot2)

# 選出男性資料
male_marriage <- marriage |>
  dplyr::filter(sex == "男")

# 合併地圖與統計資料： site_id <-> COUNTYNAME
taiwan_map_marriage <- taiwan_sf_simple |>
  left_join(male_marriage, by = c("COUNTYNAME" = "site_id"))

ggplot(taiwan_map_marriage) +
  geom_sf(aes(fill = average_age), color = "white") +
  scale_fill_viridis_c(name = "男性平均初婚年齡", option = "C") +
  coord_sf(xlim = c(118, 123.5), ylim = c(21, 26.5)) +
  labs(title = "112年台灣各縣市男性平均初婚年齡",
       subtitle = "資料來源：戶政統計資料") +
  theme_minimal()

### 面量圖 2----
library(ggplot2)

ggplot(taiwan_map_marriage) +
  geom_sf(aes(fill = average_age), color = "white") +
  scale_fill_gradient(
    name = "男性平均初婚年齡",
    low = "#c6dbef",   # 淺藍
    high = "#08306b"   # 深藍
  ) +
  coord_sf(xlim = c(118, 123.5), ylim = c(21, 26.5)) +
  labs(
    title = "112年台灣各縣市男性平均初婚年齡",
    subtitle = "使用 muted blue 漸層",
    caption = "https://data.gov.tw/dataset/160207"
  ) +
  theme_minimal()
