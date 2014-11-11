#!/bin/bash

#System status Bash script (SSB)
# =======================================================
#Free space, breakin's and more
#Version: 1.0.0
#Supported Operating Systems: All Linux
#Author Giumbai

st2="\033[91;40m"
st="\033[92m"
n="\033[0m"
ziua=$(date +"%d-%m-%Y")
time0=$(date +"%H:%M:%S")
os=$(uname)
os2=$(uname -r)
breakin=$(cat /var/log/auth.log | grep break)
freespace=$(df -h / | grep -E "\/$" | awk '{print $4}')
logdate=$(date +"%d%m%y")
logfile="$logdate"_SSBreport.log
name="SSB_by_giumbai"
fqdn=$(hostname -d)
breakin=$(cat /var/log/auth.log | grep break >> $logfile)

if

echo -e "$st2#####################################################################$n"
printf "\tName of script:\t%s\n" $name
printf "\tHostname is:\t%s\n" $HOSTNAME
printf "\tThe FQDN is:\t%s\n" $fqdn
printf "\tThe date is:\t%s\n" $ziua
printf "\tThe time is:\t%s\n" $time0
printf "\tSystem type:\t%s\n" $MACHTYPE
printf "\tFree space:\t%s\n" $freespace

echo -e "$st2 Kernel $st $os $os2 $n$st2 with BASH version:$st$BASH_VERSION$n"
echo -e "$st BreakIn atempts, if empty no breakin atempts $n"
echo $breakin
echo -e "$st All finished perfectly $n"

cat <<- EOF > $logfile
		This report is automatlic generated.
EOF

echo -e "#####################################################################" >> $logfile
printf "\tName of script:\t%s\n" $name >> $logfile
printf "\tHostname is:\t%s\n" $HOSTNAME >> $logfile
printf "\tThe FQDN is:\t%s\n" $fqdn >> $logfile
printf "\tThe date is:\t%s\n" $ziua >> $logfile
printf "\tThe time is:\t%s\n" $time0 >> $logfile
printf "\tSystem type:\t%s\n" $MACHTYPE >> $logfile
printf "\tFree space:\t%s\n" $freespace >> $logfile

echo -e "Kernel $st $os $os2 with BASH version:BASH_VERSION" >> $logfile
echo $breakin >> $logfile

then
sudo mv $logfile /var/log
else
echo -e "$st2 A problem has been found for details consult the logs $n"
sudo mv $logfile /var/log
fi