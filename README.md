# Constraint-Aware News Recommendation System

A personalized news recommender built on the Microsoft MIND dataset that
maximizes engagement (CTR) while balancing diversity, freshness, and
recommendation-fatigue constraints.

## Tech stack
Python, pandas, scikit-learn, Sentence-Transformers, PostgreSQL, MLflow,
Streamlit / Tableau.

## Project structure
- `data/` — raw + processed MIND data (gitignored)
- `notebooks/` — EDA and prototyping
- `src/` — recommenders, metrics, NLP modules
- `sql/` — schema and queries
- `dashboards/` — Streamlit app / Tableau workbooks
- `reports/` — product insights write-up and figures

## Status
Phase 0 complete — environment, data, and database set up.