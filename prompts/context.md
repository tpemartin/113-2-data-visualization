# context

## Codebook

The following tasks are based on a data frame {data frame name} whose dataset information is provided in the attached codebook.

## Output format

In the following tasks, each result should be save in either a list or data frame and formatted as a JSON object and saved in a file named "{short-title-of-summary}.json". If there are multiple results, they should be prepared separately.

```json
{
  "description": "<string> brief description what it summaries",
  "operations": "<string>  what tidyvers operations are used",
  "summary": <Object of summary result>
}
```


