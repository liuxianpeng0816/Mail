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
echo "马赛克统计简报----日报  $day2"
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
echo "1. 用户量统计"
echo
#echo " 登录私聊用户数："$a ", 新用户数："$b", 活跃用户数："$c", 累计手动注册用户数："$d", 累计自动注册用户数："$e
echo  "登录用户数："$a1 ", 登录次数："$a2" , 活跃用户数："$b", 官网下载次数："$c", 手动注册用户数："$d", 自动注册用户数："$e", wap页面点击回复后的注册人数："$i", 官网累计下载次数："$f", 累计手动注册用户数："$g", 累计自动注册用户数："$h
echo  ""
echo  "1) 表白活动:"
echo  ""
echo  "表白活动页面下载数："$j1
echo  "页面1打开总次数："$k1", 页面2打开总次数："$l1", 页面3打开总次数："$m1
echo  "从app打开页面1打开次数："$n1",从app打开页面2打开次数："$o1", 从app打开页面3打开次数："$p1
echo  ""
echo  "2) 中秋活动:"
echo  ""
echo  "中秋活动页面下载数："$j2
echo  "页面1打开总次数："$k2", 页面2打开总次数："$l2", 页面3打开总次数："$m2
echo  "从app打开页面1打开次数："$n2",从app打开页面2打开次数："$o2", 从app打开页面3打开次数："$p2
echo  ""
echo  "3) 十一活动:"
echo  ""
echo  "十一活动页面下载数："$j3
echo  "游戏页面打开总次数："$k3
echo  "从app打开游戏页面次数："$n3

echo
echo "2. 1) 用户登录版本次数统计"
echo "    日期       版本号	    字段值    登录次数" 
mysql -h 127.0.0.1 -uroot 360_ContactVoice_Stat -N -q -s -w -e "select * from MSK_ACTIVE_2013 where DATES = '$day2' and DIME = 'CLIENT_VERSION'"
echo  ""
echo "   2) 用户登录版本人数统计"
echo "    日期       版本号	    字段值    登录人数" 
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
echo "3. 用户行为人数统计"
echo
echo "发起新匿名会话用户数："$a ", 发起新匿名会话条数："$b", 平均发起新匿名会话条数："$c", 累计匿名会话条数："$t
echo "发表匿名心情用户数："$d ", 发表匿名心情条数："$e", 平均发表匿名心情条数："$f", 累计匿名心情条数："$u
echo "发表匿名wish用户数："$g ", 发表匿名wish条数："$h", 平均发表匿名wish条数："$i", 累计匿名wish条数："$v
echo "发表动态的用户数："$j ", 发表动态的条数："$k", 平均发表动态的条数："$l", 累计发动态条数："$w
echo "对动态点赞的用户数："$m ", 对动态点赞的条数："$n", 平均对动态点赞的条数："$o
echo "对动态回复的用户数："$p ", 对动态回复的条数："$q", 平均对动态回复的条数："$r
echo "匿名私信的用户数："$p1 ", 匿名私信的条数："$p2", 平均匿名私信的条数："$p3
echo "wish匹配私信的用户数："$q1 ",wish匹配私信的条数："$q2", wish匹配平均私信的条数："$q3
echo "wish未匹配私信的用户数："$r1 ",wish未匹配私信的条数："$r2", wish未匹配平均私信的条数："$r3
echo "动态私信的用户数："$s1 ", 动态私信的条数："$s2", 平均动态私信的条数："$s3
echo "发送邀请短信的条数："$s ", 打开邀请短信链接的条数："$x", 点击率："$y"%"
echo "点击回复人数："$z1 ", 回复次数："$z2", 打开邀请短信链接回复率："$z3"%"", 收到邀请短信回复率："$z4"%"


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
echo "4. 匿名会话内容统计"
echo
echo "匿名会话文字用户数："$a ", 匿名会话文字条数："$b", 平均匿名会话文字条数："$c", 累计匿名会话文字条数："$d
echo "匿名会话语音用户数："$e ", 匿名会话语音条数："$f", 平均匿名会话语音条数："$g", 累计匿名会话语音条数："$h
echo "匿名会话图片用户数："$i ", 匿名会话图片条数："$j", 平均匿名会话图片条数："$k", 累计匿名会话图片条数："$l
echo "给小助手发消息用户数："$m ", 给小助手发消息条数："$n", 平均给小助手发消息条数："$o", 累计给小助手发消息条数："$p

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
echo "5. 马赛克用户好友数统计"
echo
echo "上传通讯录总用户数："$a ", 注册好友总数："$b", 平均注册好友数："$c
echo "注册好友人数大于0的用户总数："$d ", 注册好友人数大于3的用户总数："$e
echo "被关注人数大于0的用户总数："$f ", 二级被关注者总数："$g", 二级被关注者平均数："$h", 拥有二级被关注者的用户数："$i

echo
echo "--- 报告生成时间："`date`" ---"
echo
