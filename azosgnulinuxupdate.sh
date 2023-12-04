#!/bin/bash

# Licenced under the GNU GPL 3.0
# Part of AZOS GNU/Linux and all legal information from this legal page apply here: https://sites.google.com/view/azosofficialsite/legal

if [ ! -f /etc/azversion ] ; then # user is on 2.0
    # display update information
    echo "Update 2.0.1 found!"
    echo ""
    echo "Basic quality of life update."
    echo "Put your suggestions for the next part of this update (2.0.2) in the discord! ()"
    echo ""
    echo "CHANGELOG:"
    echo "- 2 New Wallpapers"
    echo "- Added powertop tool"
    echo "- Update system packages to latest version"
    echo "- Added update versioning system"
    echo "- Replaced KCalc with GNOME Calculator"
    echo "- Replaced Kontact with GNOME Calendar, GNOME Contacts and Endeavour (For emails Thunderbird was preincluded with AZOS GNU/Linux since 2.0)"
    echo ""
    echo "CHANGELOG FOR ISO RELEASE:"
    echo "All of the above plus"
    echo "- Striped out useless media players"
    echo "- Removed plasma-welcome after installation"
    echo ""
    echo "Files that will be created/changed:"
    echo "('+' means created, '-' means removed and '~' means changed)"
    echo "+ /usr/share/wallapers/azos_1 (and all contents)"
    echo "+ /usr/share/wallapers/azos_2 (and all contents)"
    echo "+ /etc/azversion"
    echo ""
    echo "Packages that will be added/removed:"
    echo "('+' means created and '-' means removed)"
    echo "+ powertop"
    echo "+ gnome-calculator"
    echo "+ gnome-calendar"
    echo "+ gnome-contacts"
    echo "+ endeavour"
    echo "- kcalc"
    echo "- kontact"
    echo ""
    echo "The update can also be downloaded in binary .iso form from the website."
    echo "DO NOT INTERUPT THE UPDATE, YOU ARE PUTTING YOUR SYSTEM'S INTEGRITY AT RISK!"
    echo "(If the update was interupted, DO NOT RESTART YOUR PC! Instead re-run the update which will fix everything hopefully.)"
    echo ""
    echo "If the update interferes with personal preference you can close this window."
    echo ""
    read -p "Press any key to start the update..."
    # install update
    sudo pacman -Syu powertop gnome-calculator gnome-calendar endeavour
    sudo pacman -R kcalc kontact
    cd /home/$USER
    wget https://github.com/RedFireSoftwareEntertainment/azosgnulinuxupdates/raw/main/RESOURCES/2.0.1.tar.gz
    sudo tar -zxvf 2.0.1.tar.gz
    cd 2.0.1
    cd etc
    sudo cp issue /etc
    sudo cp os-release /etc
    cd /home/$USER/2.0.1
    sudo cp -r wallpapers/azos_1 /usr/share/wallpapers
    sudo cp -r wallpapers/azos_2 /usr/share/wallpapers
    cd /home/$USER
    rm -rf 2.0.1
    cd /etc
    sudo touch azversion
    read -p "Would you like to restart? (RECOMMENDED! If you don't want, just close this window, but you may face stabillity issues.)"
    sudo systemctl reboot
fi
echo "All AZOS GNU/Linux patches installed, nothing new..."
