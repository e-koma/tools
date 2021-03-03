#!/bin/bash
# 友人の苦行YouTube検索のために用意したスクリプト(API Limitにより100件/dayが限度)

#API_KEY=

SEARCH_API=https://www.googleapis.com/youtube/v3/search
MAX_RESULT=1
file_list=$(cat file_list)

for query in $(echo "${file_list}"); do
  search_url="${SEARCH_API}?key=${API_KEY}&part=snippet&maxResults=${MAX_RESULT}&q=${query}"
  channel_id=$(curl -s "${search_url}" | jq -r .items[].id.channelId)
  echo "${query},https://www.youtube.com/channel/${channel_id}"
  sleep 1
done
