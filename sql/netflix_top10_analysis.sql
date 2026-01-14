-- Creating table
CREATE DATABASE yipitanalysis;
USE yipitanalysis;

CREATE TABLE nflx_top10_raw (
    date_added DATE,
    week DATE,
    category VARCHAR(50),
    show_title VARCHAR(255),
    season_title VARCHAR(255),
    weekly_rank INT,
    cumulative_weeks_in_top_10 INT,
    weekly_hours_viewed BIGINT
);


CREATE TABLE imdb_rating_raw (
    title VARCHAR(255),
    rating DECIMAL(3,1)
);

CREATE TABLE runtime_raw (
    title VARCHAR(255),
    runtime INT
);

SELECT COUNT(*) FROM nflx_top10_raw;
SELECT COUNT(*) FROM imdb_rating_raw;
SELECT COUNT(*) FROM runtime_raw;

SELECT * FROM nflx_top10_raw LIMIT 5;
SELECT * FROM imdb_rating_raw LIMIT 5;
SELECT * FROM runtime_raw LIMIT 5;

-- Do higher-ranked titles get more viewing hours?

SELECT
    category,
    weekly_rank,
    ROUND(AVG(weekly_hours_viewed), 0) AS avg_weekly_hours
FROM nflx_top10_raw
WHERE week <> '2022-05-22'
GROUP BY category, weekly_rank
ORDER BY category, weekly_rank;

-- IMDb RATING vs WEEKLY VIEWING HOURS

SELECT
    n.category,
    i.rating,
    ROUND(AVG(n.weekly_hours_viewed), 0) AS avg_weekly_hours
FROM nflx_top10_raw n
JOIN imdb_rating_raw i
    ON n.show_title = i.title
WHERE n.week <> '2022-05-22'
  AND i.rating > 0
GROUP BY n.category, i.rating
ORDER BY n.category, i.rating;

-- IMDb RATING vs CUMULATIVE WEEKS IN TOP 10

SELECT
    i.rating,
    ROUND(AVG(n.cumulative_weeks_in_top_10), 1) AS avg_weeks_in_top_10
FROM nflx_top10_raw n
JOIN imdb_rating_raw i
    ON n.show_title = i.title
WHERE i.rating > 0
GROUP BY i.rating
ORDER BY i.rating;

-- Among titles with similar IMDb ratings, does runtime influence weekly viewing hours?

SELECT
    i.rating,
    CASE
        WHEN r.runtime < 60 THEN '< 60 min'
        WHEN r.runtime BETWEEN 60 AND 120 THEN '60–120 min'
        ELSE '> 120 min'
    END AS runtime_bucket,
    ROUND(AVG(n.weekly_hours_viewed), 0) AS avg_weekly_hours
FROM nflx_top10_raw n
JOIN imdb_rating_raw i
    ON n.show_title = i.title
JOIN runtime_raw r
    ON n.show_title = r.title
WHERE n.week <> '2022-05-22'
  AND i.rating > 0
  AND r.runtime > 0
GROUP BY i.rating, runtime_bucket
ORDER BY i.rating, runtime_bucket;














    
    






