#!/bin/sh 

stime=10
ami=`whoami`

if [ $ami != root ]; then
    echo " 본 프로그램은 체계관리자(ROOT)외 사용자는 실행이 제한됩니다."
    exit
fi

echo " $1의 사용자 계정을 일시 정지합니다. a~d 단계로 진행합니다."
echo ""
echo " a $1 계정의 패스워드를 변경해 주세요"
echo ""
passwd $1

tty=$(who | grep $1 | tail -1 | awk '{print $2}')
cat << EOF > /dev/$tty

**********************************************************
★ 경 고 ★
지금 사용하고 있는 계정은 시스템 관리자에게 의해 일시 정지되니 
90초 이후에는 강제 Log Out 됩니다.

지금하는 작업을 마무리하시고 Log Out 바랍니다. 
계정 사용 연장 및 기타 문의 사항은 시스템관리부서에 문의 하세요
**********************************************************

EOF
    sleep $stime
    killall -s HUP -u $1
    sleep 1
    killall -s KILL -u $1
echo " b $1의 사용중인 모든 프로세스는 종료 되었습니다."
echo " c 현 시각부로 계정 $1 은 Log Out 되었습니다."
echo "      - $(date) -     "

chmod 000 /home/$1
echo " d $1 계정은 일시 정지 처리되었습니다."
exit