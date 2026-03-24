# OSS_project
**Course:** Open Source Software (OSS NGMC)

**Student Name:** Lakshya Kant

**Registration Number:** 24BCE10549

**Target Software:** LibreOffice

Project Overview
----------------

This repository contains a suite of five Bash shell scripts developed as part of "The Open Source Audit" capstone project. These scripts demonstrate practical Linux command-line skills, system administration concepts, and an understanding of the open-source philosophy, specifically focused on the LibreOffice ecosystem and its host environment.

Dependencies & Prerequisites
----------------------------

To run these scripts successfully, you will need:

*   A Debian/Ubuntu-based Linux environment (due to the use of dpkg in Script 2).
    
*   Standard GNU coreutils (awk, grep, sed, du, df, etc.).
    
*   **Target Software:** It is highly recommended to have LibreOffice installed (sudo apt install libreoffice-core) so Scripts 2 and 3 can detect its presence and configuration directories.
    

Script Descriptions & Execution Guide
-------------------------------------

### Initial Setup

Before running any of the scripts, you must make them executable. Navigate to the directory containing the scripts and run:

`   chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh   `

### Script 1: System Identity Report (script1.sh)

**Description:** Acts as a welcome screen. It uses command substitution and variables to fetch and display the current Linux distribution, kernel version, logged-in user, home directory, system uptime, and the primary open-source license governing the operating system (GPL).**How to Run:**

`   ./script1.sh   `

### Script 2: FOSS Package Inspector (script2.sh)

**Description:** Uses conditional logic (if-then-else) and the Debian package manager (dpkg) to verify if the target software (LibreOffice) is installed. It extracts the version, architecture, and maintainer details using piped grep commands. Finally, it uses a case statement to print a personalized philosophical note about the software.**How to Run:**

`   ./script2.sh   `

### Script 3: Disk and Permission Auditor (script3.sh)

**Description:** Utilizes a for loop to iterate through an array of critical system directories (like /etc, /var/log, /home). It reports the human-readable size, permissions, and owner/group of each directory using awk. It also specifically checks for the existence and permissions of the LibreOffice configuration directory.**How to Run:**_(Note: Run with sudo to allow the du command to accurately calculate the sizes of root-owned directories like /var/log without permission denied errors)._

`   sudo ./script3.sh   `

### Script 4: Log File Analyzer (script4.sh)

**Description:** A text processing tool that reads a specified log file line-by-line using a while-read loop. It counts the occurrences of a specific keyword (defaulting to "error") using an internal counter variable and if-then logic. It features a simulated do-while loop to enforce valid file inputs and prints the last 5 matching lines.**How to Run:**

`   ./script4.sh /var/log/syslog error   `

_(Tip: If you don't have read access to system logs, you can create a test file: echo "error test" > test.log and run ./script4.sh test.log)_

### Script 5: The Open Source Manifesto Generator (script5.sh)

**Description:** An interactive script that prompts the user with three questions using the read command. It takes those inputs, combines them with system variables (like the current date and user), and uses output redirection (> and >>) to dynamically generate and save a personalized open-source philosophy paragraph into a .txt file.**How to Run:**

`   ./script5.sh   `
