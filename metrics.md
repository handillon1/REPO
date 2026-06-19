# Metric Definitions

Conventions: K = recommendation list length. List-level metrics are averaged
over impressions. e_i = L2-normalized article embedding

## Primary metrics

### CTR (Click-Through Rate)
- **Formula:** total clicks / total article impressions (micro-average over every shown article slot)
  `events['clicked'].mean()`.
- **Range:** 0–1.
- **Why:** core indicator for engagement, but a measure that can be over optimized

### Impression engagement
- **Formula:** share of impressions with at least one click
  `events.groupby('impression_id')['clicked'].max().mean()`.
- **Range:** 0–1.
- **Why:** Measures whether a shown list engaged the user, beyond just clicks.

### Article interaction rate
- **Formula:** mean of per-article click rates, each article weighted equally
  `events.groupby('news_id')['clicked'].mean().mean()`.
- **Range:** 0–1.
- **Why:** If CTR >> article interaction rate, engagement is concentrated in a few popular articles

## Guardrail metrics

### Topic diversity score (intra-list diversity, ILD)
- **Formula:** 1 − mean pairwise cosine similarity of the K recommended
  articles: `ILD = 1 − (2 / (K(K−1))) · Σ_{i<j} (e_i · e_j)`.
- **Range:** 0 (identical) to ~1 (unrelated).
- **Complement (optional):** category entropy of the list,
  `−Σ_c p_c·log p_c` normalized by `log(#categories)` — a simpler, label-based view that doesn't need embeddings.
- **Why:** protects against feeds fixating on one topic.

### Repetition rate
- **Formula:** share of article pairs in the list that are near-duplicates:
  `(# pairs with cos_sim ≥ τ) / (K(K−1)/2)`, with threshold τ ≈ 0.9.
- **Range:** 0–1.
- **Why:** ILD penalizes similarity; Catches failure of showing essentially the same story twice. Report τ explicitly.

### Freshness score
- **Proxy note:** news.tsv has no publish timestamp, so define article age using its earliest shown time in the  dataset.
- **Formula:** for a recommended article, `age = impression_time − first_seen`;
  freshness = `exp(−age / τ)` (τ a decay constant, e.g. 24h), averaged over the
  list. 
- **Range:** 0–1.
- **Why:** stale recommendations signal the system not keeping up.

### Category fairness
- **Formula:** compare each category's exposures to its share of clicks (demand). Summarize disparity with the Gini coefficient of exposure shares, reported as `fairness = 1 − Gini` (1 = perfectly even).
- **Range:** 0–1.
- **Also report:** the most over-exposed category's exposure/demand ratio
- **Why:** prevents the system from systematically flooding topics.

### Fatigue exposure index
- **Formula:** per user, the share of their total exposures taken by their single most-shown category:
  `fatigue_u = max_c (exposures_{u,c}) / total_exposures_u`; index = mean over users. Higher = more fatigued.
- **Range:** 0–1.
- **Why:** repeated same-topic exposure over time drives churn