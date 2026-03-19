# stat-359-Final-Project.

## Project Goals & Motivation

In the context of Small Language Models (SLMs), reasoning often collapses due to failures in data representation. This project focuses on:
* Does increasing model depth or width overcome a tokenizer that creates tokens for numbres instead of using atomic digits?
* Distinguishing between a model's ability to follow formatting instructions (Parse Success) and its ability to solve the underlying mathematical logic (Exact Match Accuracy).
* Identifying the specific complexity depth where arithmetic logic fails across different configurations.

---

## Directory Structure

* Data - Tokenizer files and corpus data
* Given_Files - Source code for training, evaluation, and data generation
* Models - Saved models (base models and LoRA adapters)
* Results - Evaluation output for each model
* Summary_Data - Results folder consolidated into CSVs and generated figures
* bash scripts.sh - scripts used to generate the tokenizer and data
* google_colab_notebook.ipynb - all of the code used in Google Colab to train, test, and analyze the models including connection to the GitHub repo

---

## Environment Setup

This project requires **Python 3.12** and uses **Poetry** for dependency management.

### 1. Installation
```bash
# Clone the repository
git clone [https://github.com/OwenHHHH/stat-359-Final-Project.git](https://github.com/OwenHHHH/stat-359-Final-Project.git)
cd stat-359-Final-Project

# Install dependencies via Poetry
poetry install

# Activate the virtual environment
poetry shell
```

---

## Reproduction Pipleline

### Data Generation and Tokenizer
Can be replicated by copying and running the bash scripts in `bash scripts.py`

### Model Training and Evaluation
Can be replicated by running the respectively labeled code sections of `google_colab_notebook.ipynb`
- It is recommended to only run these sections in Colab or any other place where you have GPU access as runtimes are very long. All of the code in this notebook was only executed in Colab using GPU runtimes (other than analysis).

---

## Output Management
* The best models are saved in `Models/` organized by architecture and timestamp, where best is associated with lowest validation loss.
* Raw evaluation data for each model is saved in JSON files in `Results/`
* Visualizations and analysis are save in `Summary_Data/` and can be recreated by running the analysis code sections of `google_colab_notebook.ipynb`

---

## Individual Contributions
All of the work was done by me
