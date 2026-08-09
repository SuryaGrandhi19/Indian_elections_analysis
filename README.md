# 🇮🇳 Indian Election Analysis — 2024

## 📌 Project Overview

Indian Election Analysis is a data analytics and business intelligence project focused on analyzing the **2024 Indian General Election (Lok Sabha)**.

The project combines **Python, Pandas, MySQL, SQL and Microsoft Power BI** to transform election data into meaningful and interactive insights.

The dashboard provides both **national-level and state-level election analysis**, allowing users to explore party performance, seats won, vote share, constituency results, winning margins and voter turnout.

---

## 🎯 Project Objectives

The main objectives of this project are:

- Analyze the 2024 Lok Sabha election results.
- Provide a clear national-level overview of the election.
- Analyze party-wise seats won across India.
- Analyze state-wise election performance.
- Allow users to select a particular state and explore its election results.
- Analyze constituency-level winners and candidates.
- Compare voter turnout between 2019 and 2024.
- Identify parties with the highest number of seats.
- Analyze vote share and winning margins.
- Present the results through an interactive Power BI dashboard.

---

## 🛠️ Technologies Used

### Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook

### Database
- MySQL
- MySQL Workbench

### Data Visualization
- Microsoft Power BI

### Development Tools
- VS Code
- Git
- GitHub

---

## 📂 Project Structure

```text
Indian_Election_Analysis/
│
├── data/
│   ├── raw/
│   │   ├── election_2024/
│   │   │   ├── candidates_with_phase.csv
│   │   │   ├── results_2024.csv
│   │   │   └── results_2024_winners.csv
│   │   │
│   │   └── historical/
│   │       ├── ind-lok-sabha.csv
│   │       └── ind-vidhan-sabha.csv
│   │
│   └── processed/
│       ├── constituency_results_2024.csv
│       ├── state_party_results_2024.csv
│       ├── national_party_results_2024.csv
│       ├── state_winning_party_2024.csv
│       ├── national_party_votes_2024.csv
│       └── india_turnout_summary.csv
│
├── python/
│   └── data_analysis.ipynb
│
├── sql/
│   └── indian_election_analysis.sql
│
├── powerbi/
│   └── Indian_Election_Analysis.pbix
│
├── images/
│
├── requirements.txt
├── .gitignore
└── README.md