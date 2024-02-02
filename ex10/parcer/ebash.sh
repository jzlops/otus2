#!/bin/bash

clear

# ----- Инициализация переменных и файлов -------------------
REP_DIR="./report"
LOG_DIR="./logs"

IP=$REP_DIR/ip.txt
echo "count ip" > $IP

URL=$REP_DIR/url.txt
echo "count url" > $URL

HTTP=$REP_DIR/http.txt
echo "count codes" > $HTTP

LOG_DATE=$REP_DIR/logdate.txt

FIRST_DATE=''
LAST_DATE=''
MESSAGE_BODY=''


# ----- Провекра запуска скритпа через .lock ----------------
LOCK_DIR="/tmp/ebash.lock"

if mkdir "$LOCK_DIR" >/dev/null 2>&1
  then
    echo "Удачный запуск скрипта."
    echo "Нажми аникей."
  else
    echo "Копия скрипта уже работает."
    exit 0
fi
trap 'rm -rf "$LOCK_DIR"' EXIT


# ----- выборка топовых 10 IP --------------------------------
cat $LOG_DIR/apache_logs.txt | sort | grep -P -o "^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"  | uniq -c | sort -nr | head -10 |awk '{$1=$1}1' >> $IP


# ----- выборка самых посещаемых 10 урлов --------------------
cat $LOG_DIR/apache_logs.txt | sort |grep -P -o "http[s:\/\/]+[-\w.\/]+" |  uniq -c | sort -nr | head -10 | awk '{$1=$1}1' >> $URL


# ----- выборка кодов HTTP и подсчет их количества -----------
cat $LOG_DIR/apache_logs.txt | sort | grep -P -o 'HTTP/1.[01]{1}" [0-9]{0,3}' | grep -Po  ' [0-9]{3}' | sort | uniq -c | sort -nr | awk '{$1=$1}1' >> $HTTP


# ----- Выбора дат начала и конца формирования лога ----------- 
head -1  $LOG_DIR/apache_logs.txt | grep -P -o '\[[0-9]+\/?[a-zA-Z]+\/[0-9]+:[0-9]+:[0-9]+:[0-9]+ \+[0-9]+]' > $LOG_DATE
tail -1  $LOG_DIR/apache_logs.txt | grep -P -o '\[[0-9]+\/?[a-zA-Z]+\/[0-9]+:[0-9]+:[0-9]+:[0-9]+ \+[0-9]+]' >> $LOG_DATE


# ----- Отправка почты получателю -----------------------------
FIRST_DATE=`head -1 $LOG_DATE`
LAST_DATE=`tail -1 $LOG_DATE`

MESSAGE_BODY="Log start date - $FIRST_DATE\n"
MESSAGE_BODY+="Log and date - $LAST_DATE\n"
MESSAGE_BODY+="Other info locate in the mail attachments"

echo -e $MESSAGE_BODY

echo -e $MESSAGE_BODY | mailx -v -r "otusEx@otus.ru" -s "Apache log report" -S smtp="192.168.204.83:25"  -a $HTTP -a $URL -a $IP  "st@niime.ru"

read
