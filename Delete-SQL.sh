#! /bin/sh

root=/home/hdp-voice/
timehour=(14 15 16)
i=0
length=${#timehour[@]}
while [ $i -lt $length ]
do
    time=20140121${timehour[$i]}

    #echo `cat group_qlog_sql_$time.sql  | mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -A -f`
    echo `cat delete.sql  | mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -A -f`
    let i++
done
