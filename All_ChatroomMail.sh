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
echo "游戏大厅统计简报----日报  $day2"
echo "====================================="

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_ACTIVE_USER_INFO_2013 where DATES = '$day2' and TYPES = 'ACTIVE' and DIME = 'USER'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_ACTIVE_USER_INFO_2013 where DATES = '$day2' and TYPES = 'ACTIVE' and DIME = 'TIME'");
if [ -z "$b" ];
then
	b=0
fi
if [ -z "$a" -o $a = 0 ]
then
	c=0
else
	#((c=$b/$a))
        c=`echo "scale = 2; $b/$a/3600" | bc`
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_ACTIVE_USER_INFO_2013 where DATES = '$day2' and TYPES = 'CHATNEW' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_ACTIVE_USER_INFO_2013 where DATES = '$day2' and TYPES = 'TOTAL' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'CHATMEM' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_ACTIVE_USER_INFO_2013 where DATES = '$day2' and TYPES = 'ONLINETIME' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

g=`echo "scale = 2; $g/3600" | bc`

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_ACTIVE_USER_INFO_2013 where DATES = '$day2' and TYPES = 'NUMBER' and DIME = 'ALL'");
if [ -z "$h" ];
then
	h=0
fi

if [ -z "$h" -o $h = 0 ]
then
	i=0
else
	#((i=$g/$h))
        i=`echo "scale = 2; $g/$h" | bc`
fi
echo
echo "1. 用户量统计"
echo
echo "登录登出聊天室人数："$a", 活跃用户数: "$f", 新用户数："$d", 累计用户数："$e", 平均使用时间："$c"小时"
echo
echo "在线人数："$h", 在线总时间: "$g"小时" ", 平均在线时间："$i"小时"

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'MSG' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'CHATMEM' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi
if [ -z "$b" -o $b = 0 ]
then
	c=0

else
	((c=$a/$b))
fi


echo
echo "2. 消息数量统计"
echo
echo "发消息总条数："$a", 聊天室发言的用户数："$b", 人均发送条数："$c

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'ACTIVE' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME = 'TEXT'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME = 'TOTALTEXT'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME = 'IMG'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME = 'TOTALIMG'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME = 'VOC'");
if [ -z "$f" ];
then
	f=0
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME = 'TOTALVOC'");
if [ -z "$g" ];
then
	g=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME = 'VOCSIZE'");
if [ -z "$h" ];
then
	h=0
else
       ((h=$h/1228))
fi

i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME = 'TOTALVOCSIZE'");
if [ -z "$i" ];
then
	i=0
else
       #((i=$i/1228))
        i=`echo "scale = 2; $i/1228/3600" | bc`
fi


echo
echo "3. 消息内容统计"
echo
echo "活跃聊天室个数："$a", 发送文字条数："$b", 累积发送文字条数："$c", 发送图片张数："$d", 累积发送图片张数："$e", 发送语音条数："$f",累积发送语音条数："$g",发送语音时长："$h"秒,累积发送语音时长："$i"小时"

echo
echo "4.游戏名称、聊天室人数、发消息人数、发消息总条数分布"
echo
#mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select * from CHAT_GAMEINFO_2013 where DATES = '$day2' and TYPES = 'GAMEINFO' order by MSGVAL desc limit 10"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select * from CHAT_GAMEINFO_2013 where DATES = '$day2' and TYPES = 'GAMEINFO' order by PLAYVAL desc limit 10"
echo
echo "更多内容请访问   游戏大厅统计页面：http://10.105.18.101:8106/chatroom/counts"
echo
echo "--- 报告生成时间："`date`" ---"
echo
