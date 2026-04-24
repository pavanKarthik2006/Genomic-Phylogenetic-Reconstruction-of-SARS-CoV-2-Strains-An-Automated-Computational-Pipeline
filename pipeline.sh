#!/bin/bash

# ==============================================================================
# Pipeline: SARS-CoV-2 Phylogenetic Reconstruction
# Usage: ./run_pipeline.sh
# ==============================================================================

# Exit immediately if a command fails
set -e

# Define directories
BASE_DIR=$(pwd)
WORK_DIR="$BASE_DIR/analysis_run"
RESULTS_DIR="$WORK_DIR/results"

echo "--- Initializing Pipeline ---"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

# 1. Data Acquisition
echo "--- Fetching Metadata ---"
datasets summary virus genome taxon "SARS-CoV-2" --limit 10 --as-json-lines > sars_list.jsonl

echo "--- Extracting Accessions ---"
dataformat tsv virus-genome --inputfile sars_list.jsonl --fields accession > accession_list.txt

echo "--- Downloading Genomes ---"
datasets download virus genome accession --inputfile accession_list.txt --filename sars_sequences.zip
unzip -q sars_sequences.zip -d sars_data

# 2. Sequence Merging
echo "--- Merging Sequences ---"
cat sars_data/ncbi_dataset/data/*.fna > combined_sequences.fasta

# 3. Multiple Sequence Alignment
echo "--- Aligning Sequences (MAFFT) ---"
mafft --auto combined_sequences.fasta > aligned_sequences.fasta

# 4. Phylogenetic Inference
echo "--- Running Phylogenetic Inference (IQ-TREE) ---"
iqtree -s aligned_sequences.fasta -m MFP -pre analysis_output

# 5. Organizing Results
echo "--- Organizing Results ---"
mkdir -p "$RESULTS_DIR"
mv analysis_output.* "$RESULTS_DIR"
mv aligned_sequences.fasta "$RESULTS_DIR"
mv combined_sequences.fasta "$RESULTS_DIR"

echo "--- Pipeline Complete! ---"
echo "Results are available in: $RESULTS_DIR"
