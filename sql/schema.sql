CREATE TABLE dim_news(
	news_id		TEXT PRIMARY KEY,
	category	TEXT,
	subcategory	TEXT,
	title	TEXT,
	abstract TEXT,
	url	TEXT
);

CREATE TABLE fact_impressions(
	impression_id	BIGINT,
	user_id	TEXT,
	news_id	TEXT REFERENCES dim_news(news_id),
	shown_at	TIMESTAMP,
	clicked	SMALLINT,
	rank_in_list	INT
);
CREATE INDEX idx_fact_user ON fact_impressions(user_id);
CREATE INDEX idx_fact_news ON fact_impressions(news_id);

TRUNCATE fact_impressions, dim_news;

