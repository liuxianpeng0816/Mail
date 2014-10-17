#! /bin/sh

day=`date -d "1 days ago" +"%Y%m%d"`

if [ $1 ]
then
	day=$1
fi

month=${day:0:6}
rday=`date -d "1 days ago $day" +"%Y%m%d"`

usr=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from USER_STAT_$month where DATES = '$day' and DIME ='TOTAL' and KEYWORD = 'ALL'");
if [ -z "$usr" ]; then
usr=0
fi
new=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from USER_STAT_$month where DATES = '$day' and DIME ='NEW' and KEYWORD = 'ALL'");
if [ -z "$new" ]; then
new=0
fi
tusr=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select TOTAL_USR from 360_VOICE_BRIEF where STAT_DATE = '$rday'");
if [ -z "$tusr" ]; then
tusr=0
fi
((tusr+=new))
timg=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select TOTAL_IMG from 360_VOICE_BRIEF where STAT_DATE = '$rday'");
if [ -z "$timg" ]; then
timg=0
fi
tvoc=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select TOTAL_VOC from 360_VOICE_BRIEF where STAT_DATE = '$rday'");
if [ -z "$tvoc" ]; then
tvoc=0
fi
#exit
used_usr=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='USED_USE' and DIME = 'ALL'");
if [ -z "$used_usr" ]; then
used_usr=0
fi
pop_usr=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='POP_USER' and DIME = 'ALL'");
if [ -z "$pop_usr" ]; then
pop_usr=0
fi
msg_usr=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='MSG_USER' and DIME = 'ALL'");
if [ -z "$msg_usr" ]; then
msg_usr=0
fi
used=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='USED' and DIME = 'ALL'");
if [ -z "$used" ]; then
used=0
fi
pop=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='POP' and DIME = 'ALL'");
if [ -z "$pop" ]; then
pop=0
fi
service=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='SERVICE' and DIME = 'ALL'");
if [ -z "$service" ]; then
service=0
fi
stayed=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='STAYED' and DIME = 'ALL'");
if [ -z "$stayed" ]; then
stayed=0
fi
msg=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='MSG' and DIME = 'ALL'");
if [ -z "$msg" ]; then
msg=0
fi
fee=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='FEE' and DIME = 'ALL'");
if [ -z "$fee" ]; then
fee=0
fi
free=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='FREE' and DIME = 'ALL'");
if [ -z "$free" ]; then
free=0
fi
dispos=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='DISPOS' and DIME = 'ALL'");
if [ -z "$dispos" ]; then
dispos=0
fi
img=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='IMG' and DIME = 'ALL'");
if [ -z "$img" ]; then
img=0
fi
((timg+=img))
voc=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='VOC' and DIME = 'ALL'");
if [ -z "$voc" ]; then
voc=0
fi
((tvoc+=voc))
vlength=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='VLENGTH' and DIME = 'ALL'");
if [ -z "$vlength" ]; then
vlength=0
fi
#exit
sed1=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='SED' and DIME = '1'");
if [ -z "$sed1" ]; then
sed1=0
fi
sed2=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='SED' and DIME = '2'");
if [ -z "$sed2" ]; then
sed2=0
fi
sed3=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='SED' and DIME = '3'");
if [ -z "$sed3" ]; then
sed3=0
fi
sed4=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='SED' and DIME = '4'");
if [ -z "$sed4" ]; then
sed4=0
fi
sed5=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='SED' and DIME = '5'");
if [ -z "$sed5" ]; then
sed5=0
fi
sed6=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='SED' and DIME = '6'");
if [ -z "$sed6" ]; then
sed6=0
fi
sed7=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='SED' and DIME = '7'");
if [ -z "$sed7" ]; then
sed7=0
fi
gtimg=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select GROUP_TOTAL_IMG from 360_VOICE_BRIEF where STAT_DATE = '$rday'");
if [ -z "$gtimg" ]; then
gtimg=0
fi
gtvoc=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select GROUP_TOTAL_VOC from 360_VOICE_BRIEF where STAT_DATE = '$rday'");
if [ -z "$gtvoc" ]; then
gtvoc=0
fi
tgsms=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select TOTAL_GSMS from 360_VOICE_BRIEF where STAT_DATE = '$rday'");
if [ -z "$tgsms" ]; then
tgsms=0
fi
tgvlen=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select GROUP_TOTAL_GVLEN from 360_VOICE_BRIEF where STAT_DATE = '$rday'");
if [ -z "$tgvlen" ]; then
tgvlen=0
fi
gimg=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from MSG_STAT_$month where DATES = '$day' and TYPES ='PV' and DIME = 'GROUP_MEDIA_TYPE' and KEYWORD=302");
if [ -z "$gimg" ]; then
gimg=0
fi
((gtimg+=gimg))
gvoc=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from MSG_STAT_$month where DATES = '$day' and TYPES ='PV' and DIME = 'GROUP_MEDIA_TYPE' and KEYWORD=301");
if [ -z "$gvoc" ]; then
gvoc=0
fi
((gtvoc+=gvoc))
gsms=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='GSMS' and DIME = 'ALL'");
if [ -z "$gsms" ]; then
gsms=0
fi
((tgsms+=gsms))
gvlen=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='GVLEN' and DIME = 'ALL'");
if [ -z "$gvlen" ]; then
gvlen=0
fi

snd_user=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='SND_USER' and DIME = 'ALL'");
if [ -z "$snd_user" ]; then
snd_user=0
fi

voc_user=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES ='VOC_USER' and DIME = 'ALL'");
if [ -z "$voc_user" ]; then
voc_user=0
fi


((tgvlen+=gvlen))
#exit
echo "CREATE TABLE IF NOT EXISTS 360_VOICE_BRIEF (STAT_DATE date, USR int, NEW_USR int, TOTAL_USR int, USED_USER int, POP_USER int, MSG_USER int, USED bigint, POP bigint, SERVICE bigint, STAYED bigint, MSG bigint, FEE bigint, FREE bigint, DISPOS bigint, IMG bigint, TOTAL_IMG bigint, VOC bigint, TOTAL_VOC bigint, VLENGTH bigint, SED1 int, SED2 int, SED3 int, SED4 int, SED5 int, SED6 int, SED7 int,GROUP_IMG bigint,GROUP_TOTAL_IMG bigint,GROUP_VOC bigint,GROUP_TOTAL_VOC bigint,GSMS int,TOTAL_GSMS int,GROUP_GVLEN bigint,GROUP_TOTAL_GVLEN bigint,SND_USER bigint,VOC_USER bigint)" | mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -A -f
echo "DELETE FROM 360_VOICE_BRIEF WHERE STAT_DATE = '$day'" | mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -A -f
echo "INSERT INTO 360_VOICE_BRIEF (STAT_DATE, USR, NEW_USR, TOTAL_USR, USED_USER, POP_USER, MSG_USER, USED, POP, SERVICE, STAYED, MSG, FEE, FREE, DISPOS, IMG, TOTAL_IMG, VOC, TOTAL_VOC, VLENGTH,SED1, SED2, SED3, SED4, SED5, SED6, SED7,GROUP_IMG,GROUP_TOTAL_IMG,GROUP_VOC,GROUP_TOTAL_VOC,GSMS,TOTAL_GSMS,GROUP_GVLEN,GROUP_TOTAL_GVLEN,SND_USER,VOC_USER) VALUES ('$day', $usr, $new, $tusr, $used_usr, $pop_usr, $msg_usr, $used, $pop, $service, $stayed, $msg, $fee, $free, $dispos, $img, $timg, $voc, $tvoc, $vlength, $sed1, $sed2, $sed3, $sed4, $sed5, $sed6, $sed7 , $gimg, $gtimg, $gvoc, $gtvoc,$gsms,$tgsms,$gvlen,$tgvlen,$snd_user,$voc_user)" | mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -A -f

p1=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '1'");
if [ -z "$p1" ]; then
p1=0
fi
p2=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '2'");
if [ -z "$p2" ]; then
p2=0
fi
p3=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '3'");
if [ -z "$p3" ]; then
p3=0
fi
p4=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '4'");
if [ -z "$p4" ]; then
p4=0
fi
p5=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '5'");
if [ -z "$p5" ]; then
p5=0
fi
p6=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '6'");
if [ -z "$p6" ]; then
p6=0
fi
p7=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '7'");
if [ -z "$p7" ]; then
p7=0
fi
p8=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '8'");
if [ -z "$p8" ]; then
p8=0
fi
p9=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '9'");
if [ -z "$p9" ]; then
p9=0
fi
p10=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '10'");
if [ -z "$p10" ]; then
p10=0
fi
p11=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '11'");
if [ -z "$p11" ]; then
p11=0
fi
p12=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '12'");
if [ -z "$p12" ]; then
p12=0
fi
p13=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '13'");
if [ -z "$p13" ]; then
p13=0
fi
p14=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '14'");
if [ -z "$p14" ]; then
p14=0
fi
p15=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '15'");
if [ -z "$p15" ]; then
p15=0
fi
p16=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '16'");
if [ -z "$p16" ]; then
p16=0
fi
p17=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '17'");
if [ -z "$p17" ]; then
p17=0
fi
p18=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '18'");
if [ -z "$p18" ]; then
p18=0
fi
p19=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '19'");
if [ -z "$p19" ]; then
p19=0
fi
p20=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '20'");
if [ -z "$p20" ]; then
p20=0
fi
p21=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '21'");
if [ -z "$p21" ]; then
p21=0
fi
p22=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '22'");
if [ -z "$p22" ]; then
p22=0
fi
p23=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '23'");
if [ -z "$p23" ]; then
p23=0
fi
p24=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '24'");
if [ -z "$p24" ]; then
p24=0
fi
p25=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '25'");
if [ -z "$p25" ]; then
p25=0
fi
p26=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '26'");
if [ -z "$p26" ]; then
p26=0
fi
p27=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '27'");
if [ -z "$p27" ]; then
p27=0
fi
p28=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '28'");
if [ -z "$p28" ]; then
p28=0
fi
p29=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '29'");
if [ -z "$p29" ]; then
p29=0
fi
p30=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '30'");
if [ -z "$p30" ]; then
p30=0
fi
p3x=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NP-USER' and DIME = '30+'");
if [ -z "$p3x" ]; then
p3x=0
fi
echo "CREATE TABLE IF NOT EXISTS 360_VOICE_NUSR (STAT_DATE date, TYPE char(4), P1 int, P2 int, P3 int, P4 int, P5 int, P6 int, P7 int, P8 int, P9 int, P10 int, P11 int, P12 int, P13 int, P14 int, P15 int, P16 int, P17 int, P18 int, P19 int, P20 int, P21 int, P22 int, P23 int, P24 int, P25 int, P26 int, P27 int, P28 int, P29 int, P30 int, P3X int)" | mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -A -f
echo "DELETE FROM 360_VOICE_NUSR WHERE STAT_DATE = '$day' AND TYPE = 'POP'" | mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -A -f
echo "INSERT INTO 360_VOICE_NUSR (STAT_DATE, TYPE, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P3X) VALUES ('$day', 'POP', $p1, $p2, $p3, $p4, $p5, $p6, $p7, $p8, $p9, $p10, $p11, $p12, $p13, $p14, $p15, $p16, $p17, $p18, $p19, $p20, $p21, $p22, $p23, $p24, $p25, $p26, $p27, $p28, $p29, $p30, $p3x)" | mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -A -f

p1=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '1'");
if [ -z "$p1" ]; then
p1=0
fi
p2=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '2'");
if [ -z "$p2" ]; then
p2=0
fi
p3=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '3'");
if [ -z "$p3" ]; then
p3=0
fi
p4=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '4'");
if [ -z "$p4" ]; then
p4=0
fi
p5=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '5'");
if [ -z "$p5" ]; then
p5=0
fi
p6=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '6'");
if [ -z "$p6" ]; then
p6=0
fi
p7=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '7'");
if [ -z "$p7" ]; then
p7=0
fi
p8=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '8'");
if [ -z "$p8" ]; then
p8=0
fi
p9=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '9'");
if [ -z "$p9" ]; then
p9=0
fi
p10=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '10'");
if [ -z "$p10" ]; then
p10=0
fi
p11=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '11'");
if [ -z "$p11" ]; then
p11=0
fi
p12=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '12'");
if [ -z "$p12" ]; then
p12=0
fi
p13=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '13'");
if [ -z "$p13" ]; then
p13=0
fi
p14=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '14'");
if [ -z "$p14" ]; then
p14=0
fi
p15=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '15'");
if [ -z "$p15" ]; then
p15=0
fi
p16=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '16'");
if [ -z "$p16" ]; then
p16=0
fi
p17=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '17'");
if [ -z "$p17" ]; then
p17=0
fi
p18=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '18'");
if [ -z "$p18" ]; then
p18=0
fi
p19=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '19'");
if [ -z "$p19" ]; then
p19=0
fi
p20=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '20'");
if [ -z "$p20" ]; then
p20=0
fi
p21=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '21'");
if [ -z "$p21" ]; then
p21=0
fi
p22=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '22'");
if [ -z "$p22" ]; then
p22=0
fi
p23=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '23'");
if [ -z "$p23" ]; then
p23=0
fi
p24=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '24'");
if [ -z "$p24" ]; then
p24=0
fi
p25=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '25'");
if [ -z "$p25" ]; then
p25=0
fi
p26=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '26'");
if [ -z "$p26" ]; then
p26=0
fi
p27=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '27'");
if [ -z "$p27" ]; then
p27=0
fi
p28=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '28'");
if [ -z "$p28" ]; then
p28=0
fi
p29=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '29'");
if [ -z "$p29" ]; then
p29=0
fi
p30=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '30'");
if [ -z "$p30" ]; then
p30=0
fi
p3x=$(mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -N -e "select VAL from CLIENT_STAT_$month where DATES = '$day' and TYPES = 'NU-USER' and DIME = '30+'");
if [ -z "$p3x" ]; then
p3x=0
fi
echo "DELETE FROM 360_VOICE_NUSR WHERE STAT_DATE = '$day' AND TYPE = 'USED'" | mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -A -f
echo "INSERT INTO 360_VOICE_NUSR (STAT_DATE, TYPE, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P3X) VALUES ('$day', 'USED', $p1, $p2, $p3, $p4, $p5, $p6, $p7, $p8, $p9, $p10, $p11, $p12, $p13, $p14, $p15, $p16, $p17, $p18, $p19, $p20, $p21, $p22, $p23, $p24, $p25, $p26, $p27, $p28, $p29, $p30, $p3x)" | mysql -uroot -p360-voice-stat 360_ContactVoice_Stat -A -f

# Last Version 2013-8-28 16:15
