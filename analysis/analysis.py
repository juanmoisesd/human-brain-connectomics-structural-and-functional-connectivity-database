"""
analysis.py — Human Brain Connectomics: Structural and Functional Connectivity Database
DOI: 10.5281/zenodo.18881110
Author: de la Serna Tuya, Juan Moisés · ORCID: 0000-0002-8401-8018
License: CC0 1.0
"""

import os
from typing import Tuple

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

# Use non-interactive backend for headless environments
matplotlib.use("Agg")


def generate_synthetic_data(seed: int = 42) -> pd.DataFrame:
    """Generates synthetic brain connectivity data for demonstration."""
    np.random.seed(seed)
    years = np.arange(2000, 2024)
    n_years = len(years)

    data = {
        "year": years,
        "structural_connectivity": np.random.normal(60, 10, n_years).cumsum() / 10 + 40,
        "functional_connectivity": np.random.normal(55, 12, n_years).cumsum() / 10 + 45,
        "network_efficiency": np.random.normal(0.7, 0.05, n_years),
        "modularity_index": np.random.normal(0.4, 0.03, n_years),
    }

    return pd.DataFrame(data)


def create_visualizations(df: pd.DataFrame, output_path: str = "figures/analysis_output.png") -> None:
    """Creates and saves visualizations for the connectivity data."""
    sns.set_theme(style="whitegrid")
    fig, axes = plt.subplots(1, 2, figsize=(14, 6))

    # Plot 1: Connectivity Trends
    ax1 = axes[0]
    sns.lineplot(data=df, x="year", y="structural_connectivity", ax=ax1, label="Structural", marker="o")
    sns.lineplot(data=df, x="year", y="functional_connectivity", ax=ax1, label="Functional", marker="s")
    ax1.set_title("Connectivity Trends (2000-2023)", fontweight="bold")
    ax1.set_xlabel("Year")
    ax1.set_ylabel("Normalized Metric")
    ax1.legend()

    # Plot 2: Efficiency vs Modularity (Scatter with Regression)
    ax2 = axes[1]
    sns.regplot(data=df, x="network_efficiency", y="modularity_index", ax=ax2, color="teal")
    ax2.set_title("Network Efficiency vs Modularity", fontweight="bold")
    ax2.set_xlabel("Efficiency")
    ax2.set_ylabel("Modularity")

    plt.tight_layout()
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    plt.savefig(output_path, dpi=300, bbox_inches="tight")
    print(f"Visualization saved to: {output_path}")


def main() -> None:
    """Main execution function."""
    print("--- Human Brain Connectomics Analysis ---")
    print("DOI: 10.5281/zenodo.19145316")

    # Generate or Load data
    df = generate_synthetic_data()
    print(f"\nDataset Shape: {df.shape}")
    print("\nSummary Statistics:")
    print(df.describe().round(2))

    # Create plots
    create_visualizations(df)

    print("\nCitation:")
    print("de la Serna Tuya, Juan Moisés (2026). Human Brain Connectomics: "
          "Structural and Functional Connectivity Database. Zenodo. "
          "https://doi.org/10.5281/zenodo.19145316")


if __name__ == "__main__":
    main()
