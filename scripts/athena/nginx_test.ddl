CREATE EXTERNAL TABLE IF NOT EXISTS `<DB>`.`<Table_Name>` (
`remote_addr` string,
`remote_user` string,
`method` string,
`path` string,
`HTTP` string,
`req_time` string,
`upstream_req_time` string,
`status` string,
`size` string,
`http_referer` string,
`user_agent` string,
`request_body` string,
`x_forwarded_for` string,
`time` string
) PARTITIONED BY (
year string,
month string,
day string
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
'serialization.format' = '1'
) LOCATION 's3://lemon-prod-logs/nginx/production/access'
TBLPROPERTIES ('has_encrypted_data'='false');

