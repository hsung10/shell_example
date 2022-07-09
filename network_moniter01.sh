#!/bin/sh 

serIP="/root/script_exem/serverIP.lst" # 서버정보가 기록되어 있는 리스트 작성

for ip in $(cat $serIP | grep -v "^#" | awk -F: '{print $2}') # 서버의 IP정보를 추출 "#" 주석은 제외
do
    sername=$(grep $ip $serIP | awk -F: '{print $1}') # 서버의 name 정보를 추출

    if ! ping -c 2 $ip 
    then

    echo ""
    echo " $sername 서버 또는 네트워크 접속 제한 : 점검요망 "
    grep $sername $serIP >> /root/script_exem/Server_chk_err_`date +%C%y%m%d`.log
    fi

done
exit 
