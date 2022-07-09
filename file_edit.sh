#!/bin/sh

dir="/root/script_exem/sub_test"
pattold="sbin\/nologin"
pattnew="bin\/false"

mkdir /root/script_exem/sub_test_`date +%C%y%m%d`

for file in `ls -l $dir | grep -v '^d' | awk '{print $9}'` # $dir에서 내용을 변경할 파일명을 추출한다.

do
    echo ""
    echo " $file 을 변경합니다."
    cd $dir

    cp -rf $file /root/script_exem/sub_test_`date +%C%y%m%d`
    cat $file | sed -e "s/$pattold/$pattnew/" > /tmp/imsi.tmp # 패턴을 변경하여 임시파일에 저장한다.

    sleep 2
    cp -rf /tmp/imsi.tmp ./$file
    rm -f  /tmp/imsi.tmp
    echo " $file 변경 완료"
done
exit