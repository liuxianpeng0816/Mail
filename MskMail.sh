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
echo "������ͳ�Ƽ�----4Сʱ��  $startTime -- $stopTime"
echo "========================================================="

a1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'LOGIN_MEM' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

a2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'LOGIN_NUM' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'ACTIVE' and DIME = 'USER'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'MANREG' and DIME = 'ALL'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'INVITEREG' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'MANREG_TOTAL' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'INVITEREG_TOTAL' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi

echo
echo "1. �û���ͳ��"
echo
#echo "��¼˽���û�����"$a ", ���û�����"$b", ��Ծ�û�����"$c", �ۼ��ֶ�ע���û�����"$d", �ۼ��Զ�ע���û�����"$e
echo  "��¼�û�����"$a1 ", ��¼������"$a2 ", ��Ծ�û�����"$b", �ֶ�ע���û���:"$c", �Զ�ע���û���"$d", �ۼ��ֶ�ע���û�����"$e", �ۼ��Զ�ע���û�����"$f

 
a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'DIALOG_MEM' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'DIALOG_NUM' and DIME = 'ALL'");
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

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'CREATESUBJECT_MEM' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'CREATESUBJECT_NUM' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

if [ -z "$d" -o $d = 0 ]
then
	f=0

else
	((f=$e/$d))
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'CREATEWISH_MEM' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'CREATEWISH_NUM' and DIME = 'ALL'");
if [ -z "$h" ];
then
	h=0
fi

if [ -z "$g" -o $g = 0 ]
then
	i=0

else
	((i=$h/$g))
fi

j=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'CREATEDONGTAI_MEM' and DIME = 'ALL'");
if [ -z "$j" ];
then
	j=0
fi

k=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'CREATEDONGTAI_NUM' and DIME = 'ALL'");
if [ -z "$k" ];
then
	k=0
fi

if [ -z "$j" -o $j = 0 ]
then
	l=0

else
	((l=$k/$j))
fi
m=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'HEARTDONGTAI_MEM' and DIME = 'ALL'");
if [ -z "$m" ];
then
	m=0
fi

n=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'HEARTDONGTAI_NUM' and DIME = 'ALL'");
if [ -z "$n" ];
then
	n=0
fi

if [ -z "$m" -o $m = 0 ]
then
	o=0

else
	((o=$n/$m))
fi

p=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'COMMENTDONGTAI_MEM' and DIME = 'ALL'");
if [ -z "$p" ];
then
	p=0
fi

p1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$MyselectTime' and TYPES = 'ANONYMOUS_MEM' and DIME = 'ALL'");
if [ -z "$p1" ];
then
	p1=0
fi

p2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$MyselectTime' and TYPES = 'ANONYMOUS_NUM' and DIME = 'ALL'");
if [ -z "$p2" ];
then
	p2=0
fi

if [ -z "$p1" -o $p1 = 0 ]
then
	p3=0

else
	((p3=$p2/$p1))
fi

q1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$MyselectTime' and TYPES = 'WISH_PUBLIC_MEM' and DIME = 'ALL'");
if [ -z "$q1" ];
then
	q1=0
fi

q2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$MyselectTime' and TYPES = 'WISH_PUBLIC_NUM' and DIME = 'ALL'");
if [ -z "$q2" ];
then
	q2=0
fi

if [ -z "$q1" -o $q1 = 0 ]
then
	q3=0

else
	((q3=$q2/$q1))
fi

r1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$MyselectTime' and TYPES = 'WISH_UNMATCH_MEM' and DIME = 'ALL'");
if [ -z "$r1" ];
then
	r1=0
fi

r2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$MyselectTime' and TYPES = 'WISH_UNMATCH_NUM' and DIME = 'ALL'");
if [ -z "$r2" ];
then
	r2=0
fi

if [ -z "$r1" -o $r1 = 0 ]
then
	r3=0

else
	((r3=$r2/$r1))
fi

s1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$MyselectTime' and TYPES = 'DYNAMIC_MEM' and DIME = 'ALL'");
if [ -z "$s1" ];
then
	s1=0
fi

s2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$MyselectTime' and TYPES = 'DYNAMIC_NUM' and DIME = 'ALL'");
if [ -z "$s2" ];
then
	s2=0
fi

if [ -z "$s1" -o $s1 = 0 ]
then
	s3=0

else
	((s3=$s2/$s1))
fi


q=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'COMMENTDONGTAI_NUM' and DIME = 'ALL'");
if [ -z "$q" ];
then
	q=0
fi

if [ -z "$p" -o $p = 0 ]
then
	r=0

else
	((r=$q/$p))
fi
s=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'SHARE' and DIME = 'ALL'");
if [ -z "$s" ];
then
	s=0
fi
x=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'VIEW' and DIME = 'ALL'");
if [ -z "$x" ];
then
	x=0
fi

if [ -z "$s" -o $s = 0 ]
then
        y=0

else
	y=`echo "scale = 2; $x/$s*100" | bc` 
fi

z1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'MSKREPLY' and DIME = 'MSKREPLY_MEMBER'");
if [ -z "$z1" ];
then
	z1=0
fi

z2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'MSKREPLY' and DIME = 'MSKREPLY_NUMBER'");
if [ -z "$z2" ];
then
	z2=0
fi

if [ -z "$x" ];
then
	z3=0
else
	z3=`echo "scale = 2; $z2/$x*100" | bc`
fi

if [ -z "$s" ];
then
	z4=0
else
	z4=`echo "scale = 2; $z2/$s*100" | bc`
fi
echo
echo "2. �û���Ϊ����ͳ��"
echo
echo "�����������Ự�û�����"$a ", �����������Ự������"$b", ƽ�������������Ự������"$c
echo "�������������û�����"$d ", ������������������"$e", ƽ��������������������"$f
echo "��������wish�û�����"$g ", ��������wish������"$h", ƽ����������wish������"$i
echo "����̬���û�����"$j ", ����̬��������"$k", ƽ������̬��������"$l
echo "�Զ�̬���޵��û�����"$m ", �Զ�̬���޵�������"$n", ƽ���Զ�̬���޵�������"$o
echo "�Զ�̬�ظ����û�����"$p ", �Զ�̬�ظ���������"$q", ƽ���Զ�̬�ظ���������"$r
echo "����˽�ŵ��û�����"$p1 ", ����˽�ŵ�������"$p2", ƽ������˽�ŵ�������"$p3
echo "wishƥ��˽�ŵ��û�����"$q1 ",wishƥ��˽�ŵ�������"$q2", wishƥ��ƽ��˽�ŵ�������"$q3
echo "wishδƥ��˽�ŵ��û�����"$r1 ",wishδƥ��˽�ŵ�������"$r2", wishδƥ��ƽ��˽�ŵ�������"$r3
echo "��̬˽�ŵ��û�����"$s1 ", ��̬˽�ŵ�������"$s2", ƽ����̬˽�ŵ�������"$s3
echo "���ͷ�����ŵ�������"$s ", �򿪷���������ӵ�������"$x", ����ʣ�"$y"%"
echo "����ظ�������"$z1 ", �ظ�������"$z2", �򿪷���������ӻظ��ʣ�"$z3"%"", �յ�������Żظ��ʣ�"$z4"%"


a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'TEXT_MEM' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'TEXT_NUM' and DIME = 'ALL'");
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

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'VOICE_MEM' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'VOICE_NUM' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

if [ -z "$d" -o $d = 0 ]
then
	f=0

else
	((f=$e/$d))
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'IMAGE_MEM' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'IMAGE_NUM' and DIME = 'ALL'");
if [ -z "$h" ];
then
	h=0
fi

if [ -z "$g" -o $g = 0 ]
then
	i=0

else
	((i=$h/$g))
fi

j=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'ASSISTANT_MEM' and DIME = 'ALL'");
if [ -z "$j" ];
then
	j=0
fi

k=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2014 where DATES = '$MyselectTime' and TYPES = 'ASSISTANT_NUM' and DIME = 'ALL'");
if [ -z "$k" ];
then
	k=0
fi

if [ -z "$j" -o $j = 0 ]
then
	l=0

else
	((l=$k/$j))
fi

echo
echo "3. �����Ự����ͳ��"
echo
echo "�����Ự�����û�����"$a ", �����Ự����������"$b", ƽ�������Ự����������"$c
echo "�����Ự�����û�����"$d ", �����Ự����������"$e", ƽ�������Ự����������"$f
echo "�����ỰͼƬ�û�����"$g ", �����ỰͼƬ������"$h", ƽ�������ỰͼƬ������"$i
echo "��С���ַ���Ϣ�û�����"$j ", ��С���ַ���Ϣ������"$k", ƽ����С���ַ���Ϣ������"$l

echo
echo "--- ��������ʱ�䣺"`date`" ---"
echo
