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
echo "$day2 360����ͳ�Ƽ�"
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
echo "1. �û���Ⱥ"
echo
echo "��Ծ�û�����"$a", ���û�����"$b", �ۼ��û�����"$c

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

echo "�ۼ�Ⱥ������"$a", �½�Ⱥ������"$b", ����Ⱥ������"$c", ƽ��Ⱥ��Ա����"$e", ÿ�˼���Ⱥ������"$h

echo
echo "�����û����ֲ�"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_$year where DATES = '$day2' and TYPES = 'AREA' order by VAL desc"

echo
echo "�����û����ֲ�"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_$year where DATES = '$day2' and TYPES = 'CHAN' order by VAL desc"

echo
echo "�����û����ֲ�"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_$year where DATES = '$day2' and TYPES = 'MODEL' order by VAL desc"

echo
echo "ʹ�ô����������ͷֲ�"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, VAL from ACTIVE_USER_INFO_$year where DATES = '$day2' and TYPES = 'NETWORK' order by VAL desc"

echo
echo
echo "2. ��Ϣ"

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
echo "�����շѶ����û�����"$a", �����շѶ�������"$b

echo
echo "������Ϣ�����ͷֲ�������(KB)"
#echo "��Ϣ���� ��Ϣ�� ����(B)"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select TYPES,DIME,sum(TEXT),sum(VOC),sum(IMG),sum(MAPS),sum(ANIMATION),sum(CUSTOMAPS),sum(CARD),sum(LOCATION),sum(DISTEXT),sum(DISIMG),sum(DISACK),sum(REACHACK),sum(INVITE_PEERVOC)  from PEER_QLOG_MSG_TYPE_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SET' group by DIME;" | awk 'BEGIN{nr = 0; a[0]="�ı�";a[1]="����";a[2]="ͼƬ";a[3]="��ͼ";a[4]="����";a[5]="�û��Զ�����ͼ";a[6]="��Ƭ";a[7]="����λ��";a[8]="�ĺ󼴷��ı�";a[9]="�ĺ󼴷�ͼƬ";a[10]="�ĺ󼴷ٻ�ִ";a[11]="��Ϣ���ʹ��ִ";a[12]="ʵʱ�����C��������뵥��"} {++nr; if(nr==1) for(x=0;x<13;x++)
print a[x],$(x+3) ;else for(y=0;y<13;y++) print a[y],$(y+3)/1024;}'

echo
echo "Ⱥ����Ϣ�����ͷֲ�"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, sum(VAL) from GROUP_QLOG_STAT_$year where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME <> 'VOCSIZE' and left(DIME, 5) <> 'TOTAL' group by DIME" | awk '{a["TEXT"]="�ı�";a["VOC"]="����";a["IMG"]="ͼƬ";a["MAPS"]="��ͼ";a["CARD"]="��Ƭ";a["LOCATION"]="λ��";a["DISTEXT"]="�ĺ󼴷���������";a["DISIMG"]="�ĺ󼴷�ͼƬ����";a["TOTALIMG"]="�ӿ�ʼ�յ�����ͼƬ������";a["TOTALVOC"]="�ӿ�ʼ�յ���������������";print a[$1],$2,$3}'

echo
echo
echo "3. ����Ⱥ����"
echo

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'SET_NUM'");
if [ -z "$a" ];
then
	a=0
fi

b1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'TOTAL_SPENT'");
b2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'MATCH'");
if [ -z "$b2" -o $b2 = "NULL" ];
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

if [ -z "$d2" -o $d2 = "NULL" ];
then
	d=0
else
	#((d=$d1/$d2))
	d=`echo "scale=2; $d1/$d2" | bc`
fi

e1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'SET_NUM'");
e2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select 100 * sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'MATCH'");
e3=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SS' and DIME = 'SET_NUM'");
if [ -z "$e3" -o $e3 = "NULL" ];
then
	e=0
else
	#((e=100-d))
	e=`echo "scale=2; ($e1 - $e2)/$e3" | bc`
fi


printf "ϵͳ������Ϣ��:%d,ƽ����Ϣ�洢ʱ��:%.2f����,�����Ϣ�洢ʱ��:%d����,��Ϣ�洢�ɹ���:%.2f%%,��Ϣ�洢��ʧ��:%.2f%%\n" $a $b $c $d $e 
#echo "ϵͳ������Ϣ��: "$a", ƽ����Ϣ�洢ʱ�䣺"$b"����, �����Ϣ�洢ʱ�䣺"$c"����, ��Ϣ�洢�ɹ��ʣ�"$d"%, ��Ϣ�洢��ʧ�ʣ�"$e"%"
a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'MATCH'");
if [ -z "$a" ];
then
	a=0
fi

b1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e " select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'TOTAL_SPENT'");
b2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e " select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'SN' and DIME = 'MATCH'");
if [ -z "$b2" -o $b2 = "NULL" ];
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
if [ -z "$d2" ];
then
	d=0
else
 	#((d=$d1/$d2))
	d=`echo "scale=2; $d1/$d2" | bc`
fi
echo "ϵͳ������Ϣ֪ͨ����"$a", ƽ����Ϣ֪ͨʱ�䣺"$b"����, �����Ϣ֪ͨʱ�䣺"$c"����"
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

if [ $c -eq 0 ]
then
	i=0
else
	#((i=100*$h/$c))
	i=`echo "scale=2; 100*$h/$c" | bc`
fi

d1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'PG' and  DIME = 'TOTAL_SPENT'");
d2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select sum(VAL) from PEER_QLOG_STAT_INFO_2013 where left(DATES, 10) = '$day2' and TYPES = 'PG' and DIME = 'MATCH'");
if [ -z "$d2" -o $d2 = "NULL" ];
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
if [ -z "$j3" -o $j3 = "NULL" ];
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

echo "ϵͳ������Ϣ����"$a", ���ս��յ���Ϣ����"$b", ��Ϣ��ʱ�ʣ�"$i"%, �ͺ���Ϣ����"$k", ��Ϣ�ͺ��ʣ�"$j"%, ƽ����Ϣ����ʱ�䣺"$d"����, �����Ϣ����ʱ�䣺"$e"����"
echo
echo "������������� http://"
echo
echo "--- ��������ʱ�䣺"`date`" ---"
echo

# Last Version 2013-11-27
