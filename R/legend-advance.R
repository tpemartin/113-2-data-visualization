library(ggplot2)

# Sample plot with multiple legends (use fill to show legend better)
p <- ggplot(mpg, aes(displ, hwy, color = class, fill = class)) +
  geom_point(shape = 21, size = 3) +
  labs(title = "Legend Advanced Justification Demo")

# Theme adjustments for advanced legend positioning
p + theme(
  legend.position = "inside",
  legend.position.inside = c(0.95, 0.05),  # bottom right inside plot
  legend.justification = c("right", "bottom"),
  legend.background = element_rect(fill = "gray95", color = "black"),
  legend.key = element_rect(fill = "white", color = "black")
)
