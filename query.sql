SELECT DISTINCT a.StockTicker, a.Highest_Hourly_Price, ts AS datetime, a.hour
FROM (
    SELECT name AS StockTicker, (EXTRACT(HOUR FROM (CAST(ts AS TIMESTAMP))) - 4) AS hour, max(high) as Highest_Hourly_Price
    FROM stockdata14
    GROUP BY 1, 2
    ORDER BY 1, 2
    ) a,
    stockdata14 b
WHERE a.StockTicker=b.name 
AND a.hour = (EXTRACT(HOUR FROM (CAST(ts AS TIMESTAMP))) - 4)
AND a.Highest_Hourly_Price = b.high
ORDER BY 1, 4
;