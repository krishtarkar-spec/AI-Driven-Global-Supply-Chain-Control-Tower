# 🚀 AI-Driven Global Supply Chain Control Tower
### Predictive Disruption Modeling & Prescriptive Cost Optimization

---

> A single port disruption can cost a retailer millions in lost revenue and missed delivery windows. This system predicts disruptions before they cascade — and prescribes the cheapest, most sustainable way out.

---

## 📌 Project Overview

This project addresses the critical challenge of global logistics disruptions — port congestion, labor strikes, and transit delays — by building a **Digital Twin of a supply chain network**. Using **XGBoost Machine Learning** and **Linear Programming**, the system doesn't just predict when a delay will happen — it prescribes the most cost-effective and sustainable **"Pivot" strategy** in real-time.

---

## 🛠️ Technical Architecture

The five layers below form a closed-loop system: simulation feeds the AI model, the AI model feeds the optimizer, the optimizer writes to the warehouse, and the warehouse powers the executive dashboard.

```
┌─────────────────────────────────────────────────────────────┐
│  [1] Simulation  →  [2] XGBoost AI  →  [3] LP Optimizer    │
│                                              ↓              │
│  [5] Power BI Dashboard  ←  [4] PostgreSQL Warehouse        │
└─────────────────────────────────────────────────────────────┘
```

**1. Simulation & Synthesis**
Generated a high-fidelity dataset of **1.04 million shipments** in Python using stochastic modeling — simulating realistic risk events such as port strike probability distributions, weather-driven transit variance, and node-specific congestion cycles.
`Core Script: Synthetic Data.py`

**2. Predictive AI (XGBoost)**
Trained a gradient boosting regressor to forecast **Time-to-Recovery (TTR)** by analyzing historical delay deltas and node-specific risk scores.
`Core Script: AI Driven Math.py`

**3. Prescriptive Optimization (Linear Programming)**
Formulated a vectorized optimization engine to solve the **"Golden Triangle"**: balancing freight premiums (+12%) vs. lead-time savings (-5 days) vs. Scope 3 Carbon Tax liabilities — producing a single, defensible routing decision per disruption event.

**4. Data Warehousing (PostgreSQL)**
Architected a **Star Schema** to materialize AI decisions, using optimized relational joins to link 1M+ records for low-latency dashboarding.
`SQL Logic: SQL_Star_Schema_Views/`

**5. Strategic Visualization (Power BI)**
Built an executive-level **Control Tower** that synchronizes Marketing bidding strategies with real-time Supply Chain health — enabling cross-functional alignment between operations and demand generation.

---

## 📊 Key Results & Impact

| Metric | Result |
|---|---|
| **Predictive Accuracy** | XGBoost TTR model — *[insert MAE / R² here]* |
| **Lead-Time Recovery** | Automated Pivot logic reduces average delay by **5 days** during Tier 1 port disruptions |
| **ESG / Carbon Reduction** | AI-optimized routing cuts Scope 3 carbon tax liability by **20%** |
| **Marketing Intelligence** | Auto-generates **Kill Bid / Aggressive Bid** signals for digital ad spend based on real-time inventory risk |

> 💡 **Note:** Replace the predictive accuracy placeholder with your XGBoost MAE, RMSE, or R² score. A single quantified metric here is the highest-impact change you can make to this README before publishing.

---

## 🔗 Dynamic Demand-Supply Synchronization

One of the most novel elements of this system is its cross-functional reach. Most supply chain tools stop at operations. This Control Tower generates automated bidding signals for digital marketing:

- **Kill Bid** — Suppresses ad spend when inventory risk is elevated, preventing overselling into a disruption
- **Aggressive Bid** — Accelerates ad spend when supply confidence is high, maximizing revenue during stable windows

This directly ties supply chain health to marketing ROI — a capability rare in standard logistics tooling.

---

## 🚀 How to Run

**Prerequisites:** Python 3.9+, PostgreSQL, Power BI Desktop

**Step 1: Environment Setup**
```bash
git clone <your-repo-url>
cd supply-chain-control-tower
pip install pandas numpy xgboost scikit-learn scipy
```

**Step 2: Generate the AI Pipeline**
```bash
# Generate the raw digital twin environment (1.04M synthetic shipments)
python "Synthetic Data.py"

# Train the XGBoost model and calculate prescriptive decisions
python "AI Driven Math.py"
```

**Step 3: Database & Visualization**
```bash
# Execute schema scripts in your PostgreSQL instance
psql -U <user> -d <database> -f SQL_Star_Schema_Views/schema.sql

# Then import the generated CSV into the ai_optimized_1m_final table
# Open Dashboard/*.pbix in Power BI Desktop and refresh the data source
```

---

## 📂 Repository Structure

```
├── Synthetic Data.py              # Stochastic simulation engine (1M+ shipments)
├── AI Driven Math.py              # XGBoost model + Linear Programming optimizer
├── SQL_Star_Schema_Views/         # PostgreSQL Fact/Dimension table scripts
├── Datasets/                      # Raw and AI-optimized shipment data
└── Dashboard/                     # Power BI .pbix executive Control Tower
```

---


## 🧰 Tech Stack

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)
![XGBoost](https://img.shields.io/badge/XGBoost-E83524?style=for-the-badge&logo=xgboost&logoColor=white)
![SciPy](https://img.shields.io/badge/SciPy-8CAAE6?style=for-the-badge&logo=scipy&logoColor=white)



