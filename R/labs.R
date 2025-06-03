library(ggplot2)

ggplot(mpg, aes(x=displ, y=hwy)) +
  geom_point() +
  labs(
    x = "Engine Displacement (L)",
    y = "Highway Miles per Gallon (mpg)",
    title = "Engine Efficiency by Displacement",
    subtitle = "A comparison across vehicle classes",
    caption = "Source: ggplot2's mpg dataset"
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5, color = "navy"),
    plot.subtitle = element_text(size = 12, hjust = 0.5, color = "gray30"),
    plot.caption = element_text(size = 9, hjust = 1, face = "italic", color = "gray50")
  )
