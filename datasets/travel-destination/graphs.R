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library(jsonlite)
library(tibble)
library(dplyr)
library(ggplot2)
library(scales)

# 讀取與轉換資料
yearly_data <- jsonlite::read_json("yearly-total-by-region.json", simplifyVector = TRUE)$summary |>
  tibble::as_tibble() |>
  dplyr::rename(year = Year, region = `首站抵達地`) |>
  dplyr::filter(year > 2007)

top5_data <- jsonlite::read_json("top5-avg-destinations.json", simplifyVector = TRUE)$summary |>
  tibble::as_tibble() |>
  dplyr::rename(destination = `細分`, avg_travelers = avg_travelers)

# 圖一：區域旅客趨勢圖 ----
plot_region <- ggplot(yearly_data, aes(x = year, y = total_travelers, color = region)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "臺灣出境旅客的主要目的地",
    subtitle = "2008年以後各區域首站抵達地的旅客總數",
    caption = "資料來源：交通部觀光署",
    x = "年份", y = "旅客總人數"
  ) +
  scale_y_continuous(labels = comma) +
  theme_minimal(base_size = 10) +
  theme(
    plot.title = element_text(size = 12, face = "bold"),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8),
    legend.title = element_blank()
  )

ggsave("region_trend.png", plot = plot_region, width = 8.5 * 0.8, height = 8.5 * 0.6, dpi = 300)

# 圖二：平均旅客數前五大目的地 -----
plot_top5 <- ggplot(top5_data, aes(x = reorder(destination, avg_travelers), y = avg_travelers)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "臺灣出境旅客東亞目的地首選",
    subtitle = "歷年平均旅客人數前五名的目的地",
    caption = "資料來源：交通部觀光署",
    x = "目的地", y = "平均旅客人數"
  ) +
  scale_y_continuous(labels = comma) +
  theme_minimal(base_size = 10) +
  theme(
    plot.title = element_text(size = 12, face = "bold"),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8)
  )

ggsave("top5_avg_destinations.png", plot = plot_top5, width = 8.5 * 0.8, height = 8.5 * 0.6, dpi = 300)

# 指數化----

library(jsonlite)
library(tibble)
library(dplyr)
library(ggplot2)
library(scales)

# 讀取資料
yearly_data <- jsonlite::read_json("yearly-total-by-region.json", simplifyVector = TRUE)$summary |>
  tibble::as_tibble() |>
  dplyr::rename(year = Year, region = `首站抵達地`) |>
  dplyr::filter(year >= 2008)

# 計算基期：2008年的每區域值
base_2008 <- yearly_data |>
  dplyr::filter(year == 2008) |>
  dplyr::select(region, base_value = total_travelers)

# 合併基期值，計算指數（2008 = 100）
index_data <- yearly_data |>
  dplyr::left_join(base_2008, by = "region") |>
  dplyr::mutate(index = total_travelers / base_value * 100)

# 繪圖：以指數表達相對變化
plot_region_index <- ggplot(index_data, aes(x = year, y = index, color = region)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "各區域臺灣出境旅客指數變化（2008=100）",
    subtitle = "以2008年為基期，觀察各區域旅客總數的相對變化趨勢",
    caption = "資料來源：交通部觀光署",
    x = "年份", y = "旅客人數指數（2008 = 100）"
  ) +
  scale_y_continuous(labels = comma) +
  theme_minimal(base_size = 10) +
  theme(
    plot.title = element_text(size = 12, face = "bold"),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8),
    legend.title = element_blank()
  )

# 輸出圖檔
ggsave("region_trend_index.png", plot = plot_region_index, width = 8.5 * 0.8, height = 8.5 * 0.6, dpi = 300)

# 指數化排除非洲 ----

library(jsonlite)
library(tibble)
library(dplyr)
library(ggplot2)
library(scales)

# 讀取資料
yearly_data <- jsonlite::read_json("yearly-total-by-region.json", simplifyVector = TRUE)$summary |>
  tibble::as_tibble() |>
  dplyr::rename(year = Year, region = `首站抵達地`) |>
  dplyr::filter(year >= 2008, region != "非洲地區")  # 排除非洲地區

# 計算基期值（2008年）
base_2008 <- yearly_data |>
  dplyr::filter(year == 2008) |>
  dplyr::select(region, base_value = total_travelers)

# 計算指數（2008 = 100）
index_data <- yearly_data |>
  dplyr::left_join(base_2008, by = "region") |>
  dplyr::mutate(index = total_travelers / base_value * 100)

# 繪圖
plot_region_index <- ggplot(index_data, aes(x = year, y = index, color = region)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "各區域臺灣出境旅客指數變化（2008=100）",
    subtitle = "以2008年為基期，觀察各區域旅客總數的相對變化（不含非洲地區）",
    caption = "資料來源：交通部觀光署",
    x = "年份", y = "旅客人數指數（2008 = 100）"
  ) +
  scale_y_continuous(labels = comma) +
  theme_minimal(base_size = 10) +
  theme(
    plot.title = element_text(size = 12, face = "bold"),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8),
    legend.title = element_blank()
  )

# 儲存圖片
ggsave("region_trend_index_no_africa.png", plot = plot_region_index, width = 8.5 * 0.8, height = 8.5 * 0.6, dpi = 300)

# 輸出成json ----

library(jsonlite)

# 將 index_data 中的數值轉為基礎型別，然後儲存為 JSON
index_data |>
  dplyr::select(year, region, total_travelers, index) |>
  dplyr::mutate(
    year = as.integer(year),
    region = as.character(region),
    total_travelers = round(total_travelers),
    index = round(index, 2)
  ) |>
  jsonlite::write_json(
    path = "region_index_no_africa.json",
    pretty = TRUE,
    auto_unbox = TRUE
  )

