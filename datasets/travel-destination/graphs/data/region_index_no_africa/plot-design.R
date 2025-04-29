library(tidyverse)
library(ggrepel)

## First design ------

# Load data
region_index_data <- jsonlite::read_json("datasets/travel-destination/graphs/data/region_index_no_africa.json", simplifyVector = TRUE)

# Convert to tibble
region_index_df <- tibble::as_tibble(region_index_data)

# Create a highlight variable
region_index_df <- region_index_df |>
  dplyr::mutate(
    highlight = dplyr::if_else(region == "亞洲地區", "highlight", "normal")
  )

# Plot
ggplot(region_index_df, aes(x = year, y = index, color = region, group = region)) +
  geom_line(aes(linewidth = highlight)) +
  geom_point(data = dplyr::filter(region_index_df, year %in% c(2019, 2021, 2024)), size = 2) +
  ggrepel::geom_text_repel(
    data = dplyr::filter(region_index_df, year %in% c(2019, 2021, 2024)),
    aes(label = paste0(region, "\n", round(index, 1))),
    size = 3,
    nudge_y = 10
  ) +
  geom_hline(yintercept = 100, linetype = "dashed", color = "black") +
  annotate(
    "rect",
    xmin = 2020, xmax = 2022,
    ymin = -Inf, ymax = Inf,
    alpha = 0.2, fill = "gray"
  ) +
  scale_linewidth_manual(values = c("highlight" = 1.2, "normal" = 0.8), guide = "none") +
  scale_color_manual(
    values = c(
      "亞洲地區" = "red",
      "大洋洲地區" = "skyblue",
      "歐洲地區" = "blue",
      "美洲地區" = "green"
    )
  ) +
  labs(
    title = "各地區旅遊指數變化（以2008年=100為基期）",
    subtitle = "亞洲地區成長最為明顯，疫情期間全面下滑後迅速回升",
    x = "年份",
    y = "指數（2008=100）",
    color = "地區"
  ) +
  theme_minimal() +
  theme(
    text = element_text(family = "Noto Sans TC"),
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10)
  )

## second design -----

library(tidyverse)
library(ggrepel)

# Create role variable
region_index_df <- region_index_df |>
  dplyr::mutate(
    role = dplyr::case_when(
      region == "亞洲地區" ~ "main",
      region == "歐洲地區" ~ "secondary",
      TRUE ~ "background"
    )
  )

# Create color mapping
color_mapping <- c(
  "亞洲地區" = "orangered",
  "歐洲地區" = "deepskyblue",
  "大洋洲地區" = "grey60",
  "美洲地區" = "grey70"
)

# Set line size based on role
size_mapping <- c(
  "main" = 1.5,
  "secondary" = 1.2,
  "background" = 0.8
)

# Plot
ggplot() +
  # Background first
  geom_line(
    data = dplyr::filter(region_index_df, role == "background"),
    aes(x = year, y = index, group = region, color = region, linewidth = role),
    alpha = 0.7
  ) +
  # Secondary role
  geom_line(
    data = dplyr::filter(region_index_df, role == "secondary"),
    aes(x = year, y = index, group = region, color = region, linewidth = role)
  ) +
  # Main role
  geom_line(
    data = dplyr::filter(region_index_df, role == "main"),
    aes(x = year, y = index, group = region, color = region, linewidth = role)
  ) +
  geom_point(
    data = dplyr::filter(region_index_df, year %in% c(2019, 2021, 2024)),
    aes(x = year, y = index, color = region),
    size = 2
  ) +
  ggrepel::geom_text_repel(
    data = dplyr::filter(region_index_df, year %in% c(2019, 2021, 2024)),
    aes(x = year, y = index, label = paste0(region, "\n", round(index, 1)), color = region),
    size = 3,
    nudge_y = 10,
    show.legend = FALSE
  ) +
  geom_hline(yintercept = 100, linetype = "dashed", color = "black") +
  annotate(
    "rect",
    xmin = 2020, xmax = 2022,
    ymin = -Inf, ymax = Inf,
    alpha = 0.2, fill = "grey80"
  ) +
  scale_color_manual(values = color_mapping) +
  scale_linewidth_manual(values = size_mapping) +
  labs(
    title = "各地區旅遊指數變化（以2008年=100為基期）",
    subtitle = "亞洲地區成長最為明顯，疫情期間全面下滑後迅速回升",
    x = "年份",
    y = "指數（2008=100）",
    color = "地區"
  ) +
  theme_minimal() +
  theme(
    text = element_text(family = "Noto Sans TC"),
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    legend.position = "none"
  )

## Ready for export -----

library(tidyverse)
library(ggrepel)

# Plot
region_index_plot <- ggplot() +
  # Background first
  geom_line(
    data = dplyr::filter(region_index_df, role == "background"),
    aes(x = year, y = index, group = region, color = region, linewidth = role),
    alpha = 0.7
  ) +
  # Secondary role
  geom_line(
    data = dplyr::filter(region_index_df, role == "secondary"),
    aes(x = year, y = index, group = region, color = region, linewidth = role)
  ) +
  # Main role
  geom_line(
    data = dplyr::filter(region_index_df, role == "main"),
    aes(x = year, y = index, group = region, color = region, linewidth = role)
  ) +
  geom_point(
    data = dplyr::filter(region_index_df, year %in% c(2019, 2021, 2024)),
    aes(x = year, y = index, color = region),
    size = 2
  ) +
  ggrepel::geom_text_repel(
    data = dplyr::filter(region_index_df, year %in% c(2019, 2021, 2024)),
    aes(x = year, y = index, label = paste0(region, "\n", round(index, 1)), color = region),
    size = 8,
    nudge_y = 1,
    show.legend = FALSE
  ) +
  geom_hline(yintercept = 100, linetype = "dashed", color = "black") +
  annotate(
    "rect",
    xmin = 2020, xmax = 2022,
    ymin = -Inf, ymax = Inf,
    alpha = 0.2, fill = "grey80"
  ) +
  scale_color_manual(values = color_mapping) +
  scale_linewidth_manual(values = size_mapping) +
  labs(
    title = "各地區旅遊指數變化（以2008年=100為基期）",
    subtitle = "亞洲地區成長最為明顯，疫情期間全面下滑後迅速回升",
    x = "年份",
    y = "指數（2008=100）",
    color = "地區"
  ) +
  theme_minimal() +
  theme(
    text = element_text(family = "Noto Sans TC", size = 12),
    plot.title = element_text(size = 16, face = "bold"),
    plot.subtitle = element_text(size = 13),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10),
    legend.position = "none"
  )

# Save the plot
ggsave(
  filename = "region_index_plot.png",
  plot = region_index_plot,
  width = 6,         # inches
  height = 4,        # inches
  dpi = 300,         # high quality for publication
  units = "in"
)

## adjust font sizes ----

region_index_plot <- region_index_plot +
  theme(
    text = element_text(family = "Noto Sans TC", size = 14),
    plot.title = element_text(size = 20, face = "bold"),
    plot.subtitle = element_text(size = 16),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12),
    legend.title = element_text(size = 14),
    legend.text = element_text(size = 12),
    legend.position = "none"
  )

# Save the plot
ggsave(
  filename = "region_index_plot.png",
  plot = region_index_plot,
  width = 6,         # inches
  height = 4,        # inches
  dpi = 300,         # high quality for publication
  units = "in"
)


## manual adjust font sizes-----

a <- 1.5

region_index_plot <- region_index_plot +
  theme(
    text = element_text(family = "Noto Sans TC", size = 14*a),
    plot.title = element_text(size = 20*a, face = "bold"),
    plot.subtitle = element_text(size = 16*a),
    axis.title = element_text(size = 14*a),
    axis.text = element_text(size = 12*a),
    legend.title = element_text(size = 14*a),
    legend.text = element_text(size = 12*a),
    legend.position = "none"
  )

# Save the plot
ggsave(
  filename = "region_index_plot.png",
  plot = region_index_plot,
  width = 6,         # inches
  height = 4,        # inches
  dpi = 300,         # high quality for publication
  units = "in"
)
