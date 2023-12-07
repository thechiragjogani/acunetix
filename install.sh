echo //========================================================================
echo "          Acunetix DOWNLOAD, INSTALL, and CRACK by Chirag" 
echo //========================================================================
echo
echo " o Modifying Hosts File!"
echo -e "127.0.0.1  erp.acunetix.com" | sudo tee -a /etc/hosts
echo -e "127.0.0.1  erp.acunetix.com." | sudo tee -a /etc/hosts
echo -e "::1  erp.acunetix.com" | sudo tee -a /etc/hosts
echo -e "::1  erp.acunetix.com." | sudo tee -a /etc/hosts
echo -e "192.178.49.174  telemetry.invicti.com" | sudo tee -a /etc/hosts
echo -e "192.178.49.174  telemetry.invicti.com." | sudo tee -a /etc/hosts
echo -e "2607:f8b0:402a:80a::200e  telemetry.invicti.com" | sudo tee -a /etc/hosts
echo -e "2607:f8b0:402a:80a::200e  telemetry.invicti.com." | sudo tee -a /etc/hosts
echo
echo " o Installing prerequisites!"
sudo apt-get install libxdamage1 libgtk-3-0 libasound2 libnss3 libxss1 libx11-xcb1 libxcb-dri3-0 libgbm1 libdrm2 libxshmfence1 libxmlsec1-openssl bzip2 -y
echo
echo " o Uninstalling old Acunetix!"
sudo userdel acunetix 2>/dev/null
sudo chattr -i /home/acunetix/.acunetix/data/license/license_info.json 2>/dev/null
sudo chattr -i /home/acunetix/.acunetix/data/license/wa_data.dat 2>/dev/null
sudo rm -rf /home/acunetix 2>/dev/null
echo
echo " o Downloading Acunetix!"
sudo rm ./acunetix*
wget -nc https://91.92.246.92/acunetix_23.9.231020153_x64.sh --no-check-certificate
echo
echo " o Installing Acunetix!"
sudo bash ./acunetix*
echo
echo " o Stopping Acunetix!"
sudo systemctl stop acunetix
echo
echo " o Doing Magic!"
sudo cp ./wvsc /home/acunetix/.acunetix/v_231020153/scanner/wvsc
sudo chown acunetix:acunetix /home/acunetix/.acunetix/v_231020153/scanner/wvsc
sudo chmod +x /home/acunetix/.acunetix/v_231020153/scanner/wvsc
sudo rm /home/acunetix/.acunetix/data/license/*
sudo cp license_info.json /home/acunetix/.acunetix/data/license/
sudo cp wa_data.dat /home/acunetix/.acunetix/data/license/
sudo chown acunetix:acunetix /home/acunetix/.acunetix/data/license/license_info.json
sudo chown acunetix:acunetix /home/acunetix/.acunetix/data/license/wa_data.dat
sudo chmod 444 /home/acunetix/.acunetix/data/license/license_info.json
sudo chmod 444 /home/acunetix/.acunetix/data/license/wa_data.dat
sudo chattr +i /home/acunetix/.acunetix/data/license/license_info.json
sudo chattr +i /home/acunetix/.acunetix/data/license/wa_data.dat
echo
echo " o Starting Acunetix!"
sudo systemctl start acunetix
echo -ne '\n  o Done!\n'
echo "        Access your Acunetix:"
echo "        https://localhost:3443/"
echo
