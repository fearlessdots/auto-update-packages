#!/bin/bash

# GitHub repository: https://github.com/fearlessdots/auto-update-packages
# RUN THIS SCRIPT AS ROOT
# Warning: changing the values of the variables in this script may render it unworkable.

# The values below refer to the installation directories. If needed to change them,
# do it cautiously.
PROGRAM_DIR=/usr/share/auto-update-packages
EXEC_DIR=/usr/bin
LOG_DIR="$PROGRAM_DIR/logs"
SYMD_DIR="/etc/systemd/system"

# Shell display functions
show_info(){
	echo "[  AutoUpdatePackages  ] $1"
}

show_attention(){
	echo "[ ATTENTION ] $1"
}

finish_program()
{
	# $1 is the exit code
	exit $1
}

#
##
#

show_info "Running installation script..."
show_info "Verifying if program is already installed"

if [ -d $PROGRAM_DIR ]
then
	show_attention "Program directory already exists in $PROGRAM_DIR. If you continue, everything
	inside it will be overwritten. Type 'aware' to continue with the installation process. Any
	other character will cancel this installation"
	read CONTINUE
	if [ ! "$CONTINUE" = 'aware' ]
	then
		show_info "Aborting installation process"
		finish_program 1
	else
		show_info "Carrying on with the installation process..."
	fi
fi

# Remove old installation files, if any

if [ -d $PROGRAM_DIR ]
then
	rm -rf $PROGRAM_DIR	
fi

if [ -f $SYSMD_DIR/autoupdatepackages.service ]
then
	rm $SYSMD_DIR/autopackagesupdate.service
fi

if [ -f $EXEC_DIR/auto-update-packages ]
then
	rm $EXEC_DIR/auto-update-packages
fi

sleep 2

show_info "Moving execuable to $EXEC_DIR"
cp auto-update-packages $EXEC_DIR
chown -R root:root $EXEC_DIR/auto-update-packages
chmod 755 $EXEC_DIR/auto-update-packages

sleep 1

show_info "Creating program directory at $PROGRAM_DIR and moving files"
mkdir $PROGRAM_DIR $PROGRAM_DIR/logs $PROGRAM_DIR/bin
cp uninstall service-control $PROGRAM_DIR/bin
cp VERSION README.md $PROGRAM_DIR
chown -R root:root $PROGRAM_DIR
chmod -R 755 $PROGRAM_DIR/bin


sleep 1

show_info "Copying systemd service file to $SYSMD_DIR and enabling it"
cp autopackagesupdate.service $SYSMD_DIR
chown root:root $SYSMD_DIR/autoupdatepackages.service
chmod 644 $SYSMD_DIR/autoupdatepackages.service
systemctl enable autoupdatepackages.service

sleep 1

show_info "Program installed succesfully!"

finish_program 0
