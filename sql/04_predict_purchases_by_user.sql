-- Aggregate predicted purchase labels by visitor ID.
SELECT
  fullVisitorId,
  SUM(predicted_label) AS total_predicted_purchases
FROM
  ML.PREDICT(
    MODEL `bqml_lab.sample_model`,
    (
      SELECT
        IFNULL(device.operatingSystem, "") AS os,
        device.isMobile AS is_mobile,
        IFNULL(totals.pageviews, 0) AS pageviews,
        IFNULL(geoNetwork.country, "") AS country,
        fullVisitorId
      FROM
        `bigquery-public-data.google_analytics_sample.ga_sessions_*`
      WHERE
        _TABLE_SUFFIX BETWEEN '20170701' AND '20170801'
    )
  )
GROUP BY fullVisitorId
ORDER BY total_predicted_purchases DESC
LIMIT 10;
