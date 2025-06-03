library(ggplot2)

# Plot with minor breaks added
p <- ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_x_continuous(
    breaks = seq(2, 7, by = 1),                     # major ticks
    minor_breaks = seq(2, 7, by = 0.2),              # minor ticks
    guide=guide_axis(minor.ticks = TRUE)
  ) +
  scale_y_continuous(
    breaks = seq(10, 45, by = 5), 
    minor_breaks = seq(10, 45, by = 1),
    guide=guide_axis(minor.ticks = TRUE)
  ) +
  labs(title = "Major and Minor Ticks Demo")

# Theme customization for ticks
p + theme(
  # --- Major ticks ---
  axis.ticks = element_line(color = "black"),
  axis.ticks.x = element_line(color = "blue", linewidth = 0.8),
  axis.ticks.y = element_line(color = "darkgreen", linewidth = 0.8),
  
  # --- Minor ticks (specific sides) ---
  axis.minor.ticks.x.bottom = element_line(color = "lightblue", linewidth = 0.5),
  axis.minor.ticks.y.left = element_line(color = "lightgreen", linewidth = 0.5),
  
  # --- Lengths ---
  axis.ticks.length = unit(6, "pt"),
  axis.minor.ticks.length = unit(3, "pt")
)
