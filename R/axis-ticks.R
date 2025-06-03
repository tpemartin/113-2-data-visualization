library(ggplot2)

p <- ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  labs(
    title = "Axis Title, Text, and Ticks Styling Demo",
    x = "Engine Displacement (litres)",
    y = "Highway MPG"
  ) +
  theme(
    # --- 3.1 Axis Titles ---
    axis.title = element_text(face = "bold", color = "steelblue", size = 14),
    axis.title.x = element_text(margin = margin(t = 10), angle = 0),
    axis.title.y = element_text(margin = margin(r = 10), angle = 90),
    
    # --- 3.2 Axis Tick Labels ---
    axis.text = element_text(color = "black"),
    axis.text.x = element_text(color = "blue", size = 10, angle = 45, hjust = 1),
    axis.text.y = element_text(color = "darkgreen", size = 10),
    
    # --- 3.3 Axis Ticks ---
    axis.ticks = element_line(color = "black"),
    axis.ticks.x = element_line(color = "blue"),
    axis.ticks.y = element_line(color = "darkgreen")
  )

p
