#!/usr/bin/env bash
sudo zypper in thermald tlp powertop patterns-desktop-laptop
sudo echo "blacklist nouveau" >> /etc/modprobe.d/49-disablenouveau.conf
sudo chmod 644 /etc/modprobe.d/49-disablenouveau.conf
sudo /sbin/mkinitrd -f
sudo cp brcmfmac4356-pcie.bin /lib/firmware/brcm/brcmfmac4356-pcie.bin
sudo cp brcmfmac4356-pcie.txt /lib/firmware/brcm/brcmfmac4356-pcie.txt
sudo cp chtrt5645.conf /usr/share/alsa/ucm/chtrt5645/chtrt5645.conf
sudo cp HiFi.conf /usr/share/alsa/ucm/chtrt5645/HiFi.conf
sudo "set-card-profile alsa_card.platform-cht-bsw-rt5645 HiFi" >> /etc/pulse/default.pa
sudo "set-default-sink alsa_output.platform-cht-bsw-rt5645.HiFi__hw_chtrt5645__sink" >> /etc/pulse/default.pa
sudo "set-sink-port alsa_output.platform-cht-bsw-rt5645.HiFi__hw_chtrt5645__sink [Out] Speaker" >> /etc/pulse/default.pa
sudo "realtime-scheduling = no" >> /etc/pulse/daemon.conf
sudo reboot
