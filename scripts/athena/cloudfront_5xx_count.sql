SELECT *
FROM "default"."cloudfront_logs"
WHERE status IN (500, 501, 502, 503, 504, 505, 506, 507, 508, 509)
        AND "date"
    BETWEEN DATE '2021-10-11'
        AND DATE '2021-10-13'
ORDER BY date DESC LIMIT 200;
