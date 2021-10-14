SELECT client_ip, COUNT(client_ip) AS count_
FROM "default"."alb_logs"
WHERE elb_status_code IN ('500','501','502','503','504','505','506','507','508','509')
        AND parse_datetime(time,'yyyy-MM-dd''T''HH:mm:ss.SSSSSS''Z')
    BETWEEN timestamp '2021-10-14 00:00 Asia/Tokyo'
        AND timestamp '2021-10-14 23:59 Asia/Tokyo'
GROUP BY client_ip
ORDER BY count_ DESC
