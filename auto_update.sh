#!/bin/bash

# This is a script that when executed, performs a full update, 
# upgrade and cleanup.  It also logs the time and date of the
# execution into a file: (/home/dir/Documents/logs/update_logger.txt).

# Need to make sure script is being executed as sudo:
if [[ ${UID} -ne 0 ]]
then
	echo "You did not execute as Sudo."
	echo "Please run this script as Sudo!"
	echo "Attempted non-sudo execute by $(whoami) at $(date): ABORTED" >> /home/dir/Documents/logs/update_logger.txt
	echo " " >> /home/dir/Documents/logs/update_logger.txt
 	exit 1
else
	echo "Executed with Sudo privileges, Continuing:" >> /home/dir/Documents/logs/update_logger.txt
fi

# Perform update and upgrade:
sudo apt-get update && sudo apt-get upgrade -y
echo "		-> Update and Upgrade executed successfully." >> /home/dir/Documents/logs/update_logger.txt

# Perform cleanup:
apt autoremove
echo "		-> Cleanup executed successfully." >> /home/dir/Documents/logs/update_logger.txt

# Log status to the log file:
echo "Successful update performed at $(date)" >> /home/dir/Documents/logs/update_logger.txt
echo " " >> /home/dir/Documents/logs/update_logger.txt

# Exit:
exit 0

# NOTE: The cleanup command is not executed in this script, it can be added later if wished.
