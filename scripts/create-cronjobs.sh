#!/bin/bash

(crontab -l ; echo "@reboot sleep 10 && bash $HOME/scripts/overclock-gpus.sh") | sort - | uniq - | sudo crontab -


(crontab -l ; echo "@reboot bash $HOME/scripts/autostart-miner.sh") | sort - | uniq - | crontab -

(crontab -l ; echo "@reboot bash $HOME/scripts/autostart-monitoring.sh") | sort - | uniq - | crontab -
