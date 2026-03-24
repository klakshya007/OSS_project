#!/bin/bash 
# Script 3: Disk and Permission Auditor (Enhanced Edition)
# Author: Lakshya Kant | Course: Open Source Software 

# --- Color Variables ---
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# --- Variables ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp") 
SOFTWARE_CONF="/etc/libreoffice" # System-wide config directory

echo -e "${CYAN}=================================================${NC}"
echo -e "${MAGENTA} 📂 Disk and Permission Auditor 📂 ${NC}"
echo -e "${CYAN}=================================================${NC}"
echo -e "${YELLOW}Scanning core system directories...${NC}\n"

# Print a neat header for the table
printf "${GREEN}%-15s | %-10s | %-12s | %-15s${NC}\n" "Directory" "Size" "Permissions" "Owner:Group"
echo -e "${CYAN}-------------------------------------------------------------${NC}"

for DIR in "${DIRS[@]}"; do 
    if [ -d "$DIR" ]; then 
        # Use awk to grab specific columns from ls -ld
        PERM=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        
        # Get human-readable size, suppressing permission denied errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1) 
        
        # Format the output into aligned columns
        printf "%-15s | %-10s | %-12s | %-15s\n" "$DIR" "${SIZE:-N/A}" "$PERM" "$OWNER:$GROUP"
    else 
        echo -e "${RED}[ MISSING ] $DIR does not exist on this system.${NC}" 
    fi 
done 

echo -e "\n${CYAN}=================================================${NC}"
echo -e "${YELLOW}🔍 Target Software Config Check (LibreOffice)${NC}"
echo -e "${CYAN}=================================================${NC}"

# Check for the software's configuration directory
if [ -d "$SOFTWARE_CONF" ]; then
    PERM=$(ls -ld "$SOFTWARE_CONF" | awk '{print $1}')
    OWNER=$(ls -ld "$SOFTWARE_CONF" | awk '{print $3":"$4}')
    SIZE=$(du -sh "$SOFTWARE_CONF" 2>/dev/null | cut -f1)
    
    echo -e "📁 ${GREEN}$SOFTWARE_CONF${NC} is present."
    echo -e "   ↳ Size  : ${YELLOW}$SIZE${NC}"
    echo -e "   ↳ Perms : ${CYAN}$PERM${NC}"
    echo -e "   ↳ Owner : ${MAGENTA}$OWNER${NC}"
else
    echo -e "📁 ${RED}$SOFTWARE_CONF${NC} is not found."
    echo -e "   ${YELLOW}(Tip: Check ~/.config/libreoffice if installed locally!)${NC}"
fi

echo -e "${CYAN}=================================================${NC}"
