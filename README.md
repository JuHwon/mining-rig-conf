# mining-rig-conf


## quick guide

1. this will download the script files into a scripts folder in the home directory:

       bash -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/juhwon/mining-rig-conf/master/remote-dl.sh`"

2. execute `prepare.sh` to install deps and set coolbit

3. edit the `overclock-gpus.sh` file to your demands

4. edit the `start-miner.sh` file to your demand

5. execute `create-cronjobs.sh` to enable autostart.
you can enter the tmux session with the following command

       tmux attach -t miner

