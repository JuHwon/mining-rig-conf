#!/bin/bash

startOffset=5

# create tmux session
tmux new-session -d -s miner

# print start delay message
tmux send-keys -t miner "# Waiting $startOffset seconds to start the miner"
for (( i=0; i<=$startOffset; i++ ))
do
tmux send-keys -t miner "."
sleep 1
done
tmux send-keys -t miner C-m

#start miner
tmux send-keys -t miner "$HOME/scripts/start-miner.sh" C-m

