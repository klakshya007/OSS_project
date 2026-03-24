#!/bin/bash 
# Script 2: FOSS Package Inspector (Enhanced & Fun Edition)
# Author: Lakshya Kant | Course: Open Source Software 

# --- Color Variables for Fun Terminal Output ---
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# --- Variables ---
PACKAGE="libreoffice-core" 

echo -e "${CYAN}=================================================${NC}"
echo -e "${MAGENTA} 🕵️‍♂️  FOSS Package Inspector - Deep Dive 🕵️‍♂️ ${NC}"
echo -e "${CYAN}=================================================${NC}"
echo -e "Targeting Software: ${YELLOW}$PACKAGE${NC}...\n"

# Check if package is installed 
if dpkg -s "$PACKAGE" &>/dev/null; then 
    echo -e "${GREEN}[ SUCCESS ] Hurray! '$PACKAGE' is installed on this rig.${NC}" 
    echo -e "${CYAN}-------------------------------------------------${NC}"
    echo -e "${YELLOW}📦 Package Details:${NC}"
    
    # Extracting more details: Version, Maintainer, Architecture, and Homepage
    dpkg -s "$PACKAGE" | grep -E '^Version|^Maintainer|^Architecture|^Homepage' | sed 's/^/   /'
    
    echo -e "${CYAN}-------------------------------------------------${NC}"
else 
    echo -e "${RED}[ ALERT ] Bummer! '$PACKAGE' is NOT installed on this system.${NC}" 
    echo -e "          (Pro tip: try 'sudo apt install $PACKAGE' to fix that!)"
fi 

echo -e "\n${YELLOW}💡 FOSS Philosophy Corner:${NC}"

# --- Philosophy Note (Case Statement) ---
case $PACKAGE in 
    *libreoffice*)  
        echo -e "   📖 ${GREEN}LibreOffice:${NC} The community-driven powerhouse that broke free from corporate chains!" 
        ;; 
    *apache2*|*httpd*)  
        echo -e "   🌐 ${GREEN}Apache:${NC} The legendary web server that literally built the open internet." 
        ;; 
    *mysql*|*mariadb*)  
        echo -e "   🐬 ${GREEN}MySQL/MariaDB:${NC} Pumping data through the heart of millions of apps worldwide." 
        ;; 
    *git*)
        echo -e "   🌳 ${GREEN}Git:${NC} Linus Torvalds' other masterpiece. The decentralized backbone of modern coding."
        ;;
    *python3*)
        echo -e "   🐍 ${GREEN}Python 3:${NC} Importing antigravity since 1991. The language that powers everything."
        ;;
    *)
        echo -e "   🐧 ${GREEN}FOSS:${NC} Empowering users through the ultimate freedom to run, study, and modify code."
        ;;
esac 

echo -e "${CYAN}=================================================${NC}"
