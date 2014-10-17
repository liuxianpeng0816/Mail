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
echo "������ͳ�Ƽ�----�ձ�  $day2"
echo "========================================================="

a1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'LOGIN_MEM' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

a2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'LOGIN_NUM' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ACTIVE' and DIME = 'USER'");
if [ -z "$b" ];
then
	b=0
fi

c=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'MSKDOWNLOAD_ALL' and DIME = 'ALL'");
if [ -z "$c" ];
then
	c=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'MANREG' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'INVITEREG' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'MSKDOWNLOAD_TOTAL ' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'MANREG_TOTAL' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'INVITEREG_TOTAL' and DIME = 'ALL'");
if [ -z "$h" ];
then
	h=0
fi

i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'REPLYREGISTER' and DIME = 'ALL'");
if [ -z "$i" ];
then
	i=0
fi

j1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'HD_XY_DOWNLOAD' and DIME = 'ALL'");
if [ -z "$j1" ];
then
	j1=0
fi

j2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'HD_ZQ_DOWNLOAD' and DIME = 'ALL'");
if [ -z "$j2" ];
then
	j2=0
fi

j3=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'HD_SY_DOWNLOAD' and DIME = 'ALL'");
if [ -z "$j3" ];
then
	j3=0
fi

k1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'XY_FIRSTOTAL' and DIME = 'TOTAL'");
if [ -z "$k1" ];
then
	k1=0
fi

k2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ZQ_FIRSTOTAL' and DIME = 'TOTAL'");
if [ -z "$k2" ];
then
	k2=0
fi

k3=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SY_FIRSTOTAL' and DIME = 'TOTAL'");
if [ -z "$k3" ];
then
	k3=0
fi

l1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'XY_SECONDTOTAL' and DIME = 'TOTAL'");
if [ -z "$l1" ];
then
	l1=0
fi

l2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ZQ_SECONDTOTAL' and DIME = 'TOTAL'");
if [ -z "$l2" ];
then
	l2=0
fi

m1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'XY_THIRDTOTAL' and DIME = 'TOTAL'");
if [ -z "$m1" ];
then
	m1=0
fi

m2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ZQ_THIRDTOTAL' and DIME = 'TOTAL'");
if [ -z "$m2" ];
then
	m2=0
fi

n1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'XY_FIRSTAPP' and DIME = 'APP'");
if [ -z "$n1" ];
then
	n1=0
fi

n2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ZQ_FIRSTAPP' and DIME = 'APP'");
if [ -z "$n2" ];
then
	n2=0
fi

n3=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SY_FIRSTAPP' and DIME = 'APP'");
if [ -z "$n3" ];
then
	n3=0
fi

o1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'XY_SECONDAPP' and DIME = 'APP'");
if [ -z "$o1" ];
then
	o1=0
fi

o2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ZQ_SECONDAPP' and DIME = 'APP'");
if [ -z "$o2" ];
then
	o2=0
fi

p1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'XY_THIRDAPP' and DIME = 'APP'");
if [ -z "$p1" ];
then
	p1=0
fi

p2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ZQ_THIRDAPP' and DIME = 'APP'");
if [ -z "$p2" ];
then
	p2=0
fi

echo
echo "1. �û���ͳ��"
echo
#echo " ��¼˽���û�����"$a ", ���û�����"$b", ��Ծ�û�����"$c", �ۼ��ֶ�ע���û�����"$d", �ۼ��Զ�ע���û�����"$e
echo  "��¼�û�����"$a1 ", ��¼������"$a2" , ��Ծ�û�����"$b", �������ش�����"$c", �ֶ�ע���û�����"$d", �Զ�ע���û�����"$e", wapҳ�����ظ����ע��������"$i", �����ۼ����ش�����"$f", �ۼ��ֶ�ע���û�����"$g", �ۼ��Զ�ע���û�����"$h
echo  ""
echo  "1) ��׻:"
echo  ""
echo  "��׻ҳ����������"$j1
echo  "ҳ��1���ܴ�����"$k1", ҳ��2���ܴ�����"$l1", ҳ��3���ܴ�����"$m1
echo  "��app��ҳ��1�򿪴�����"$n1",��app��ҳ��2�򿪴�����"$o1", ��app��ҳ��3�򿪴�����"$p1
echo  ""
echo  "2) ����:"
echo  ""
echo  "����ҳ����������"$j2
echo  "ҳ��1���ܴ�����"$k2", ҳ��2���ܴ�����"$l2", ҳ��3���ܴ�����"$m2
echo  "��app��ҳ��1�򿪴�����"$n2",��app��ҳ��2�򿪴�����"$o2", ��app��ҳ��3�򿪴�����"$p2
echo  ""
echo  "3) ʮһ�:"
echo  ""
echo  "ʮһ�ҳ����������"$j3
echo  "��Ϸҳ����ܴ�����"$k3
echo  "��app����Ϸҳ�������"$n3

echo
echo "2. 1) �û���¼�汾����ͳ��"
echo "    ����       �汾��	    �ֶ�ֵ    ��¼����" 
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select * from MSK_ACTIVE_2013 where DATES = '$day2' and DIME = 'CLIENT_VERSION'"
echo  ""
echo "   2) �û���¼�汾����ͳ��"
echo "    ����       �汾��	    �ֶ�ֵ    ��¼����" 
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select * from MSK_ACTIVE_2013 where DATES = '$day2' and DIME = 'VERSION_MEMBER'"

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'DIALOG_MEM' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'DIALOG_NUM' and DIME = 'ALL'");
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

t=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'DIALOG_TOTAL' and DIME = 'ALL'");
if [ -z "$t" ];
then
	t=0
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'CREATESUBJECT_MEM' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'CREATESUBJECT_NUM' and DIME = 'ALL'");
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

u=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'CREATESUBJECT_TOTAL' and DIME = 'ALL'");
if [ -z "$u" ];
then
	u=0
fi
g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'CREATEWISH_MEM' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'CREATEWISH_NUM' and DIME = 'ALL'");
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

v=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'CREATEWISH_TOTAL' and DIME = 'ALL'");
if [ -z "$v" ];
then
	v=0
fi
j=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'CREATEDONGTAI_MEM' and DIME = 'ALL'");
if [ -z "$j" ];
then
	j=0
fi

k=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'CREATEDONGTAI_NUM' and DIME = 'ALL'");
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

w=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'CREATEDONGTAI_TOTAL' and DIME = 'ALL'");
if [ -z "$w" ];
then
	w=0
fi

m=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'HEARTDONGTAI_MEM' and DIME = 'ALL'");
if [ -z "$m" ];
then
	m=0
fi

n=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'HEARTDONGTAI_NUM' and DIME = 'ALL'");
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

p=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'COMMENTDONGTAI_MEM' and DIME = 'ALL'");
if [ -z "$p" ];
then
	p=0
fi

p1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ANONYMOUS_MEM' and DIME = 'ALL'");
if [ -z "$p1" ];
then
	p1=0
fi

p2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ANONYMOUS_NUM' and DIME = 'ALL'");
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

q1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'WISH_PUBLIC_MEM' and DIME = 'ALL'");
if [ -z "$q1" ];
then
	q1=0
fi

q2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'WISH_PUBLIC_NUM' and DIME = 'ALL'");
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

r1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'WISH_UNMATCH_MEM' and DIME = 'ALL'");
if [ -z "$r1" ];
then
	r1=0
fi

r2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'WISH_UNMATCH_NUM' and DIME = 'ALL'");
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

s1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'DYNAMIC_MEM' and DIME = 'ALL'");
if [ -z "$s1" ];
then
	s1=0
fi

s2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'DYNAMIC_NUM' and DIME = 'ALL'");
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

q=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'COMMENTDONGTAI_NUM' and DIME = 'ALL'");
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
s=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SHARE' and DIME = 'ALL'");
if [ -z "$s" ];
then
	s=0
fi
x=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'VIEW' and DIME = 'ALL'");
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

z1=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'MSKREPLY' and DIME = 'MSKREPLY_MEMBER'");
if [ -z "$z1" ];
then
	z1=0
fi

z2=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'MSKREPLY' and DIME = 'MSKREPLY_NUMBER'");
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
echo "3. �û���Ϊ����ͳ��"
echo
echo "�����������Ự�û�����"$a ", �����������Ự������"$b", ƽ�������������Ự������"$c", �ۼ������Ự������"$t
echo "�������������û�����"$d ", ������������������"$e", ƽ��������������������"$f", �ۼ���������������"$u
echo "��������wish�û�����"$g ", ��������wish������"$h", ƽ����������wish������"$i", �ۼ�����wish������"$v
echo "����̬���û�����"$j ", ����̬��������"$k", ƽ������̬��������"$l", �ۼƷ���̬������"$w
echo "�Զ�̬���޵��û�����"$m ", �Զ�̬���޵�������"$n", ƽ���Զ�̬���޵�������"$o
echo "�Զ�̬�ظ����û�����"$p ", �Զ�̬�ظ���������"$q", ƽ���Զ�̬�ظ���������"$r
echo "����˽�ŵ��û�����"$p1 ", ����˽�ŵ�������"$p2", ƽ������˽�ŵ�������"$p3
echo "wishƥ��˽�ŵ��û�����"$q1 ",wishƥ��˽�ŵ�������"$q2", wishƥ��ƽ��˽�ŵ�������"$q3
echo "wishδƥ��˽�ŵ��û�����"$r1 ",wishδƥ��˽�ŵ�������"$r2", wishδƥ��ƽ��˽�ŵ�������"$r3
echo "��̬˽�ŵ��û�����"$s1 ", ��̬˽�ŵ�������"$s2", ƽ����̬˽�ŵ�������"$s3
echo "����������ŵ�������"$s ", ������������ӵ�������"$x", ����ʣ�"$y"%"
echo "����ظ�������"$z1 ", �ظ�������"$z2", ������������ӻظ��ʣ�"$z3"%"", �յ�������Żظ��ʣ�"$z4"%"


a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'TEXT_MEM' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'TEXT_NUM' and DIME = 'ALL'");
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

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'TEXT_TOTAL' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'VOICE_MEM' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'VOICE_NUM' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi

if [ -z "$e" -o $e = 0 ]
then
	g=0

else
	((g=$f/$e))
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'VOICE_TOTAL' and DIME = 'ALL'");
if [ -z "$h" ];
then
	h=0
fi

i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'IMAGE_MEM' and DIME = 'ALL'");
if [ -z "$i" ];
then
	i=0
fi

j=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'IMAGE_NUM' and DIME = 'ALL'");
if [ -z "$j" ];
then
	j=0
fi

if [ -z "$i" -o $i = 0 ]
then
	k=0

else
	((k=$j/$i))
fi

l=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'IMAGE_TOTAL' and DIME = 'ALL'");
if [ -z "$l" ];
then
	l=0
fi

m=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ASSISTANT_MEM' and DIME = 'ALL'");
if [ -z "$m" ];
then
	m=0
fi

n=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ASSISTANT_NUM' and DIME = 'ALL'");
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

p=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'ASSISTANT_TOTAL' and DIME = 'ALL'");
if [ -z "$p" ];
then
	p=0
fi
echo
echo "4. �����Ự����ͳ��"
echo
echo "�����Ự�����û�����"$a ", �����Ự����������"$b", ƽ�������Ự����������"$c", �ۼ������Ự����������"$d
echo "�����Ự�����û�����"$e ", �����Ự����������"$f", ƽ�������Ự����������"$g", �ۼ������Ự����������"$h
echo "�����ỰͼƬ�û�����"$i ", �����ỰͼƬ������"$j", ƽ�������ỰͼƬ������"$k", �ۼ������ỰͼƬ������"$l
echo "��С���ַ���Ϣ�û�����"$m ", ��С���ַ���Ϣ������"$n", ƽ����С���ַ���Ϣ������"$o", �ۼƸ�С���ַ���Ϣ������"$p

a=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'PHONE_COUNT' and DIME = 'ALL'");
if [ -z "$a" ];
then
	a=0
fi

b=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'REG_COUNT' and DIME = 'ALL'");
if [ -z "$b" ];
then
	b=0
fi

if [ -z "$a" -o $a = 0 ]
then
	c=0

else
	c=`echo "scale = 2; $b/$a" | bc` 
fi

d=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'REG_ZERO' and DIME = 'ALL'");
if [ -z "$d" ];
then
	d=0
fi

e=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'REG_THREE' and DIME = 'ALL'");
if [ -z "$e" ];
then
	e=0
fi

f=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SUBSCRIBE_ZERO' and DIME = 'ALL'");
if [ -z "$f" ];
then
	f=0
fi

g=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SUBSCRIBE_COUNT' and DIME = 'ALL'");
if [ -z "$g" ];
then
	g=0
fi

h=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'AVE_SUBSCRIBE' and DIME = 'ALL'");
if [ -z "$h" ];
then
	h=0
fi

i=$(mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select VAL from MSK_ACTIVE_2013 where DATES = '$day2' and TYPES = 'SUBSCRIBE_MEMBER' and DIME = 'ALL'");
if [ -z "$i" ];
then
	i=0
fi

echo
echo "5. �������û�������ͳ��"
echo
echo "�ϴ�ͨѶ¼���û�����"$a ", ע�����������"$b", ƽ��ע���������"$c
echo "ע�������������0���û�������"$d ", ע�������������3���û�������"$e
echo "����ע��������0���û�������"$f ", ��������ע��������"$g", ��������ע��ƽ������"$h", ӵ�ж�������ע�ߵ��û�����"$i

echo
echo "--- ��������ʱ�䣺"`date`" ---"
echo
