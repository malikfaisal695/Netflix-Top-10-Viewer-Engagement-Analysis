
# 🎬 Netflix Top 10 Viewer Engagement Analysis

## 1. Business Problem
Netflix publishes daily Top 10 rankings by country, but **rank alone does not represent sustained viewer engagement**.  
The goal of this project is to identify **which content types and regions show consistent engagement over time**, helping inform **content acquisition, promotion, and regional strategy decisions**.

---

## 2. Dataset
- **Source:** Netflix Top 10 (publicly available rankings)
- **Time Range:** Multi-day daily rankings
- **Granularity:** Country × Title × Date
- **Key Columns:**
  - `title`
  - `type` (Movie / TV Show)
  - `rank`
  - `country`
  - `date`

---

## 3. Tools & Technologies
- **SQL (MySQL):** Aggregations, ranking analysis, KPI calculation  
- **Python (Pandas):** Data cleaning, transformation, exploratory analysis  
- **Tableau:** Interactive dashboards and visual storytelling  

---

## 4. Analytical Approach

### Data Preparation
- Removed duplicate records and invalid rankings
- Standardized title and country naming
- Converted date fields to consistent formats
- Ensured ranking values were within Top 10 constraints

### Key KPIs Designed
- **Top 10 Persistence:** Number of days a title remained in Top 10
- **Average Rank:** Mean ranking position over time
- **Regional Spread:** Number of countries where a title appeared
- **Content Type Performance:** Comparison between Movies and TV Shows

### SQL Analysis
- Used `GROUP BY` to calculate persistence and average rank metrics
- Applied `LEFT JOIN` to retain titles with partial ranking history
- Aggregated daily rankings to analyze **engagement longevity** rather than single-day performance

### Python Analysis
- Used Pandas for:
  - Time-series grouping and validation
  - Feature engineering for persistence metrics
  - Cross-checking SQL-derived results
- Python was preferred where iterative exploration and validation were required

---

## 5. Key Insights
- **TV Shows remained in the Top 10 approximately 2× longer than Movies**, indicating stronger sustained engagement.
- Certain titles appeared consistently across **multiple countries**, suggesting global audience appeal.
- Average rank alone was misleading — titles with moderate ranks but long persistence showed stronger engagement signals.
- Regional viewing preferences varied significantly, highlighting opportunities for localization.

---

## 6. Dashboard & Visual Output
The Tableau dashboard presents:
- Content persistence trends over time
- TV Shows vs Movies engagement comparison
- Country-level distribution of Top 10 appearances
- Rank movement patterns across dates

*(...,......)*

---

## 7. Business Impact
This analysis supports:
- Data-driven content acquisition decisions
- Promotion of titles with proven long-term engagement
- Strategic focus on formats and regions with higher retention potential

---

## 8. Next Improvements
- Incorporate genre-level analysis
- Add viewership or hours-watched metrics if available
- Automate daily data ingestion using Python pipelines

---

## Interview Talking Point
> “Instead of focusing only on daily rank, I designed a persistence-based KPI to measure how long content stayed relevant, which provided a better indicator of sustained viewer engagement.”