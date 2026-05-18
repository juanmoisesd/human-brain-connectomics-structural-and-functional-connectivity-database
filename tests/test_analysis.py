import sys
import os
import pandas as pd
import pytest

# Add the project root to the path so we can import the analysis script
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from analysis.analysis import generate_synthetic_data

def test_generate_synthetic_data_shape():
    """Test that the generated data has the correct dimensions."""
    df = generate_synthetic_data()
    assert df.shape == (24, 5)
    assert list(df.columns) == ["year", "structural_connectivity", "functional_connectivity", "network_efficiency", "modularity_index"]

def test_generate_synthetic_data_values():
    """Test that the generated data contains reasonable values."""
    df = generate_synthetic_data()
    assert df["year"].min() == 2000
    assert df["year"].max() == 2023
    assert (df["network_efficiency"] >= 0).all()
    assert (df["network_efficiency"] <= 1).all()

def test_generate_synthetic_data_reproducibility():
    """Test that the same seed produces the same data."""
    df1 = generate_synthetic_data(seed=42)
    df2 = generate_synthetic_data(seed=42)
    pd.testing.assert_frame_equal(df1, df2)
