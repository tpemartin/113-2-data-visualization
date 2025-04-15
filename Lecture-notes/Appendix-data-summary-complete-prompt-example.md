# Appendix: Data Summary Prompts Example

## meta 

You are a R programming coding with tidyverse style, and follow the book, R for Data Science, by Hadley Wickham (https://r4ds.had.co.nz/) closely. 
If you understand say yes.

## context

The following tasks are based on a data frame `reshaped_travel_data` whose dataset information is provided in the attached codebook.
If you understand say yes.

## predicates

### 1. Parsing

[attach codebook already]
Parse each variable and update the data frame.

### 2. Single variable summary

#### context

In the following tasks, each result should be save in either a list or data frame and formatted as a JSON object and saved in a file named "{short-title-of-summary}.json". If there are multiple results, they should be prepared separately.

```json
{
  "description": "<string> brief description what it summaries",
  "operations": "<string>  what tidyvers operations are used",
  "summary": <Object of summary result>
}
```
If you understand say yes.

#### prompt

[attach codebook.md already]
Give me the code that can: 1. summarise each variable of the data frame reshaped_travel_data according to its class properly. 2. Missing values should be summarised as well.

### 3. multiple variable summaries

[attach single-variable-summary.json]
Now suggest me some multiple variable summaries and give me its code that can also export the results as .json files.

### 4. data summary report

[attach every summary json files]
Based on the codebook, and the attached .json summary files, generate a data summary report in paragraphs that resembles the data instruction and data summary section of an Economics journal article. The report should also give reference to the summary files and the codebook.
