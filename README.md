# auto-update-packages

**This program probably is not yet totally documented**

This program was made to help automatically update system packages managed by dpkg using its frontend (apt) on every boot. This is done by using a systemd service file. 

**Note:** this is only a personal project, and it is released under the GNU General Public License, Version 2.

---
This software can be used on personal computers, server or anything else that meets the requirements below.

## Requirements
- Linux-based system
- DPKG as the system packages manager
- Systemd as init implementation
- Any kind of acess to the Internet

## Systemd service
To disable the systemd service, run:
`auto-update-packages disable`
And to enable it:
`auto-update-packages enable`
**Note:** during installation, the systemd service is enabled by default.

## Uninstallation
To uninstall this software from your computer, simply run:
`auto-update-packages uninstall`

## Additional Help
#### Valid Arguments
Run `auto-update-packages help` to display valid arguments

## Methods Of Installation
If you already have auto-update-packages program installed on your computer, simply run `sudo ./install` once inside the downloaded directory/repository to update it. All old program files will be deleted. Alternatively, uninstall it running `auto-update-packages uninstall` and then `sudo ./install`.

### Method 1 - Clone The Repository With GIT And Run
This method of installation will always download the most updated repository, but there is no guarantee of stability.
```bash
git clone https://github.com/fearlessdots/auto-update-packages
cd auto-update-packages
chmod +x install
sudo ./install
```
**Attention:** by default, the executable will be installed in /usr/bin and the other configuration files in /usr/share/auto-update-packages. You can change this (not recommended) by modifying the variable values inside the installation script.

### Method 2 - Download ZIP File And Run
This method of installation will always download the most recent release (sometimes outdated in comparison with the GIT repository). Downloading the most recent releases may be more stable than downloading the repository.

Use the command you prefer, e.g. wget or curl. Running wget:
```bash
wget https://github.com/fearlessdots/auto-update-packages/archive/refs/heads/main
unzip main
cd auto-update-packages
chmod +x install
sudo ./install
```
**Attention:** by default, the executable will be installed in /usr/bin and the other configuration files in /usr/share/auto-update-packages. You can change this (not recommended) by modifying the variable values inside the installation script.

## License
The auto-update-packages software is released under the GNU General Public License Version 2.0 (GPL-2.0).
```
Copyright (C) 2021 Filipe Bertelli

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
```