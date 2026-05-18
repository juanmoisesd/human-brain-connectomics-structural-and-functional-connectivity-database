# Human Brain Connectomics — Structural and Functional Connectivity Database

[![DOI](https://img.shields.io/badge/DOI-10.5281/zenodo.19145316-blue)](https://doi.org/10.5281/zenodo.19145316)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey)](https://creativecommons.org/licenses/by/4.0/)
[![Tests](https://github.com/juanmoisesd/human-brain-connectomics-structural-and-functional-connectivity-database/actions/workflows/data-quality.yml/badge.svg)](https://github.com/juanmoisesd/human-brain-connectomics-structural-and-functional-connectivity-database/actions/workflows/data-quality.yml)

> Open database of human brain structural connectivity (DTI, tractography) and functional connectivity (fMRI), including brain network maps and inter-individual variability.

**Author:** Juan Moisés de la Serna Tuya | ORCID: [0000-0002-8401-8018](https://orcid.org/0000-0002-8401-8018)

## 🚀 Quick Start

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/juanmoisesd/human-brain-connectomics-structural-and-functional-connectivity-database.git
   cd human-brain-connectomics-structural-and-functional-connectivity-database
   ```

2. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```

### Running Analysis

- **Python**: `python3 analysis/analysis.py`
- **R**: `Rscript analysis/analysis.R`

Outputs (plots and figures) will be generated in the `figures/` directory.

## 🐳 Docker Usage

You can run the entire analysis pipeline in a reproducible environment using Docker:

```bash
docker-compose up --build
```

This will run both Python and R analysis and save the resulting figures to your local `figures/` folder.

## 🧪 Testing

Run the test suite to ensure everything is working correctly:

- **Python**: `pytest`
- **R**: `Rscript tests/test_analysis.R`

## 📊 Dataset Contents

- Structural connectivity matrices (DTI tractography)
- Functional connectivity time-series (resting-state fMRI)
- Graph-theoretic network metrics per subject
- Parcellation schemes: AAL, Schaefer, Destrieux

## 🤝 Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

1. Fork the repo.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

## 📖 Citation

If you use this dataset in your research, please cite:

**BibTeX:**
```bibtex
@dataset{sernatuya_2025_connectomics,
  author    = {Serna Tuya, Juan Moisés},
  title     = {Repository of databases on human brain connectomics: Structural and functional connectivity},
  year      = {2025},
  publisher = {Zenodo},
  doi       = {10.5281/zenodo.19145316},
  url       = {https://doi.org/10.5281/zenodo.19145316}
}
```

## License

This project is licensed under the CC BY 4.0 License.
