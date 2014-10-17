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
echo "$day2 360短信统计简报"
echo "================================================"

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from USER_SUM_INFO_$year where DATES = '$day2' and TYPES = 'ACTIVE' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from USER_SUM_INFO_$year where DATES = '$day2' and TYPES = 'NEW' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from USER_SUM_INFO_$year where DATES = '$day2' and TYPES = 'TOTAL' and DIME = 'ALL'");
if [ -z "$c" ];
then
	c=0
fi

echo
echo "1. 用户和群"
echo
echo "活跃用户数："$a", 新用户数："$b", 累计用户数："$c

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from GROUP_SUM_INFO_$year where DATES = '$day2' and TYPES = 'group_count' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from GROUP_QLOG_STAT_$year where DATES = '$day2' and TYPES = 'NEW' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from GROUP_QLOG_STAT_$year where DATES = '$day2' and TYPES = 'DESTORY' and DIME = 'ALL'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from GROUP_SUM_INFO_$year where DATES = '$day2' and TYPES = 'member_count' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

if [ $a -eq 0 ]
then
	e=0
else
	((e=$d/$a))
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CLIENT_STAT_INFO_$year where DATES = '$day2' and TYPES = 'GID' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CLIENT_STAT_INFO_$year where DATES = '$day2' and TYPES = 'GNUM' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

if [ $f -eq 0 ]
then
	h=0
else
	((h=$g/$f))
fi

echo "累计群聊数："$a", 新建群聊数："$b", 销毁群聊数："$c", 平均群成员数："$e", 每人加入群聊数："$h

echo
echo "地区用户数分布"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_$year where DATES = '$day2' and TYPES = 'AREA' order by VAL desc"

echo
echo "渠道用户数分布"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_$year where DATES = '$day2' and TYPES = 'CHAN' order by VAL desc"

echo
echo "机型用户数分布"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_$year where DATES = '$day2' and TYPES = 'MODEL' order by VAL desc"

echo
echo "使用次数网络类型分布"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_$year where DATES = '$day2' and TYPES = 'NETWORK' order by VAL desc"

echo
echo
echo "2. 消息"

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CLIENT_STAT_INFO_$year where DATES = '$day2' and TYPES = 'FID' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CLIENT_STAT_INFO_$year where DATES = '$day2' and TYPES = 'FEE' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi

echo
echo "发送收费短信用户数："$a", 发送收费短信数："$b

echo
echo "单聊消息数类型分布及流量(KB)"
#echo "消息类型 消息数 流量(B)"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select MSG_TYPE, sum(LAUNCH), sum(FLOW)/1024 from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SSF' group by MSG_TYPE" | awk '{a[0]="文本";a[1]="语音";a[2]="图片";a[3]="贴图-内置的资源枚举";a[4]="动画";a[5]="用户自定义贴图-用户导入";a[6]="名片";a[7]="地理位置";a[99]="消息已送达回执";a[1000]="注册和个人中心修改的反向通知";a[888000]="阅后即焚-文本";a[888002]="阅后即焚-图片";a[888009]="阅后即焚-回执";a[999000]="实时语音–被邀请加入单聊";print a[$1],$2,$3}'

echo
echo "群聊消息数类型分布"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, sum(VAL) from GROUP_QLOG_STAT_$year where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME <> 'VOCSIZE' and left(DIME, 5) <> 'TOTAL' group by DIME" | awk '{a["TEXT"]="文本";a["VOC"]="语音";a["IMG"]="图片";a["MAPS"]="贴图";a["CARD"]="名片";a["LOCATION"]="位置";a["DISTEXT"]="阅后即焚文字条数";a["DISIMG"]="阅后即焚图片条数";a["TOTALIMG"]="从开始日到当日图片总条数";a["TOTALVOC"]="从开始日到当日语音总条数";print a[$1],$2,$3}'

echo
echo
echo "3. 服务集群性能"
echo

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(SET_NUM) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SS'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(TOTAL_SPAN)/sum(LAUNCH) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SS'");
if [ -z "$b" -o $b = "NULL" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select max(MAX_SPENT) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SS'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100*sum(LAUNCH)/sum(SET_NUM) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SS'");
if [ -z "$d" -o $d = "NULL" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100*(sum(SET_NUM)-sum(LAUNCH))/sum(SET_NUM) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SS'");
if [ -z "$e" -o $e = "NULL" ];
then
	e=0
fi

echo "系统接收消息数："$a", 平均消息存储时间："$b"毫秒, 最大消息存储时间："$c"毫秒, 消息存储成功率："$d"%, 消息存储丢失率："$e"%"

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(LAUNCH) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SN'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(TOTAL_SPAN)/sum(LAUNCH) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SN'");
if [ -z "$b" -o $b = "NULL" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select max(MAX_SPENT) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SN'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100*sum(LAUNCH)/sum(SET_NUM) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SN'");
if [ -z "$d" ];
then
	d=0
fi

echo "系统发出消息通知数："$a", 平均消息通知时间："$b"毫秒, 最大消息通知时间："$c"毫秒"

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(LAUNCH) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SG'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(SET_NUM) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SG'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(LAUNCH) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SS'");
if [ -z "$c" ];
then
	c=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(SET_NUM) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SG'");
if [ -z "$h" ];
then
	h=0
fi

if [ $c -eq 0 ]
then
	i=0
else
	((i=100*$h/$c))
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(TOTAL_SPAN)/sum(LAUNCH) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'PG'");
if [ -z "$d" -o $d = "NULL" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select max(MAX_SPENT) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'PG'");
if [ -z "$e" -o $e = "NULL" ];
then
	e=0
fi

j=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100*(sum(LAUNCH)-sum(SET_NUM))/sum(LAUNCH) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SG'");
if [ -z "$j" -o $j = "NULL" ];
then
	j=0
fi

k=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select (sum(LAUNCH)-sum(SET_NUM)) from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SG'");
if [ -z "$k" ];
then
	k=0
fi

echo "系统发出消息数："$a", 当日接收的消息数："$b", 消息即时率："$i"%, 滞后消息数："$k", 消息滞后率："$j"%, 平均消息发送时间："$d"毫秒, 最大消息发送时间："$e"毫秒"
echo
echo "更多内容请访问 http://"
echo
echo "--- 报告生成时间："`date`" ---"
echo

# Last Version 2013-11-
