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
echo "΢��ͳ�Ƽ�----�ձ�  $day2"
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
echo "1. �û���¼����Ϣ�Լ���ʱͳ��"
echo
echo  "��¼������"$a
echo  "�����͵�����Ϣ������"$b", �ɹ��·�������Ϣ������"$c", �ɹ��·���Ϣ��ʱ ��"$d"��"
echo  "������ȫ����Ϣ������"$e", �ɹ��·�ȫ����Ϣ������"$f", �ɹ��·���Ϣ��ʱ ��"$g"��"

 

echo
echo "--- ��������ʱ�䣺"`date`" ---"
echo
