🏥 Hospital Cost Optimization & Patient Risk Analytics

## 📌 Problem Statement
Hospital management teams often lack visibility into what's driving patient costs, which conditions consume the most resources, and which patients are at highest financial risk. Without this clarity, resource allocation remains reactive rather than strategic.

This project addresses that gap — by analyzing 55,500+ real patient records across 6 medical conditions, 5 insurance providers, and 6 years of admission data to surface actionable insights and build a real-time Patient Risk Simulator.

---

## 🎯 Project Objectives
- Identify top cost-driving medical conditions
- Evaluate insurance provider billing performance
- Analyze patient stay duration by condition
- Build an interactive risk simulator for proactive patient management

---

## 🛠️ Tools & Techniques

| Tool | Application |
|------|-------------|
| PostgreSQL | Database design, data import, query execution |
| SQL | Window Functions, CTEs, RANK, PARTITION BY, date calculations |
| Power BI | 4-page interactive dashboard |
| DAX | Dynamic measures, Patient Risk Simulator logic |

---

## 🗄️ Database & SQL Highlights

Designed and built a PostgreSQL database from scratch, imported 55,500+ records, and wrote 8 production-grade SQL queries:

| Query | Technique Used |
|-------|---------------|
| Hospital Performance Overview | Aggregations |
| Revenue by Medical Condition | GROUP BY, ORDER BY |
| Insurance Provider Analysis | Multi-metric aggregation |
| Admission Type Breakdown | Window Function — PARTITION BY |
| High Billing Conditions | CTE + RANK() |
| Length of Stay Analysis | Date arithmetic |
| Test Results Distribution | Conditional aggregation |
| Yearly Admission Trend | EXTRACT(), time series |

---

## 📊 Key Business Insights

🔴 Obesity generates the highest avg billing ($25,806) — a preventive care program targeting this segment could meaningfully reduce hospital cost burden

🏨 Asthma patients have the longest average stay (15.70 days) — early diagnosis protocols could reduce bed occupancy and free up critical resources

📈 2020 recorded peak admissions (11,285 patients) — hospitals need surge capacity planning for external health crises

💳 Medicare has the highest avg billing ($25,616) while **UnitedHealthcare** is lowest ($25,389) — a $227 gap per patient worth investigating for contract renegotiation

⚠️ 5,649 patients aged 75+ with billing above $19K identified as high-risk — representing 10.18% of total patient base requiring priority attention

---

## 💡 Business Recommendations

1. Prioritize Preventive Care for High-Cost Conditions**
Obesity and Diabetes together account for ~33% of total patients and highest billing — investing in preventive care can reduce long-term cost burden.

2. Reduce Asthma Hospitalization Duration**
15.70-day average stay is highest among all conditions. Early-stage intervention and outpatient protocols can cut this significantly.

3. Surge Capacity Planning**
2020 peak data shows hospitals need 35%+ capacity buffer during external health events.

4. Insurance Contract Optimization**
Billing gap between providers suggests room for renegotiation — especially for high-volume insurers like Cigna (11,249 patients).

5. Proactive High-Risk Patient Management**
Patient Risk Simulator enables real-time identification of high-cost, high-age segments — enabling hospitals to intervene before costs escalate.

---

## 🖥️ Dashboard Overview

Page 1 — Hospital Patient Overview**
KPI cards, gender distribution, yearly admission trend, patients by medical condition

Page 2 — Medical Condition Analysis**
Avg billing by condition, admission type breakdown, length of stay matrix, test results distribution

Page 3 — Insurance & Billing Analysis**
Provider comparison, revenue matrix, admission type distribution

Page 4 — 🎯 Patient Risk & Billing Simulator**
Dual sliders (Min Age + Billing Threshold) update 3 KPIs and a condition-level bar chart in real-time — enabling instant high-risk patient identification

## 📁 Files in this Repository

| File | Description |
|------|-------------|
| Healthcare_analytics.pbix | Power BI Dashboard (4 pages) |
| Healthcare project sql queries.sql | 8 Advanced SQL Queries |
| Screenshots | Dashboard visuals (4 pages) |

---

## 🔗 Dataset
Kaggle — Healthcare Dataset by Prasad Patil
https://www.kaggle.com/datasets/prasad22/healthcare-dataset

---

## 👨‍💻 Author
Ankit Mishra | Data Analyst
🔗 github.com/MishraX04
