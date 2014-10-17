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
echo "����ͳ�Ƽ�----4Сʱ��  $startTime -- $stopTime"
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
echo "1. �û���ͳ��"
echo
echo "1) ��¼˽���û�����"$a ", ���û�����"$b", ��Ծ�û�����"$c", �ۼ��ֶ�ע���û�����"$d", �ۼ��Զ�ע���û�����"$e
echo "2) ������������Դ"
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select * from QIAOQIAO_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'CHANNEL' order by VAL desc ";
echo "3) ����˽��������"$f ", ����˽��������"$g", ƽ������˽��������"$h
echo "4) ��ȡ˽��������"$i ", ��ȡ˽��������"$j", ƽ����ȡ˽��������"$k



 
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
echo "2. �û���Ϊ����ͳ��"
echo
echo "�����û�����"$a ", ��ȡ�����б��û�����"$b", ��ȡ���������û�����"$c", ��ȡ�����б��û�����"$d", �����û�����"$e", �Իظ����û�����"$f", �ظ��û�����"$g", ������Ϣ�����û�����"$h", �����û�����"$i", �ٱ��û�����"$j", �Ƴ������û�����"$k", ���Ͷ��ŷ����û�����"$l", �յ����ŷ����û�����"$m


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
echo "3. �û���Ϊ����ͳ��"
echo
echo "������Ŀ��"$a ", ��ȡ�����б���Ŀ��"$b", ��ȡ����������Ŀ��"$c", ��ȡ�����б���Ŀ��"$d", ������Ŀ��"$e", �Իظ�����Ŀ��"$f", �ظ��û���Ŀ��"$g", ������Ϣ������Ŀ��"$h", ������Ŀ��"$i", �ٱ���Ŀ��"$j", �Ƴ�������Ŀ��"$k
echo
echo "--- ��������ʱ�䣺"`date`" ---"
echo
