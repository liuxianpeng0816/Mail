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
echo "悄悄统计简报----日报  $day2"
echo "================================"

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'LOGIN' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'NEW' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ACTIVE' and DIME = 'USER'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'MANREG' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'INVITEREG' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SENDNUM' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SENDMEM' and DIME = 'ALL'");
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

i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'GETNUM' and DIME = 'ALL'");
if [ -z "$i" ];
then
	i=0
fi

j=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'GETMEM' and DIME = 'ALL'");
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
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select * from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'CHANNEL' order by VAL desc ";
echo "3) 发送私信条数："$f ", 发送私信人数："$g", 平均发送私信条数："$h
echo "4) 收取私信条数："$i ", 收取私信人数："$j", 平均收取私信条数："$k

 
a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'POSTMESSAGE_MEM' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'BROWSELIST_MEM' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi
c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'BROWSEDETAIL_MEM' and DIME = 'ALL'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'BROWSEREPLY_MEM' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi
e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'LIKEMESSAGE_MEM' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'LIKEREPLY_MEM' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi
g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'REPLY_MEM' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SUBSCRIBE_MEM' and DIME = 'ALL'");
if [ -z "$h" ];
then
	h=0
fi
i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'FEEDBACK_MEM' and DIME = 'ALL'");
if [ -z "$i" ];
then
	i=0
fi

j=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'REPORT_MEM' and DIME = 'ALL'");
if [ -z "$j" ];
then
	j=0
fi
k=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'REMOVE_MEM' and DIME = 'ALL'");
if [ -z "$k" ];
then
	k=0
fi

l=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SHARE' and DIME = 'ALL'");
if [ -z "$l" ];
then
	l=0
fi

m=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'RECEIVE' and DIME = 'ALL'");
if [ -z "$m" ];
then
	m=0
fi


echo
echo "2. 用户行为人数统计"
echo
echo "发帖用户数："$a ", 获取主题列表用户数："$b", 获取内容详情用户数："$c", 获取评论列表用户数："$d", 点赞用户数："$e", 对回复赞用户数："$f", 回复用户数："$g", 订阅消息提醒用户数："$h", 反馈用户数："$i", 举报用户数："$j", 移除主题用户数："$k", 发送短信分享用户数："$l", 收到短信分享用户数："$m


a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'POSTMESSAGE' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'BROWSELIST' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi
c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'BROWSEDETAIL' and DIME = 'ALL'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'BROWSEREPLY' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi
e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'LIKEMESSAGE' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'LIKEREPLY' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi
g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'REPLY' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SUBSCRIBE' and DIME = 'ALL'");
if [ -z "$h" ];
then
	h=0
fi
i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'FEEDBACK' and DIME = 'ALL'");
if [ -z "$i" ];
then
	i=0
fi

j=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'REPORT' and DIME = 'ALL'");
if [ -z "$j" ];
then
	j=0
fi
k=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'REMOVE' and DIME = 'ALL'");
if [ -z "$k" ];
then
	k=0
fi


echo
echo "3. 用户行为内容统计"
echo
echo "发帖数目："$a ", 获取主题列表数目："$b", 获取内容详情数目："$c", 获取评论列表数目："$d", 点赞数目："$e", 对回复赞数目："$f", 回复用户数目："$g", 订阅消息提醒数目："$h", 反馈数目："$i", 举报数目："$j", 移除主题数目："$k
echo

echo "悄悄留存率请访问：http://10.105.18.101:8106/qiaoqiao/usercount"
echo
echo "--- 报告生成时间："`date`" ---"
echo
