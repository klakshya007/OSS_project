#!/bin/bash 
# Script 1: System Identity Report 
# Author: Lakshya Kant | Course: Open Source Software 

# --- Variables --- 
STUDENT_NAME="Lakshya Kant"         
SOFTWARE_CHOICE="LibreOffice"      

# --- System info --- 
# Using lsb_release to reliably get the distribution name
if command -v lsb_release >/dev/null 2>&1; then
    DISTRO=$(lsb_release -d -s)
else
    DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)
fi

KERNEL=$(uname -r) 
USER_NAME=$(whoami)
HOME_DIR=$HOME 
UPTIME=$(uptime -p) 
CURRENT_DATE=$(date)

# --- Display --- 
echo "=================================================" 
echo "  Open Source Audit — $STUDENT_NAME" 
echo "  Target Software   — $SOFTWARE_CHOICE"
echo "=================================================" 
echo "OS Distro : $DISTRO"
echo "Kernel    : $KERNEL" 
echo "User      : $USER_NAME" 
echo "Home Dir  : $HOME_DIR"
echo "Uptime    : $UPTIME" 
echo "Date      : $CURRENT_DATE"
echo "-------------------------------------------------"
echo "This Linux Operating System is primarily covered by "
echo "the GNU General Public License (GPL v2)."
echo "================================================="
