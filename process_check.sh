#!/bin/sh 

# httpd=`ps -ef | grep httpd | grep -v grep | wc -l`
# tomcat=`ps -ef | grep java | grep tomcat | grep -v grep | wc -l`
# postgres=`ps -ef | grep postgres | grep -v grep | wc -l`

# echo ""
# echo "******************* moffice 관련 프로세스 진단 ************************"
# echo ""
# echo " httpd 현재 프로세스 갯수는 $httpd 입니다."
# echo ""
# echo " tomcat 현재 프로세스 갯수는 $tomcat 입니다."
# echo ""
# echo " postgres 현재 프로세스 갯수는 $postgres 입니다."
# echo ""
# echo "**********************************************************************"
# echo ""
# echo " ■ moffice 프로세스 진단 결과 "
# echo ""

# ## 프로세스 개수 체크 
# if [ $httpd -eq "0" ];then
#     echo "  ▶  httpd 프로세스 진단 결과 : 장애 (점검 필요) "
#     else echo "  ▶  httpd 프로세스 진단 결과 : 정상 "
# fi
# echo ""

# if [ $tomcat -eq "0" ];then
#     echo "  ▶  tomcat 프로세스 진단 결과 : 장애 (점검 필요) "
#     else echo "  ▶  tomcat 프로세스 진단 결과 : 정상 "
# fi
# echo ""

# if [ $postgres -eq "0" ];then
#     echo "  ▶  postgres 프로세스 진단 결과 : 장애 (점검 필요) "
#     else echo "  ▶  postgres 프로세스 진단 결과 : 정상 "
# fi
# echo ""
# echo "**********************************************************************"

echo ""
echo "******************* moffice 관련 프로세스 진단 ************************"

for sname in `cat /root/script_exem/ser_pro.lst | awk -F: '{print $1}'`
do 
    pscnt=`ps -ef | grep $sname | grep -v grep | grep -v "@" | grep -v "^#" | wc -l`
#    sernum=`grep $sname /root/script_exem/ser_pro.lst | awk -F: '{print $2}'` 
    
    echo ""    
    echo " ■ $sname 현재 프로세스 갯수는 $pscnt 입니다."

    if [ $pscnt -eq "0" ]
    then
        echo "  ▶  $sname 프로세스 진단 결과 : 장애 (점검 필요) "
    elif [ $pscnt -gt "0" ]
    then
        echo "  ▶  $sname 프로세스 진단 결과 : 정상 "
    fi
done

echo ""
echo "**********************************************************************"
exit