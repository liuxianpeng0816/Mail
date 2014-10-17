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
echo "悄悄统计简报----4小时报  $startTime -- $stopTime"
echo "======================================================"

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'LOGIN' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'NEW' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime'  and TYPES = 'ACTIVE' and DIME = 'USER'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'MANREG' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'INVITEREG' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'SENDNUM' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'SENDMEM' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

if [ -z "$g" -o $g = 0 ]
then
	h=0

else
	((h=$f/$g))
fi

i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'GETNUM' and DIME = 'ALL'");
if [ -z "$i" ];
then
	i=0
fi

j=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'GETMEM' and DIME = 'ALL'");
if [ -z "$j" ];
then
	j=0
fi

if [ -z "$j" -o $j = 0 ]
then
	k=0

else
	((k=$i/$j))
fi
echo
echo "1. 用户量统计"
echo
echo "1) 登录私聊用户数："$a ", 新用户数："$b", 活跃用户数："$c", 累计手动注册用户数："$d", 累计自动注册用户数："$e
echo "2) 悄悄渠道包来源"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select * from QIAOQIAO_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'CHANNEL' order by VAL desc ";
echo "3) 发送私信条数："$f ", 发送私信人数："$g", 平均发送私信条数："$h
echo "4) 收取私信条数："$i ", 收取私信人数："$j", 平均收取私信条数："$k



 
a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime'  and TYPES = 'POSTMESSAGE_MEM' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime'  and TYPES = 'BROWSELIST_MEM' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi
c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime'  and TYPES = 'BROWSEDETAIL_MEM' and DIME = 'ALL'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime'  and TYPES = 'BROWSEREPLY_MEM' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi
e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime'  and TYPES = 'LIKEMESSAGE_MEM' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'LIKEREPLY_MEM' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi
g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'REPLY_MEM' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'SUBSCRIBE_MEM' and DIME = 'ALL'");
if [ -z "$h" ];
then
	h=0
fi
i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'FEEDBACK_MEM' and DIME = 'ALL'");
if [ -z "$i" ];
then
	i=0
fi

j=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'REPORT_MEM' and DIME = 'ALL'");
if [ -z "$j" ];
then
	j=0
fi
k=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'REMOVE_MEM' and DIME = 'ALL'");
if [ -z "$k" ];
then
	k=0
fi

l=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'SHARE' and DIME = 'ALL'");
if [ -z "$l" ];
then
	l=0
fi

m=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'RECEIVE' and DIME = 'ALL'");
if [ -z "$m" ];
then
	m=0
fi


echo
echo "2. 用户行为人数统计"
echo
echo "发帖用户数："$a ", 获取主题列表用户数："$b", 获取内容详情用户数："$c", 获取评论列表用户数："$d", 点赞用户数："$e", 对回复赞用户数："$f", 回复用户数："$g", 订阅消息提醒用户数："$h", 反馈用户数："$i", 举报用户数："$j", 移除主题用户数："$k", 发送短信分享用户数："$l", 收到短信分享用户数："$m


a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime'  and TYPES = 'POSTMESSAGE' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'BROWSELIST' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi
c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'BROWSEDETAIL' and DIME = 'ALL'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime'  and TYPES = 'BROWSEREPLY' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi
e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'LIKEMESSAGE' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'LIKEREPLY' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi
g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'REPLY' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'SUBSCRIBE' and DIME = 'ALL'");
if [ -z "$h" ];
then
	h=0
fi
i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime'  and TYPES = 'FEEDBACK' and DIME = 'ALL'");
if [ -z "$i" ];
then
	i=0
fi

j=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime'  and TYPES = 'REPORT' and DIME = 'ALL'");
if [ -z "$j" ];
then
	j=0
fi
k=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2014 where left( DATES,13) = '$MyselectTime' and TYPES = 'REMOVE' and DIME = 'ALL'");
if [ -z "$k" ];
then
	k=0
fi


echo
echo "3. 用户行为内容统计"
echo
echo "发帖数目："$a ", 获取主题列表数目："$b", 获取内容详情数目："$c", 获取评论列表数目："$d", 点赞数目："$e", 对回复赞数目："$f", 回复用户数目："$g", 订阅消息提醒数目："$h", 反馈数目："$i", 举报数目："$j", 移除主题数目："$k
echo
echo "--- 报告生成时间："`date`" ---"
echo
