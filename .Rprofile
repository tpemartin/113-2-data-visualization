if (!requireNamespace("showtext", quietly = TRUE)) {
  install.packages("showtext")
}
if (!requireNamespace("sysfonts", quietly = TRUE)) {
  install.packages("sysfonts")
}

library(showtext)
library(sysfonts)

sysfonts::font_add_google('Noto Sans TC')
showtext_auto()

theme_set(
  theme(
    text = element_text(family = "Noto Sans TC")
  ) + 
  theme_classic()
)