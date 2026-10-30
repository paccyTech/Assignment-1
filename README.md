# Assignment 1: Importing Data in R

This project demonstrates how to import data from different sources using R:
local files, web addresses, databases, and datasets included with R packages.

## Student information

| | |
|---|---|
| **Student** | Pacifique Irakoze |
| **Student ID** | 20252MBI012 |
| **University** | Adventist University of Central Africa (AUCA) |
| **Course** | R Programming |
| **Assignment** | Assignment 1 |
| **Instructor** | Dr. Pacifique NIZEYIMANA |

## Project contents

- `R/import_data.R` — the `import_data()` function.
- `tests/test_import_data.R` — basic tests for file and dataset imports.
- `R-Data-Importer.Rproj` — RStudio project file.

## Getting started

1. Open `R-Data-Importer.Rproj` in RStudio.
2. Load the import function:

   ```r
   source("R/import_data.R")
   ```

3. Use `import_data()` to load the data you need.

## Examples

### Import a local file

The file type is detected from its extension.

```r
students <- import_data("file", path = "data/students.csv")
```

Supported file types are CSV, TSV, Excel (`.xls` and `.xlsx`), JSON, RDS, and
RData (`.RData` and `.rda`).

Excel and JSON files require the corresponding package:

```r
install.packages("readxl")   # Excel files
install.packages("jsonlite") # JSON files
```

### Import a file from the web

```r
remote_data <- import_data(
  "url",
  path = "https://example.com/data.csv"
)
```

The URL should point to a supported file type.

### Import from a database

For example, connect to a SQLite database with `DBI` and `RSQLite`:

```r
install.packages(c("DBI", "RSQLite"))

connection <- DBI::dbConnect(
  RSQLite::SQLite(),
  "my_database.sqlite"
)

table_data <- import_data(
  "database",
  connection = connection,
  table = "students"
)

query_data <- import_data(
  "database",
  connection = connection,
  query = "SELECT * FROM students"
)

DBI::dbDisconnect(connection)
```

### Import a dataset included with R

```r
iris_data <- import_data("dataset", dataset = "iris")
```

To load a dataset from another installed package, provide its package name:

```r
storms_data <- import_data(
  "dataset",
  dataset = "storms",
  package = "dplyr"
)
```

## Run the tests

From the project directory, run:

```sh
Rscript tests/test_import_data.R
```

## Notes

- Excel and JSON imports need `readxl` and `jsonlite`, respectively.
- Database imports need `DBI` and a compatible database driver.
- The database connection is created and closed by the caller.
