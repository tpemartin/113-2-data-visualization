library(ggplot2)

# Sample plot
p <- ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  labs(title = "Grid Styling Demo", subtitle = "Customizing major and minor grid lines")

# Apply theme customization to show grid settings
p + theme(
  panel.background = element_rect(fill = "white"),
  panel.grid.major = element_line(color = "grey70", linewidth = 0.8),
  panel.grid.minor = element_line(color = "grey90", linewidth = 0.4, linetype = "dashed"),
  panel.grid.major.x = element_line(color = "blue"),
  panel.grid.major.y = element_line(color = "red"),
  panel.grid.minor.x = element_line(color = "lightblue"),
  panel.grid.minor.y = element_line(color = "pink"),
  panel.ontop = FALSE  # Set to TRUE to draw grid lines above the geoms
)
