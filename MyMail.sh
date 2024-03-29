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
echo "360短信通统计简报----日报  $day2 "
echo "======================================="

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from USER_SUM_INFO_2013 where DATES = '$day2' and TYPES = 'ACTIVE' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from USER_SUM_INFO_2013 where DATES = '$day2' and TYPES = 'NEW' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from USER_SUM_INFO_2013 where DATES = '$day2' and TYPES = 'TOTAL' and DIME = 'ALL'");
if [ -z "$c" ];
then
	c=0
fi

echo
echo "1. 用户和群"
echo
echo "活跃用户数："$a", 新用户数："$b", 累计用户数："$c

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from GROUP_SUM_INFO_2013 where DATES = '$day2' and TYPES = 'group_count' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from GROUP_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'NEW' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from GROUP_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'DESTORY' and DIME = 'ALL'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from GROUP_SUM_INFO_2013 where DATES = '$day2' and TYPES = 'member_count' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

if [ -z "$a" -o $a = 0 ]
then
	e=0
else
	((e=$d/$a))
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CLIENT_STAT_INFO_2013 where DATES = '$day2' and TYPES = 'GID' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CLIENT_STAT_INFO_2013 where DATES = '$day2' and TYPES = 'GNUM' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

if [ -z "$f" -o $f = 0 ]
then
	h=0
else
	((h=$g/$f))
fi

i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from GROUP_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'ACTIVE' and DIME = 'ALL'");
if [ -z "$i" ];
then
	i=0
fi

echo "累计群聊数："$a",活跃群聊数："$i", 新建群聊数："$b", 销毁群聊数："$c", 平均群成员数："$e", 每人加入群聊数："$h

echo
echo "地区用户数分布"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_2013 where DATES = '$day2' and TYPES = 'AREA' order by VAL desc"

echo
echo "渠道用户数分布"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_2013 where DATES = '$day2' and TYPES = 'CHAN' order by VAL desc"

echo
echo "机型用户数分布"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_2013 where DATES = '$day2' and TYPES = 'MODEL' order by VAL desc"

echo
echo "使用次数网络类型分布"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_2013 where DATES = '$day2' and TYPES = 'NETWORK' order by VAL desc"

echo
echo
echo "2. 消息"

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CLIENT_STAT_INFO_2013 where DATES = '$day2' and TYPES = 'FID' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from CLIENT_STAT_INFO_2013 where DATES = '$day2' and TYPES = 'FEE' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi

echo
echo "发送收费短信用户数："$a", 发送收费短信数："$b

echo
echo "单聊消息数类型分布及流量(KB)"
#echo "消息类型 消息数 流量(B)"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select TYPES,DIME,sum(TEXT),sum(VOC),sum(IMG),sum(MAPS),sum(ANIMATION),sum(CUSTOMAPS),sum(CARD),sum(LOCATION),sum(DISTEXT),sum(DISIMG),sum(DISACK),sum(REACHACK),sum(INVITE_PEERVOC)  from PEER_QLOG_MSG_TYPE_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SET' group by DIME;" | awk 'BEGIN{nr = 0; a[0]="文本";a[1]="语音";a[2]="图片";a[3]="贴图";a[4]="动画";a[5]="用户自定义贴图";a[6]="名片";a[7]="地理位置";a[8]="阅后即焚文本";a[9]="阅后即焚图片";a[10]="阅后即焚回执";a[11]="消息已送达回执";a[12]="实时语音–被邀请加入单聊"} {++nr; if(nr==1) for(x=0;x<13;x++)
print a[x],$(x+3) ;else{ print "\n";for(y=0;y<13;y++) print a[y],$(y+3)/1024;}}'

echo
echo "群聊消息数类型分布"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, sum(VAL) from GROUP_QLOG_STAT_2013 where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME <> 'VOCSIZE' and left(DIME, 5) <> 'TOTAL' group by DIME" | awk '{a["TEXT"]="文本";a["VOC"]="语音";a["IMG"]="图片";a["MAPS"]="贴图";a["CARD"]="名片";a["LOCATION"]="位置";a["DISTEXT"]="阅后即焚文字条数";a["DISIMG"]="阅后即焚图片条数";a["TOTALIMG"]="从开始日到当日图片总条数";a["TOTALVOC"]="从开始日到当日语音总条数";print a[$1],$2,$3}'

echo
echo
echo "3. 单聊服务器性能"
echo

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'SET_NUM'");
if [ -z "$a" ];
then
	a=0
fi

b1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'TOTAL_SPENT'");
b2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'MATCH'");
if [ -z "$b2" -o $b2 = "NULL" -o $b2 = 0 ];
then
	b=0
else
	b=`echo "scale=2; $b1/$b2" | bc`
	#((b=$b1/$b2))
fi
c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select max(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME ='MAX_SPENT'");
if [ -z "$c" ];
then
	c=0
fi

d1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'MATCH'");
d2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'SET_NUM'");

 if [ -z "$d2" -o $d2 = "NULL" -o $d2 = 0 ];
 then
	 d=0
 else
	((d=$d1/$d2))
	# d=`echo "scale=2; $d1/$d2" | bc`
 fi

e1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'SET_NUM'");
e2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'MATCH'");
e3=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'SET_NUM'");
if [ -z "$e3" -o $e3 = "NULL" -o $e3 = 0 ];
then
	e=0
else
	e=`echo "scale=2; ($e1 - $e2)/$e3" | bc`
fi


printf "系统接收消息数:%d,平均消息存储时间:%.2f毫秒,最大消息存储时间:%d毫秒,消息存储成功率:%.2f%%,消息存储丢失率:%.2f%%\n" $a $b $c $d $e 

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'MATCH'");
if [ -z "$a" ];
then
	a=0
fi

b1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e " select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'TOTAL_SPENT'");
b2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e " select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'MATCH'");
if [ -z "$b2" -o $b2 = 0 ];
then
	b=0
else
	#((b=$b1/$b2))
	b=`echo "scale=2; $b1/$b2" | bc`
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select max(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME ='MAX_SPENT'");
if [ -z "$c" ];
then
	c=0
fi

d1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'MATCH'");
d2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'SET_NUM'");
if [ -z "$d2" -o $d2 = 0 ];
then
	d=0
else
 	#((d=$d1/$d2))
	d=`echo "scale=2; $d1/$d2" | bc`
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'EN' and DIME ='PEER'");
if [ "$b2" = 0 -a "$e" = 0 ];
then
	f=0
else
        f=`echo "scale=2;100*$e/($b2+$e)" | bc`
fi
echo "系统发出消息通知数："$a",通知丢失数："$e",通知丢失率："$f"%, 平均消息通知时间："$b"毫秒, 最大消息通知时间："$c"毫秒"
a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'GET_NUM'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'MATCH'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'MATCH'");
if [ -z "$c" ];
then
	c=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'MATCH'");
if [ -z "$h" ];
then
	h=0
fi

if [ -z "$c" -o $c = 0 ]
then
	i=0
else
	#((i=100*$h/$c))
	i=`echo "scale=2; 100*$h/$c" | bc`
fi

d1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'PG' and  DIME = 'TOTAL_SPENT'");
d2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'PG' and DIME = 'MATCH'");
if [ -z "$d2" -o $d2 = "NULL" -o $d2 = 0 ];
then
	d=0
else
	#((d=$d1/$d2))
	d=`echo "scale=2; $d1/$d2" | bc`
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select max(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'PG' and DIME = 'MAX_SPENT'");
if [ -z "$e" -o $e = "NULL" ];
then
	e=0
fi

j1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'GET_NUM'");
j2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'MATCH'");
j3=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'GET_NUM'");
if [ -z "$j3" -o $j3 = "NULL" -o $j3 = 0 ];
then
	j=0
else
	#((j=($j1-$j2)/$j3))
	j=`echo "scale=2; ($j1-$j2)/$j3" | bc`
fi

k1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'GET_NUM'");
k2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'MATCH'");
if [ -z "$k1" -o $k2 = "NULL" ];
then
	k=0
else
	((k=$k1-$k2))
fi

echo "系统发出消息数："$a", 当日接收的消息数："$b", 消息即时率："$i"%, 滞后消息数："$k", 消息滞后率："$j"%, 平均消息发送时间："$d"毫秒, 最大消息发送时间："$e"毫秒"

#群
echo
echo
echo "4. 群聊服务器性能"
echo

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'SET_NUM'");
if [ -z "$a" ];
then
	a=0
fi

b1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'TOTAL_SPENT'");
b2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'MATCH'");
if [ -z "$b2" -o $b2 = "NULL" -o $b2 = 0 ];
then
	b=0
else
	b=`echo "scale=2; $b1/$b2" | bc`
	#((b=$b1/$b2))
fi
c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select max(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME ='MAX_SPENT'");
if [ -z "$c" ];
then
	c=0
fi

#d1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'MATCH'");
#d2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'SET_NUM'");

#if [ -z "$d2" -o $d2 = "NULL" -o $d2 = 0 ];
#then
#	d=0
#else
	#((d=$d1/$d2))
#	d=`echo "scale=2; $d1/$d2" | bc`
#fi

e1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'FAIL'");
#e2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'MATCH'");
e2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'SET_NUM'");
if [ -z "$e2" -o $e2 = "NULL" -o $e2 = 0 ];
then
	e=0
        d=100
else
	#((e=100-d))
	e=`echo "scale=2; $e1/$e3" | bc`
	((d=100-e))
fi


printf "系统接收消息数:%d,平均消息存储时间:%.2f毫秒,最大消息存储时间:%d毫秒,消息存储成功率:%.2f%%,消息存储丢失率:%.2f%%\n" $a $b $c $d $e 

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'MATCH'");
if [ -z "$a" ];
then
	a=0
fi

b1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e " select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'TOTAL_SPENT'");
b2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e " select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'MATCH'");
if [ -z "$b2" -o $b2 = 0 ]; 
then
	b=0
else
	#((b=$b1/$b2))
	b=`echo "scale=2; $b1/$b2" | bc`
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select max(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME ='MAX_SPENT'");
if [ -z "$c" ];
then
	c=0
fi

d1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'MATCH'");
d2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'SET_NUM'");
if [ -z "$d2" -o $d2 = 0 ];
then
	d=0
else
 	#((d=$d1/$d2))
    d=`echo "scale=2; $d1/$d2" | bc`
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'EN' and DIME ='GROUP'");
f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'DISTRIBUTE' and DIME ='SET'");
g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'DISTRIBUTE' and DIME ='FAIL'");
if [ "$f" = 0 -o "$f" = "NULL" -a "$g" = 0 -o "$g" = "NULL" ];
then
      h=0
else
      h=`echo "scale=2;100*$e/($f+$g)" | bc`
fi

echo "系统发出消息通知数："$a",通知丢失数："$e",通知丢失率："$h"%,平均消息通知时间："$b"毫秒, 最大消息通知时间："$c"毫秒"
a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'GET_NUM'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'MATCH'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'MATCH'");
if [ -z "$c" ];
then
	c=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'MATCH'");
if [ -z "$h" ];
then
	h=0
fi


d1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'PG' and  DIME = 'TOTAL_SPENT'");
d2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'PG' and DIME = 'MATCH'");
if [ -z "$d2" -o $d2 = "NULL" -o $d2 = 0 ];
then
	d=0
else
	#((d=$d1/$d2))
        d=`echo "scale=2; $d1/$d2" | bc`
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select max(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'PG' and DIME = 'MAX_SPENT'");
if [ -z "$e" -o $e = "NULL" ];
then
	e=0
fi

j1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'GET_NUM'");
j2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'MATCH'");
j3=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'GET_NUM'");
if [ -z "$j3" -o $j3 = "NULL" -o $j3 = 0 ];
then
	j=0
else
	#((j=($j1-$j2)/$j3))
	j=`echo "scale=2; ($j1-$j2)/$j3" | bc`
fi

k1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'GET_NUM'");
k2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from GROUP_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SG' and DIME = 'MATCH'");
if [ -z "$k1" -o $k2 = "NULL" ];
then
	k=0
else
	((k=$k1-$k2))
fi

echo "系统发出消息数："$a", 当日接收的消息数："$b", 用户收取消息滞后数："$k", 用户收取消息及时数："$h", 平均消息发送时间："$d"毫秒, 最大消息发送时间："$e"毫秒"
#群
echo
echo 
echo "5. 图床性能"
echo
a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'UP' and DIME = 'TOTAL_SPENT'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'DOWN' and DIME = 'TOTAL_SPENT'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'UP' and DIME = 'TOTAL_NUM'");
if [ -z "$c" -o $c = 0 ];
then
	c=0
    ave_up=0
else   
    ((ave_up=$a/$c/1000))
fi
d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'DOWN' and DIME = 'TOTAL_NUM'");
if [ -z "$d" -o $d = 0 ];
then
	d=0
    ave_down=0
else
    ((ave_down=$b/$d/1000))
fi
e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select max(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'UP' and DIME = 'MAX_SPENT'");
if [ -z "$e" ];
then
	e=0
else  
    ((e=$e/1000))
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select max(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'DOWN' and DIME = 'MAX_SPENT'");
if [ -z "$f" ];
then
	f=0
else
    ((f=$f/1000))
fi
g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'UP' and DIME = 'TOTAL_SIZE'");
if [ -z "$g" ];
then
	g=0
else
    ((g=$g/1024))
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'DOWN' and DIME = 'TOTAL_SIZE'");
if [ -z "$h" ];
then
	h=0
else
    ((h=$h/1024))
fi
echo "图片上传总数："$c", 图片下载总数："$d", 图片上传平均耗时："$ave_up"毫秒, 图片上传最大耗时："$e"毫秒, 图片下载平均耗时："$ave_down"毫秒, 图片下载最大耗时："$f"毫秒, 图片上传总大小："$g"KB,图片下载总大小："$h"KB"

echo
echo "更多内容请访问   产品平台页面：http://10.105.18.101:8103/welcome/index"
echo "               单聊服务器页面：http://10.105.18.101:8104/index4.html"
echo "               群聊服务器页面：http://10.105.18.101:8104/index5.html"
echo
echo "--- 报告生成时间："`date`" ---"
echo

# Last Version 2013-11-27
