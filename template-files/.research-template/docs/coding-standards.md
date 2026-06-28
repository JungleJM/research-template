# Coding Standards
- Use tidyverse style with modern |> pipe
- Keep exploratory and analysis scripts in /scripts/
- Follow tidyverse principles for data manipulation
- Comment complex operations
- Final lines in statistical code should return objects, not print them
- Prefer wrapping reusable logic in functions, with clear arguments, instead of long sequences of top‑level statements and global variables.
- Each function should compute a single, clearly named result object and use that as the final expression (or a single return(result)), so it’s obvious what the function returns. If not using return(result), give a comment stating what it is returning.

## QMD Table Display Standards

These standards apply specifically when adding tables to a `.qmd` file for
HTML output.

- Source the table UX helper in the setup chunk before presenting DT tables:
  `source("../scripts/ux_options.R")`, adjusting the relative path as needed.
- Prefer `make_dt_table()` from `scripts/ux_options.R` for QMD display tables
  instead of printing raw data frames, tibbles, matrices, or bare
  `DT::datatable()` calls.
- Use table settings that fit the actual table size and reader workflow:
  compact summary tables should have minimal controls, while large data tables
  should support navigation, search, and scrolling.
- Generally keep export enabled with `buttons = c("copy", "csv")` so table data
  can be copied or downloaded from the rendered QMD. Disable export only for
  tiny helper tables where export would add clutter.
- Use the global search box only when the table is large enough to require
  navigation across multiple pages or when there is a clear lookup task. For
  small summary tables, use `search = FALSE` and usually `filter = "none"`.
- Use horizontal scrolling when the table has enough columns to overflow the
  document width: `scroll_x = TRUE` or the default helper behavior.
- Use vertical scrolling when the table has enough rows to dominate the page:
  set `scroll_y = "400px"` or another readable height.
- Use pagination for large tables. For small tables that fit comfortably in the
  intended view, use `paging = FALSE` and set
  `page_length = nrow(table_object)` or another exact row count.
- Use `wrap_text = TRUE` for tables with long labels, notes, or text fields
  where horizontal scrolling would make reading worse. Pair this with
  `font_size = 13` when the table benefits from slightly denser display.
- Keep QMD chunks display-oriented: prepare or summarize the data in named
  objects first, then pass that object to `make_dt_table()`.

Common patterns:

```r
# Small summary table
make_dt_table(
  summary_table,
  page_length = nrow(summary_table),
  filter = "none",
  search = FALSE,
  paging = FALSE
)
```

```r
# Larger or wider table
make_dt_table(
  detailed_table,
  page_length = 10,
  scroll_y = "400px",
  scroll_x = TRUE,
  paging = TRUE,
  font_size = 13
)
```
