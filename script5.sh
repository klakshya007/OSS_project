#!/bin/bash 
# Script 5: Open Source Manifesto Generator (Enhanced Edition)
# Author: Lakshya Kant | Course: Open Source Software 

# --- Concept Demonstration: Aliases ---
# To run this script easily from anywhere, you could add an alias to your ~/.bashrc file:
# alias manifesto='/path/to/script5.sh'
# After running 'source ~/.bashrc', you could just type 'manifesto' in your terminal!

# --- Color Variables ---
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
NC='\033[0m'

echo -e "${CYAN}=================================================${NC}"
echo -e "${MAGENTA} 🖋️  The Open Source Manifesto Generator 🖋️  ${NC}"
echo -e "${CYAN}=================================================${NC}"
echo -e "${YELLOW}Answer three questions to forge your philosophy...${NC}\n"

# Use read to capture user input
read -p "$(echo -e ${GREEN}1. Name one open-source tool you use every day: ${NC})" TOOL 
read -p "$(echo -e ${GREEN}2. In one word, what does 'freedom' mean to you? ${NC})" FREEDOM 
read -p "$(echo -e ${GREEN}3. Name one thing you would build and share freely: ${NC})" BUILD 

# Provide default fallbacks just in case the user hits enter without typing
TOOL=${TOOL:-"Linux"}
FREEDOM=${FREEDOM:-"collaboration"}
BUILD=${BUILD:-"knowledge"}

DATE=$(date '+%d %B %Y') 
OUTPUT="manifesto_$(whoami).txt" 

echo -e "\n${CYAN}[ RUNNING ]${NC} Forging your manifesto..."

# --- Write to file using redirection (> to overwrite, >> to append) ---

# Create the file and add the header
echo "=================================================" > "$OUTPUT"
echo "           MY OPEN SOURCE MANIFESTO              " >> "$OUTPUT"
echo "           Generated on: $DATE                   " >> "$OUTPUT"
echo "=================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Append the personalized paragraph using string concatenation
echo "I, $(whoami), declare my commitment to the open-source philosophy." >> "$OUTPUT"
echo "Every single day, I rely on powerful community-driven tools like $TOOL" >> "$OUTPUT"
echo "to navigate and shape my digital world." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, the core of open source is not just about free software;" >> "$OUTPUT"
echo "it is the absolute embodiment of $FREEDOM." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Because I stand on the shoulders of giants who freely shared their code," >> "$OUTPUT"
echo "I pledge to give back to the ecosystem. My ultimate goal is to build" >> "$OUTPUT"
echo "and share $BUILD openly with the world, ensuring the cycle" >> "$OUTPUT"
echo "of innovation and accessibility continues uninterrupted." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "=================================================" >> "$OUTPUT"

echo -e "${GREEN}[ SUCCESS ]${NC} Manifesto securely saved to ${YELLOW}$OUTPUT${NC}\n"

# Output the file contents to the screen
echo -e "${CYAN}--- Your Generated Manifesto ---${NC}"
cat "$OUTPUT"
echo -e "${CYAN}--------------------------------${NC}"
