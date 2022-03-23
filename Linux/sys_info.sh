#!/bin/bash

# Check for research directory.  Create it if needed.
if [ ! -d $HOME/research ]
then
mkdir $HOME/research
fi

#Check for output file.  Clear it if needed.
if [ -f $output ]
then
 > $output
fi






echo "A Quick System Audit Script" >> $output
date >> $output
echo "" >> $output
echo "Machine Type Info:" >> $output
echo -e "$MACHTYPE \n" >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info: " >> $output
echo "Hostname: $(hostname -s) \n" >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output
echo "nMemory Info:" >> $output
free >> $output
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output
echo -e "\nWho is logged in: \n $(who) \n" >> $output
#-----------------Third-Activity---------------------#
echo "Memory Info:"
free
echo -e "\nCPU Info:"
lscup | grep CPU
echo -e "\nDisk Usage:"
df -H | head -2
echo -e "\nWho is logged in: \n $(who) \n"
echo -e "\nCreating research directory\n"
mkdir ~/research 2> /dev/null
echo -e "\nTop 10 Processes\n"
ps aux -m | awk '{print $1, $2, $3, $4, $11}' | head -11

