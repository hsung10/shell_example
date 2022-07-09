#!/bin/sh

sampledir="/tmp/sample"
ami=$(whoami)

if [ $ami != root ]; then
    echo " 본 프로그램은 체계 관리자(ROOT)외 사용자는 실행이 제한됩니다."
    exit
fi

# /etc/passwd 에서 user로 시작하는 계정을 추출한다.
for name in $(cat /etc/passwd | awk -F: '/^user/{print $1}')
do 
cd /home/$name
rm -f *
cp -rp $sampledir /home/$name

echo " 사용자 $name 의 홈디렉토리 초기화 완료"
echo ""

done
exit

