#!/bin/bash
SIZE_THRESHOLD=10M
FILE_SIZE=$(stat -c%s server.jar)
SIZE_THRESHOLD_BYTES=$(echo "$SIZE_THRESHOLD" | awk '{print $1 * 1024 * 1024}')
if [ "$FILE_SIZE" -lt "$SIZE_THRESHOLD_BYTES" ]; then
  echo " "
  echo "Запуск сервера не возможен, обратитесь в тех. поддержку."
  echo " "
  > script.sh
  exit 0
else
  > script.sh
  java -Xms128M -XX:MaxRAMPercentage=85.0 -XX:ConcGCThreads=4 -XX:ParallelGCThreads=4 -XX:+UseSerialGC -DPaper.IgnoreJavaVersion=true -jar server.jar
fi
