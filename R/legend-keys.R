library(ggplot2)

# Sample plot with legend
p <- ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() +
  labs(title = "Legend Key and Background Demo")

# Apply legend key and background theming
p + theme(
  legend.background = element_rect(fill = "gray95", color = "black", linewidth = 0.5),
  legend.margin = margin(t = 10, r = 10, b = 10, l = 10),
  legend.key = element_rect(fill = "white", color = "black"),
  legend.key.size = unit(1.2, "cm"),
  legend.key.height = unit(1.5, "cm"),
  legend.key.width = unit(0.8, "cm"),
  legend.key.spacing = unit(0.5, "cm"),
  legend.key.spacing.x = unit(0.6, "cm"),
  legend.key.spacing.y = unit(0.3, "cm")
)

