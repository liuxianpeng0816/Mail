#! /bin/sh

day=`date -d "1 days ago" +"%Y%m%d"`

if [ $1 ]
then
	day=$1
fi

year=${day:0:4}
day2=$year-${day:4:2}-${day:6:2}

dbusr=root
dbpwd=360-voice-stat
dbname=360_ContactVoice_Stat
echo
echo "微密统计简报----日报  $day2"
echo "========================================================="

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from WEIMI_ACTIVE_2013 where DATES = '$day2' and TYPES = 'LOGIN' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from WEIMI_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SINGLESEND' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from WEIMI_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SINGLESUCCESS' and DIME = 'ALL'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from WEIMI_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SINGLECOUNT' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from WEIMI_ACTIVE_2013 where DATES = '$day2' and TYPES = 'GROUPSEND' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from WEIMI_ACTIVE_2013 where DATES = '$day2' and TYPES = 'GROUPSUCCESS' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from WEIMI_ACTIVE_2013 where DATES = '$day2' and TYPES = 'GROUPCOUNT' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

echo
echo "1. 用户登录发消息以及耗时统计"
echo
echo  "登录人数："$a
echo  "请求发送单聊消息条数："$b", 成功下发单聊消息条数："$c", 成功下发消息耗时 ："$d"秒"
echo  "请求发送全量消息条数："$e", 成功下发全量消息条数："$f", 成功下发消息耗时 ："$g"秒"

 

echo
echo "--- 报告生成时间："`date`" ---"
echo
