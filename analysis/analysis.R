#' analysis.R — Human Brain Connectomics: Structural and Functional Connectivity Database
#' DOI: 10.5281/zenodo.19145316
#' Author: de la Serna Tuya, Juan Moisés · ORCID: 0000-0002-8401-8018
#' License: CC BY 4.0

# ── SETUP ──────────────────────────────────────────────────────────────────
# Required libraries: tidyverse (dplyr, ggplot2, tidyr, readr)
if (!require("tidyverse")) install.packages("tidyverse", repos = "https://cloud.r-project.org")
library(tidyverse)

# ── DATA GENERATION ────────────────────────────────────────────────────────
#' Generates synthetic brain connectivity data for demonstration
generate_synthetic_data <- function(seed = 42) {
  set.seed(seed)
  years <- 2000:2023
  n <- length(years)

  df <- tibble(
    year = years,
    structural_connectivity = cumsum(rnorm(n, mean = 2, sd = 1)) + 40,
    functional_connectivity = cumsum(rnorm(n, mean = 2, sd = 1.2)) + 45,
    network_efficiency = rnorm(n, mean = 0.7, sd = 0.05),
    modularity_index = rnorm(n, mean = 0.4, sd = 0.03)
  )

  return(df)
}

# ── MAIN EXECUTION ─────────────────────────────────────────────────────────
cat("--- Human Brain Connectomics Analysis (R) ---\n")
cat("DOI: 10.5281/zenodo.19145316\n\n")

# Generate data
df <- generate_synthetic_data()

cat("Dataset Summary:\n")
print(summary(df))

# ── VISUALIZATION ──────────────────────────────────────────────────────────
# Temporal trend plot
p1 <- df %>%
  pivot_longer(
    cols = c(structural_connectivity, functional_connectivity),
    names_to = "metric",
    values_to = "value"
  ) %>%
  ggplot(aes(x = year, y = value, color = metric)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  scale_color_manual(values = c("#0366d6", "#28a745")) +
  labs(
    title = "Human Brain Connectomics: Connectivity Trends",
    subtitle = "DOI: 10.5281/zenodo.19145316",
    x = "Year",
    y = "Normalized Metric",
    color = "Metric",
    caption = "de la Serna Tuya, Juan Moisés · 2026"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")

# Create figures directory if it doesn't exist
if (!dir.exists("figures")) dir.create("figures")

# Save the plot
output_file <- "figures/analysis_output_r.png"
ggsave(output_file, p1, width = 10, height = 6, dpi = 300)
cat(paste0("\nFigure saved to: ", output_file, "\n"))

# ── CITATION ───────────────────────────────────────────────────────────────
cat("\nCitation:\n")
cat("de la Serna Tuya, Juan Moisés (2026). Human Brain Connectomics: Structural and Functional Connectivity Database. Zenodo. https://doi.org/10.5281/zenodo.19145316\n")
