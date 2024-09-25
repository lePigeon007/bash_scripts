#!/bin/bash

# Script that purges and reinstalls the nvidia drivers.

echo "#################################################################"
echo "# This script/program purges and reinstalls the current latest  #"
echo "# NVIDIA drivers. When nvidia-smi command is not working and is #"
echo "# displaying: 'NVIDIA-SMI has failed because it couldn't commu- #"
echo "# nicate with the NVIDIA driver. Make sure the latest NVIDIA    #"
echo "# driveris installed and running.'. Run this script to fix the  #"
echo "# issue.							      #"
echo "#								      #"
echo "#~~~~~~~~~~~~~~~~~~~~~~~~DISCLAIMER~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#"
echo "# Before running this program, save all completed work or items #"
echo "# currently being used. The process requires a reboot to be     #"
echo "# conducted in order to be completed.                           #"
echo "#################################################################"

# Start by purging old drivers.
echo "Welcome to the NVIDIA driver reinstall/fix system. You are about "
echo "to remove and reinstall all current NVIDIA drivers, which will   "
echo "require a reboot to take place. "
echo ""
echo "Please save all work before continuing."
echo "Have you saved all current work? [y/n] "
read answer

# Saving check.
if [[ $answer == "n" || $answer == "N" ]]; then
  echo "Please exit by pressing CTRL + C and saving all work in progress!"
  echo "Program exiting!"
  exit 1
fi

# Purge old drivers.
echo "You are about to purge all old drivers."
echo "Do you want to proceed? [y/n] "
read answer

if [[ $answer == "y" || $answer == "Y" ]]; then
  echo "Purging all drivers."
  sudo apt-get remove --purge nvidia-.* -y				# Removes old drivers.
  sudo apt-get remove --purge libnvidia-.* -y				# Removes nvidia libs.
  echo "Removal of drivers and libs complete!"
else
  echo "Process cancelled!"
  echo "Exiting program!"
  exit 2
fi

# Reinstall new drivers.
echo "You are about to install the new NVIDIA drivers."
echo "Do you wish to continue? [y/n] "
read answer

if [[ $answer == "y" || $answer == "Y" ]]; then
  echo "Fetching new drivers!"
  sudo apt install nvidia-driver-550 -y					# The current newest driver, to be automated later.
  echo "Current driver version: 550"
  echo "The system needs to reboot before changes are applied."
  echo "Would you like to reboot now? [y/n] "
  read answer2
  # Ask if user wants to reboot?
  if [[ $answer2 == "y" || $answer2 == "Y" ]]; then
    echo "Are you sure you want to reboot now?"
    echo "All unsaved work will be lost."
    echo "If you have unsaved work, abort and save"
    echo "before rebooting manually."
    echo ""
    echo "Are you sure you want to reboot? [y/n] "
    read answer3
    # Confirm want to reboot.
    if [[ $answer3 == "y" || $answer3 == "Y" ]]; then
      echo "Reboot will be carried out in 30 seconds!"
      echo "If you wish to abort, press CTRL+C."
      sleep 30								# Reboot timer, give user time to abort if they make mistake/want to abort.
      sudo reboot
   else
     echo "Reboot aborted, please manually reboot to"
     echo "finish installation of drivers."
     exit 1
   fi
   else
     echo "Reboot not carried out, please perform manual"
     echo "reboot to complete changes."
     exit 1
   fi
else
  echo "New driver is not installing, process cacelled."
  echo "You currently do not have an NVIDIA driver installed."
  echo "You will need to install one in order/before you can "
  echo "use graphical features and systems."
  exit 1
fi

exit 0
