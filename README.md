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

## Problem Statement

    We want news readers to discover relevant, varied stories without being shown the same articles or topic
    repeatedly. We aim to cultivate an audience with repeat engagement across the time frame. A recommendation system focusing solely on click through rate can ruin recommendations and create feeds focused only on suggesting the most popular articles, encouraging repetition and narrowing topics; A long term retention risk.To balance the trade off, we should quantify the trade off between the demand for an increase in immediate engagement and a diverse recommendation system by identifying the exchange rate between engagement and diversity and recommend where it stops being worth paying. A success will be consistent click through rate, lowered topic repetition and increased intra list diversity, verified with experiment and guardrails. Failures can be identified when recommendations focus solely on few popular articles, users get suggested only a narrow set of topics, and readers are exposed to similar content leads to higher fatigue/churn.