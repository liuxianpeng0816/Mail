#! /bin/sh

time=`date +%Y%m%d%H`
year=${time:0:4}
month=${time:4:2}
day=${time:6:2}
hour=${time:8:2}

if [ $1 ]
then
time=$1
year=${time:0:4}
month=${time:4:2}
day=${time:6:2}
hour=${time:8:2}
fi

MyselectTime=$year"-"$month"-"$day" "$hour

if [ $hour -eq 00 ];
then
        stophour=00:00AM

elif [ $hour -eq 04 ];
then
        stophour=04:00AM

elif [ $hour -eq 08 ];
then
        stophour=08:00AM

elif [ $hour -eq 12 ];
then
        stophour=12:00PM

elif [ $hour -eq 16 ];
then
        stophour=16:00PM
 
elif [ $hour -eq 20 ];
then
        stophour=20:00PM
fi

stopTime=$year"-"$month"-"$day" "$stophour

if [ $hour -eq 00 ];
then
        time=`date -d "1 days ago" +"%Y%m%d"`
        year=${time:0:4}
        month=${time:4:2}
        day=${time:6:2}
        starthour=20:00PM

elif [ $hour -eq 04 ];
then
        starthour=00:00AM

elif [ $hour -eq 08 ];
then
        starthour=04:00AM

elif [ $hour -eq 12 ];
then
        starthour=08:00AM

elif [ $hour -eq 16 ];
then
        starthour=12:00PM
 
elif [ $hour -eq 20 ];
then
        starthour=16:00PM
fi

startTime=$year"-"$month"-"$day" "$starthour

dbusr=root
dbpwd=360-voice-stat
dbname=360_ContactVoice_Stat
echo
echo "游戏大厅统计简报----4小时报  $startTime -- $stopTime"
echo "========================================================="

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_ACTIVE_USER_INFO_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'ACTIVE' and DIME = 'USER'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_ACTIVE_USER_INFO_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'ACTIVE' and DIME = 'TIME'");
if [ -z "$b" ];
then
	b=0
fi
if [ -z "$a" -o $a = 0 ]
then
	c=0
else
	((c=$b/$a))
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_ACTIVE_USER_INFO_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'CHATNEW' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

#e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_ACTIVE_USER_INFO_2013 where DATES = '$MyselectTime2' and TYPES = 'TOTAL' and DIME = 'ALL'");
#if [ -z "$e" ];
#then
#	e=0
#fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'CHATMEM' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi
echo
echo "1. 用户量统计"
echo
#echo "登录登出聊天室人数："$a ", 活跃用户数: "$f ", 新用户数："$d", 累计用户数："$e", 平均使用时间："$c"秒"
echo "登录登出聊天室人数："$a ", 活跃用户数: "$f ", 新用户数："$d ", 平均使用时间："$c"秒"

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'MSG' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'CHATMEM' and DIME = 'ALL'");
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

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'ACTIVE' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'MSGTYPE' and DIME = 'TEXT'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'MSGTYPE' and DIME = 'TOTALTEXT'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'MSGTYPE' and DIME = 'IMG'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'MSGTYPE' and DIME = 'TOTALIMG'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'MSGTYPE' and DIME = 'VOC'");
if [ -z "$f" ];
then
	f=0
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'MSGTYPE' and DIME = 'TOTALVOC'");
if [ -z "$g" ];
then
	g=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'MSGTYPE' and DIME = 'VOCSIZE'");
if [ -z "$h" ];
then
	h=0
else
       ((h=$h/1228))
fi

i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CHAT_QLOG_STAT_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'MSGTYPE' and DIME = 'TOTALVOCSIZE'");
if [ -z "$i" ];
then
	i=0
else
       ((i=$i/1228))
fi


echo
echo "3. 消息内容统计"
echo
echo "活跃聊天室个数："$a", 发送文字条数："$b", 累积发送文字条数："$c", 发送图片张数："$d", 累积发送图片张数："$e", 发送语音条数："$f",累积发送语音条数："$g",发送语音时长："$h"秒,累积发送语音时长："$i"秒"

echo
echo "4.游戏名称、聊天室人数、发消息人数、发消息总条数分布"
echo
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select * from CHAT_GAMEINFO_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'GAMEINFO' order by PLAYVAL desc limit 10"
echo
echo "更多内容请访问   游戏大厅统计页面：http://10.105.18.101:8106/chatroom/counts"
echo
echo "--- 报告生成时间："`date`" ---"
echo
