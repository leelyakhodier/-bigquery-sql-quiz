## TASK 1 & 2

-- This query shows a list of the daily top Google Search terms.
-- TASKS 1 & 2
SELECT
  refresh_date AS Day,
  term AS Top_Term,
  -- These search terms are in the top 25 in the US each day.
  rank
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
  rank <= 3
  -- Choose only the top term each day.
  AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
  -- Filter to the last 2 weeks.
GROUP BY Day, Top_Term, rank
ORDER BY Day DESC
-- Show the days in reverse chronological order.


----------------------------------------------------

## TASK 3
-- This query shows a list of the daily top Google Search terms.
-- TASKS 3
SELECT
  refresh_date AS Day,
  term AS Top_Term,
  country_name AS region,
  -- These search terms are in the top 25 in the US each day.
  rank
FROM `bigquery-public-data.google_trends.international_top_rising_terms`
WHERE
  rank <= 3
  -- Choose only the top term each day.
  AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
  -- Filter to the last 2 weeks.
  AND country_name='United Kingdom'
GROUP BY Day, Top_Term, region
ORDER BY Day DESC
-- Show the days in reverse chronological order.


-----------------------------------------------------

## TASK 5
-- This query shows a list of the daily top Google Search terms.
-- TASK 5
SELECT
   refresh_date AS Day,
   term AS Top_Term,
   FORMAT_TIMESTAMP("%Y-%U", refresh_date) AS Week, 
   ARRAY_AGG(term ORDER BY rank ASC) AS Top_Terms 
       -- These search terms are in the top 25 in the US each day.

FROM `bigquery-public-data.google_trends.top_terms`
WHERE
   rank <= 3
       -- Choose only the top term each day.
   AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
       -- Filter to the last 2 weeks.
GROUP BY Day, Top_Term,Week, rank
ORDER BY Day,Week DESC
   -- Show the days in reverse chronological order.



