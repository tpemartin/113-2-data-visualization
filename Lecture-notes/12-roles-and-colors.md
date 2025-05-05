Here’s your lecture note completed and polished in **markdown** format, keeping your original style while making it feel complete and coherent:

---

# Roles and Colors

Main roles' principles for data visualization:

- **Easy to spot**
  - **On Top** (determined by the `levels` of the `factor` variable)
  - **Warm Colors** (e.g., red, orange)
- **Stand Out**
  - Use greater contrast in hue, saturation, or lightness relative to the background and other elements.
- **Consistent Emphasis**
  - Main roles should maintain consistent coloring across different plots or frames to build viewer expectation and recognition.

## An Example

![](https://infographics.economist.com/2025/20250426_WOC174/20250426_WOC174-Artboard_1_copy.png)

In this chart, the main focus is clearly highlighted using a **vivid warm color** for main character, **vivid cool color** for secondary main character, while the supporting data is shown in **muted or neutral tones**, allowing the key story to stand out effortlessly.

## Easy to Spot

To make main roles easy to spot, consider both **layer sequence** and **color strategy**:

- **主要角色 (Key Actors)**

  - Should be **layered on top** to catch attention first.
  - Should use **brighter or warmer colors** (higher chroma, e.g., reds, oranges) to visually pop.
  - Should have **higher contrast** compared to the background and surrounding elements.

- **配角 (Supporting Actors)**

  - Should be **below** main actors in layer order.
  - Should use **cooler**, **less saturated**, or **lower lightness (L)** colors to avoid competing with the main role.
  - Should appear more "background-like" without disappearing entirely — subtle but still visible for context.

## Practical Tips

- **Control Layering with **``** Levels:**\
  Arrange your `factor()` levels so that important categories come last — ggplot2 will draw later levels on top.

### Example: How `factor()` Levels Affect Trace Order

Suppose you have a dataset with categories `"Main"`, `"Support1"`, and `"Support2"`.

```r
library(ggplot2)
library(dplyr)

# Example data
data <- tibble(
  category = factor(c("Support1", "Support2", "Main"), levels = c("Support1", "Support2", "Main")),
  value = c(10, 8, 15)
)

# Plot
ggplot(data, aes(x = 1, y = value, fill = category)) +
  geom_col(position = "stack") +
  coord_flip() +
  scale_fill_manual(values = c("grey70", "grey50", "red")) +
  theme_minimal()
```

Here, **"Main"** is drawn last and appears on top because it is placed last in the `levels` order.

- **Use Color Scales Thoughtfully:**\
  Use color palettes (e.g., `scale_color_manual()`, `scale_fill_manual()`) to assign warm, vivid colors to main roles and cooler, muted colors to others.

- **Test Your Plot in Grayscale:**\
  This can help ensure that even without color, the visual hierarchy (main role vs supporting role) is clear through brightness and layering.

## Summary

Highlighting the **main role** correctly through **layering**, **warm colors**, and **higher lightness/contrast** makes your data visualization more readable and effective. The audience should immediately recognize what matters most without confusion.

## Example

Get the following documents from <https://github.com/tpemartin/113-2-data-visualization/tree/9e56f0ee18d22ed3d0fc42dfdb185a716720b5d8/datasets/travel-destination>

  - [datasets/travel-destination/codebook.md](https://github.com/tpemartin/113-2-data-visualization/blob/main/datasets/travel-destination/codebook.md)  
  - [datasets/travel-destination/import-parsing-summary.R](https://github.com/tpemartin/113-2-data-visualization/blob/main/datasets/travel-destination/import-parsing-summary.R)  
  - [datasets/travel-destination/graphs.R](https://github.com/tpemartin/113-2-data-visualization/blob/main/datasets/travel-destination/graphs.R) OR [datasets/travel-destination/graphs/data/region_index_no_africa.json](https://github.com/tpemartin/113-2-data-visualization/blob/main/datasets/travel-destination/graphs/data/region_index_no_africa.json)

Import and parse data. Then generate all summary json files using `import-parsing-summary.R`.  

We want to design a better plot based on `region_index_no_africa.json` file. To enhance the writing: 

> 以 2008 年為基期（指數 = 100），可清楚觀察出亞洲地區自基期以來的旅遊人數增幅最為顯著，至 2024 年達到約 225 指數點，顯示出近年臺灣旅客出境仍強烈偏好亞洲目的地，且呈現穩定成長。大洋洲與歐洲地區雖在 2017–2019 年期間有明顯上升趨勢，最高分別達到 約 245（2019） 與 約 239（2018），但相較於亞洲，整體成長幅度仍較為平緩。美洲地區則長年維持在 80–120 指數點間震盪，反映其需求較為穩定但缺乏顯著成長。2020–2022 年因疫情影響，各區域旅遊指數均大幅下滑，尤其在 2021 年跌至谷底，其中亞洲地區指數僅剩 3.34，幾近停擺。隨後復甦幅度以亞洲最為強勁，2023 年即已恢復至 154 指數點，並在 2024 年重新攀升至疫情前水準。整體而言，亞洲地區在旅遊目的地選擇上的「主導性」地位始終明確，無論在疫情前後均展現出相對強勁的吸引力與復原力，而歐美大洋洲則呈現穩定但相對次要的選擇趨勢。

## Use AI to understand ggplot codes

Code snippet:

<https://github.com/tpemartin/113-2-data-visualization/blob/main/datasets/travel-destination/graphs/data/region_index_no_africa/plot-design.R#L152-L187>

Prompt:
> 以下是ggplot程式，請一次只解釋一層，我沒問題才再繼續。
> 
<https://chatgpt.com/share/68184e95-8158-8006-ab4c-0475a8109c79>