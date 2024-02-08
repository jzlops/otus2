#!/bin/bash 

cd /proc

zero_vars (){
	PID=''
	TTY=''
	STAT=''
	UTIME=''
	KTIME=''
	COMMAND=''	
	PNAME=''
}

get_proc_data (){

	PID=$1

	if [ -L ./fd/0 ]; then
		TTY=`ls -l ./fd/0 | grep -oP '[\/dev\/]{5}.+' |  sed "s/\/dev\///g"  | sed "s/null/tty1/g" |sed "s/[[:space:]]*//g" `
	else
		TTY='?'
	fi

	STAT=`cat ./stat | awk '{print $3}'`
	UTIME=`cat ./stat | awk '{print $14}'`
	KTIME=`cat ./stat | awk '{print $15}'`
	PNAME=`cat ./comm`

	COMMAND=`(ls -l ./exe | grep -oP "[\/].+" | sed "s/\/exe -> //g") 2>/dev/null  | sed "s/\/exe//g" `
	
    echo -e "PID:$PID	TTY:$TTY	STAT:$STAT	USER_CPU_TIME:$UTIME	KERNEL_CPU_TIME:$KTIME	PROC_NAME:$PNAME	COMMAND:$COMMAND"
}

for i in `ls -d */ | grep -oP "[0-9]+"`; do
	if [ -d ./$i ]; then
		cd ./$i
		get_proc_data $i
		zero_vars
		cd ..
	fi
done
