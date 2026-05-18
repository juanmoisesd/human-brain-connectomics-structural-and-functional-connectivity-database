# test_analysis.R — Test suite for R analysis script

if (!require("tidyverse")) install.packages("tidyverse", repos = "https://cloud.r-project.org")
library(tidyverse)

# Source the analysis script (we need to wrap the execution part if we want to source without running)
# For now, we'll just redefine the function or use a more robust way.
source("analysis/analysis.R")

test_that_data_structure_is_correct <- function() {
  df <- generate_synthetic_data()

  if (nrow(df) != 24) stop("Incorrect number of rows")
  if (ncol(df) != 5) stop("Incorrect number of columns")

  expected_cols <- c("year", "structural_connectivity", "functional_connectivity", "network_efficiency", "modularity_index")
  if (!all(colnames(df) == expected_cols)) stop("Column names do not match")

  print("✅ test_that_data_structure_is_correct passed")
}

test_reproducibility <- function() {
  df1 <- generate_synthetic_data(seed = 123)
  df2 <- generate_synthetic_data(seed = 123)

  if (!all(df1 == df2)) stop("Data not reproducible with same seed")

  print("✅ test_reproducibility passed")
}

# Run tests
cat("\nRunning R tests...\n")
tryCatch({
  test_that_data_structure_is_correct()
  test_reproducibility()
  cat("\nAll R tests passed successfully!\n")
}, error = function(e) {
  cat("\n❌ R tests failed:", e$message, "\n")
  quit(status = 1)
})
