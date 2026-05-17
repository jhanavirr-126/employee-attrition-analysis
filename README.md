# Employee Attrition Analysis & Prediction
### IBM HR Analytics Dataset | Python | Scikit-learn | XGBoost | Power BI

![Python](https://img.shields.io/badge/Python-3.10-blue)
![Scikit-learn](https://img.shields.io/badge/Scikit--learn-1.3-orange)
![XGBoost](https://img.shields.io/badge/XGBoost-2.0-green)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

---

## Problem Statement

Employee attrition is one of the most costly challenges for organisations. Replacing an employee can cost 50–200% of their annual salary. This project analyses the IBM HR Analytics dataset to:
- Identify the key factors driving employee attrition
- Build a machine learning model to predict which employees are at risk of leaving
- Provide actionable business recommendations to HR teams

---

## Dataset

- **Source:** [IBM HR Analytics Employee Attrition Dataset — Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)
- **Records:** 1,470 employees
- **Features:** 35 columns (demographics, job details, satisfaction scores)
- **Target:** `Attrition` (Yes / No)
- **Attrition Rate:** ~16%

---

## Project Structure

```
employee-attrition-analysis/
│
├── employee_attrition_analysis.ipynb   # Main notebook (EDA + ML)
├── attrition_predictions.csv           # Model predictions output
├── model_comparison_summary.csv        # Performance metrics of all models
├── dashboard.pdf                       # Power BI dashboard export
├── requirements.txt                    # Python dependencies
├── README.md
│
└── plots/
    ├── plot_01_attrition_distribution.png
    ├── plot_02_attrition_by_department.png
    ├── plot_03_attrition_by_age.png
    ├── plot_04_income_distribution.png
    ├── plot_05_attrition_by_jobrole.png
    ├── plot_06_overtime_attrition.png
    ├── plot_07_correlation_heatmap.png
    ├── plot_08_job_satisfaction.png
    ├── plot_09_model_comparison.png
    ├── plot_10_roc_curves.png
    ├── plot_11_confusion_matrix.png
    └── plot_12_feature_importance.png
```

---

## Steps Covered

| Step | Description |
|------|-------------|
| 1 | Data loading and initial exploration |
| 2 | Data cleaning (missing values, duplicates, constant columns) |
| 3 | Exploratory Data Analysis (EDA) with 8 visualizations |
| 4 | Feature engineering (age groups, encoding) |
| 5 | Data preprocessing (label encoding, train-test split, scaling) |
| 6 | Model training: Logistic Regression, Random Forest, XGBoost |
| 7 | Model evaluation: Accuracy, ROC-AUC, F1, Recall, Confusion Matrix |
| 8 | Feature importance analysis |
| 9 | Export predictions for Power BI dashboard |

---

## Key Findings

- **Overall attrition rate:** 16.1%
- **Highest risk group:** Young employees (18–25) and Sales department
- **Overtime employees** are ~3x more likely to leave
- **Low monthly income** is the strongest predictor of attrition
- **Low job satisfaction** significantly increases attrition risk

---

## Model Performance

| Model | Accuracy | ROC-AUC | F1 (Attrition) |
|-------|----------|---------|----------------|
| Logistic Regression | ~78% | ~0.81 | ~0.52 |
| Random Forest | ~85% | ~0.84 | ~0.58 |
| **XGBoost** | **~84%** | **~0.86** | **~0.62** |

**Best Model: XGBoost** — highest ROC-AUC and F1 score for the attrition class.

---

## Business Recommendations

1. **Revise salary bands** for low-income roles, especially in Sales
2. **Limit compulsory overtime** — strong predictor of attrition
3. **Focus retention programs** on Sales department and young employees
4. **Career growth pathways** for employees in their first 2 years
5. **Deploy the XGBoost model** in HR systems for proactive intervention

---

## Tech Stack

| Tool | Purpose |
|------|---------|
| Python 3.10 | Core language |
| Pandas & NumPy | Data manipulation |
| Matplotlib & Seaborn | Visualizations |
| Scikit-learn | Preprocessing + ML models |
| XGBoost | Gradient boosting model |
| Power BI | Interactive dashboard |

---

## How to Run

```bash
# Clone the repo
git clone https://github.com/jhanavirr-126/employee-attrition-analysis.git
cd employee-attrition-analysis

# Install dependencies
pip install -r requirements.txt

# Download dataset from Kaggle and place CSV in root folder
# Then open the notebook
jupyter notebook employee_attrition_analysis.ipynb
```

---

## Author

**Jhanavi R R**  
B.E. Computer Science & Data Science | KNS Institute of Technology, Bangalore  
GitHub: [github.com/jhanavirr-126](https://github.com/jhanavirr-126)  
Email: jhanavirr126@gmail.com
