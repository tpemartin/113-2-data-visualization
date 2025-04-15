reshaped_travel_data <- read_sheet("https://docs.google.com/spreadsheets/d/1tbwc7zuVcg3V72DzjFU8F19E7nZ_dsfjYP1ICiqcRcY/edit?gid=2027436314#gid=2027436314",
                                   sheet = "reshaped_travel_data")

library(dplyr)
library(forcats)

reshaped_travel_data <- reshaped_travel_data |>
  mutate(
    `首站抵達地` = as.factor(`首站抵達地`),
    `細分` = as.factor(`細分`),
    Year = as.integer(Year),
    Number_of_Travelers = as.numeric(Number_of_Travelers)
  )

# single variable summary
summarise_variable <- function(x) {
  variable_class <- class(x)[1]
  
  if (variable_class %in% c("factor", "ordered")) {
    tibble(
      class = variable_class,
      levels = list(as.list(table(x))),  # Convert table to named list
      na_count = sum(is.na(x)),
      na_proportion = mean(is.na(x))
    )
  } else if (variable_class %in% c("character")) {
    tibble(
      class = variable_class,
      unique_values = list(unique(na.omit(x))),
      n_unique = n_distinct(x, na.rm = TRUE),
      na_count = sum(is.na(x)),
      na_proportion = mean(is.na(x))
    )
  } else if (variable_class %in% c("numeric", "integer")) {
    tibble(
      class = variable_class,
      mean = mean(x, na.rm = TRUE),
      median = median(x, na.rm = TRUE),
      sd = sd(x, na.rm = TRUE),
      min = min(x, na.rm = TRUE),
      max = max(x, na.rm = TRUE),
      range = max(x, na.rm = TRUE) - min(x, na.rm = TRUE),
      na_count = sum(is.na(x)),
      na_proportion = mean(is.na(x))
    )
  } else {
    tibble(
      class = variable_class,
      note = "Unsupported class type",
      na_count = sum(is.na(x)),
      na_proportion = mean(is.na(x))
    )
  }
}

# Apply to all columns
tidy_variable_summary <- reshaped_travel_data |>
  summarise(across(everything(), summarise_variable, .names = "summary_{.col}")) |>
  pivot_longer(everything(), names_to = "variable", values_to = "summary") |>
  unnest_wider(summary)

library(jsonlite)

# Save the summary to JSON file
write_json(
  x = list(
    description = "Summarises each variable in `reshaped_travel_data` based on their class, including missing values.",
    operations = "summarise(across()), class(), mean(), median(), sd(), min(), max(), table(), is.na(), n_distinct()",
    summary = tidy_variable_summary
  ),
  path = "variable-summary.json",
  pretty = TRUE,
  auto_unbox = TRUE
)

# multiple variables summaries -----

## 1. Yearly total travelers by region----

yearly_total_by_region <- reshaped_travel_data |>
  dplyr::filter(!is.na(Number_of_Travelers)) |>
  dplyr::group_by(Year, `首站抵達地`) |>
  dplyr::summarise(total_travelers = sum(Number_of_Travelers), .groups = "drop")

jsonlite::write_json(
  list(
    description = "Total number of travelers by year and region (`首站抵達地`).",
    operations = "filter(!is.na()), group_by(Year, 首站抵達地), summarise(sum)",
    summary = yearly_total_by_region
  ),
  path = "yearly-total-by-region.json",
  pretty = TRUE,
  auto_unbox = TRUE
)

## 2. Top 5 destinations with highest average travelers ----

top5_avg_destinations <- reshaped_travel_data |>
  dplyr::filter(!is.na(Number_of_Travelers)) |>
  dplyr::group_by(`細分`) |>
  dplyr::summarise(avg_travelers = mean(Number_of_Travelers), .groups = "drop") |>
  dplyr::arrange(desc(avg_travelers)) |>
  dplyr::slice_head(n = 5)

jsonlite::write_json(
  list(
    description = "Top 5 destinations by average number of travelers across all years.",
    operations = "filter(!is.na()), group_by(細分), summarise(mean), arrange(desc), slice_head(n = 5)",
    summary = top5_avg_destinations
  ),
  path = "top5-avg-destinations.json",
  pretty = TRUE,
  auto_unbox = TRUE
)

## 3. Missing rate by variable -----

missing_summary <- reshaped_travel_data |>
  purrr::map_dfr(~tibble(
    na_count = sum(is.na(.x)),
    na_proportion = mean(is.na(.x))
  ), .id = "variable")

jsonlite::write_json(
  list(
    description = "Missing value count and proportion for each variable.",
    operations = "map_dfr over columns with is.na() summary",
    summary = missing_summary
  ),
  path = "missing-summary.json",
  pretty = TRUE,
  auto_unbox = TRUE
)

