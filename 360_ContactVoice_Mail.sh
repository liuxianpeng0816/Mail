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
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select MSG_TYPE, sum(LAUNCH), sum(FLOW)/1024 from QLOG_STAT_$year where left(STAT_TIME, 10) = '$day2' and TYPES = 'SSF' group by MSG_TYPE" | awk '{a[0]="�ı�";a[1]="����";a[2]="ͼƬ";a[3]="��ͼ-���õ���Դö��";a[4]="����";a[5]="�û��Զ�����ͼ-�û�����";a[6]="��Ƭ";a[7]="����λ��";a[99]="��Ϣ���ʹ��ִ";a[1000]="ע��͸��������޸ĵķ���֪ͨ";a[888000]="�ĺ󼴷�-�ı�";a[888002]="�ĺ󼴷�-ͼƬ";a[888009]="�ĺ󼴷�-��ִ";a[999000]="ʵʱ�����C��������뵥��";print a[$1],$2,$3}'

echo
echo "Ⱥ����Ϣ�����ͷֲ�"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select DIME, sum(VAL) from GROUP_QLOG_STAT_$year where DATES = '$day2' and TYPES = 'MSGTYPE' and DIME <> 'VOCSIZE' and left(DIME, 5) <> 'TOTAL' group by DIME" | awk '{a["TEXT"]="�ı�";a["VOC"]="����";a["IMG"]="ͼƬ";a["MAPS"]="��ͼ";a["CARD"]="��Ƭ";a["LOCATION"]="λ��";a["DISTEXT"]="�ĺ󼴷���������";a["DISIMG"]="�ĺ󼴷�ͼƬ����";a["TOTALIMG"]="�ӿ�ʼ�յ�����ͼƬ������";a["TOTALVOC"]="�ӿ�ʼ�յ���������������";print a[$1],$2,$3}'

echo
echo
echo "3. ����Ⱥ����"
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

echo "ϵͳ������Ϣ����"$a", ƽ����Ϣ�洢ʱ�䣺"$b"����, �����Ϣ�洢ʱ�䣺"$c"����, ��Ϣ�洢�ɹ��ʣ�"$d"%, ��Ϣ�洢��ʧ�ʣ�"$e"%"

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

echo "ϵͳ������Ϣ֪ͨ����"$a", ƽ����Ϣ֪ͨʱ�䣺"$b"����, �����Ϣ֪ͨʱ�䣺"$c"����"

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

echo "ϵͳ������Ϣ����"$a", ���ս��յ���Ϣ����"$b", ��Ϣ��ʱ�ʣ�"$i"%, �ͺ���Ϣ����"$k", ��Ϣ�ͺ��ʣ�"$j"%, ƽ����Ϣ����ʱ�䣺"$d"����, �����Ϣ����ʱ�䣺"$e"����"
echo
echo "������������� http://"
echo
echo "--- ��������ʱ�䣺"`date`" ---"
echo

# Last Version 2013-11-
