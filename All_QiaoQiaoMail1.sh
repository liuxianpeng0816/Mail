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
echo "����ͳ�Ƽ�----�ձ�  $day2"
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
echo "1. �û���ͳ��"
echo
echo "1) ��¼˽���û�����"$a ", ���û�����"$b", ��Ծ�û�����"$c", �ۼ��ֶ�ע���û�����"$d", �ۼ��Զ�ע���û�����"$e
echo "2) ������������Դ"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select * from QIAOQIAO_ACTIVE_2013 where DATES = '$day2' and TYPES = 'CHANNEL' order by VAL desc ";
echo "3) ����˽��������"$f ", ����˽��������"$g", ƽ������˽��������"$h
echo "4) ��ȡ˽��������"$i ", ��ȡ˽��������"$j", ƽ����ȡ˽��������"$k

 
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
echo "2. �û���Ϊ����ͳ��"
echo
echo "�����û�����"$a ", ��ȡ�����б��û�����"$b", ��ȡ���������û�����"$c", ��ȡ�����б��û�����"$d", �����û�����"$e", �Իظ����û�����"$f", �ظ��û�����"$g", ������Ϣ�����û�����"$h", �����û�����"$i", �ٱ��û�����"$j", �Ƴ������û�����"$k", ���Ͷ��ŷ����û�����"$l", �յ����ŷ����û�����"$m


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
echo "3. �û���Ϊ����ͳ��"
echo
echo "������Ŀ��"$a ", ��ȡ�����б���Ŀ��"$b", ��ȡ����������Ŀ��"$c", ��ȡ�����б���Ŀ��"$d", ������Ŀ��"$e", �Իظ�����Ŀ��"$f", �ظ��û���Ŀ��"$g", ������Ϣ������Ŀ��"$h", ������Ŀ��"$i", �ٱ���Ŀ��"$j", �Ƴ�������Ŀ��"$k
echo

echo "��������������ʣ�http://10.105.18.101:8106/qiaoqiao/usercount"
echo
echo "--- ��������ʱ�䣺"`date`" ---"
echo
