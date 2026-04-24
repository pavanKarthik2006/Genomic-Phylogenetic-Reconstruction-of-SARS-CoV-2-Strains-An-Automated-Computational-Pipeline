#Phylogenetic-Reconstruction-of-SARS-CoV-2-Strains-An-Automated-Computational-Pipeline
# Genomic Phylogenetic Reconstruction of SARS-CoV-2 Strains

## Project Overview
This project presents an end-to-end automated computational pipeline for the phylogenetic inference of SARS-CoV-2 genomic data. By leveraging high-performance bioinformatics tools in a Linux/WSL environment, this pipeline automates the transformation of raw genomic sequences into statistically validated evolutionary trees. The study demonstrates the application of Maximum Likelihood inference and objective model selection to characterize viral divergence.



## Technical Architecture
The pipeline is modular and designed for reproducibility, utilizing containerized environments to ensure consistent analysis.

### 1. Environment Orchestration
* **Infrastructure:** Ubuntu / Windows Subsystem for Linux (WSL).
* **Environment Management:** Managed via `conda`, ensuring isolated dependency management for all bioinformatics tools.

### 2. Automated Data Acquisition
* **Methodology:** Leveraged NCBI Datasets CLI for programmatic access to the viral genome database.
* **Workflow:** Automated retrieval of 10 complete SARS-CoV-2 genomic sequences, filtering for metadata integrity to ensure high-quality input for downstream analysis.

### 3. Sequence Processing & Alignment
* **Data Wrangling:** Processed raw FASTA files using standard UNIX stream processing (`cat`) to generate multi-sequence input.
* **Alignment:** Utilized **MAFFT** (Multiple Alignment using Fast Fourier Transform) to synchronize genomic sequences, accounting for insertions, deletions, and substitutions.

### 4. Statistical Inference & Modeling
* **Model Selection:** Employed **IQ-TREE’s ModelFinder** to objectively identify the `TIM+F` evolutionary model based on the Bayesian Information Criterion (BIC), ensuring the mathematical model reflects the observed mutation patterns.
* **Phylogenetic Reconstruction:** Executed Maximum Likelihood inference to construct the optimal evolutionary tree topology.

---

## Results & Interpretation
The pipeline yields three critical artifacts, each serving a specific scientific purpose:

| Artifact | Format | Scientific Significance |
| :--- | :--- | :--- |
| `.treefile` | Newick | Describes the evolutionary history/topology of the virus lineages. |
| `.iqtree` | Log | Contains rigorous statistical validation (log-likelihoods and model fit). |
| `.mldist` | Matrix | Provides a quantitative distance matrix, identifying pair-wise genetic divergence. |

* **Key Finding:** The model selection confirms that the `TIM+F` model best accounts for the base frequency and mutation rates of this specific SARS-CoV-2 dataset.
* **Visualization:** Pairwise distance matrices and phylogenetic topologies were rendered to confirm strain clustering, providing visual evidence of evolutionary relatedness.

---

## Technical Stack & Competencies
* **Bioinformatics:** Phylogenetics, Maximum Likelihood Estimation, Multiple Sequence Alignment (MSA), Sequence Data Wrangling.
* **Tools:** IQ-TREE, MAFFT, NCBI Datasets API.
* **Environment:** Linux (Bash), Miniconda, Git/GitHub.
* **Data Analysis:** Statistical modeling (BIC/AIC criteria), matrix visualization.

---
*Created as part of an independent research initiative in Bioinformatics and Computational Biology.*
