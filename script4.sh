#!/bin/bash 
# Script 4: Log File Analyzer (Enhanced Edition)
# Author: Lakshya Kant | Course: Open Source Software 

# --- Color Variables ---
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
NC='\033[0m'

echo -e "${CYAN}=================================================${NC}"
echo -e "${MAGENTA} 📜 Log File Analyzer 📜 ${NC}"
echo -e "${CYAN}=================================================${NC}"

LOGFILE=$1 
KEYWORD=${2:-"error"}    # Default keyword is 'error' 
COUNT=0 

# --- TODO 1: do-while style retry if the file is empty or missing ---
# Bash doesn't have a strict 'do-while', so we use 'while true' with a break condition
while true; do
    # -z checks if variable is empty, ! -f checks if file exists, ! -s checks if file has size > 0
    if [ -z "$LOGFILE" ] || [ ! -f "$LOGFILE" ] || [ ! -s "$LOGFILE" ]; then 
        if [ -n "$LOGFILE" ]; then
            echo -e "${RED}[ ALERT ] '$LOGFILE' is either missing or 100% empty.${NC}"
        fi
        echo -e "${YELLOW}Please enter a valid, non-empty log file path (e.g., /var/log/syslog):${NC} \c"
        read LOGFILE
    else
        # File exists and has data, break out of the loop!
        break
    fi
done

echo -e "\n${CYAN}[ RUNNING ]${NC} Scanning ${YELLOW}$LOGFILE${NC} for '${MAGENTA}$KEYWORD${NC}'..."

# Read line by line using while-read and if-then
while IFS= read -r LINE; do 
    if echo "$LINE" | grep -iq "$KEYWORD"; then 
        COUNT=$((COUNT + 1)) 
    fi 
done < "$LOGFILE" 
 
echo -e "${GREEN}[ SUCCESS ] Scan Complete!${NC}"
echo -e "Keyword '${MAGENTA}$KEYWORD${NC}' found ${YELLOW}$COUNT${NC} times.\n"

# --- TODO 2: Print the last 5 matching lines using tail + grep ---
if [ "$COUNT" -gt 0 ]; then
    echo -e "${CYAN}=================================================${NC}"
    echo -e "${YELLOW}🔍 Last 5 Matching Entries:${NC}"
    echo -e "${CYAN}-------------------------------------------------${NC}"
    
    # Extract matches and pipe to tail to get the last 5
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
    
    echo -e "${CYAN}=================================================${NC}"
fi
