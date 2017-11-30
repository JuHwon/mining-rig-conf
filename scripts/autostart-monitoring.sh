#!/bin/bash

startOffset=30

# create tmux session
tmux new-session -d -s monitoring

# print start delay message
tmux send-keys -t monitoring "# Waiting $startOffset seconds to start the monitoring"
for (( i=0; i<=$startOffset; i++ ))
do
tmux send-keys -t monitoring "."
sleep 1
done
tmux send-keys -t monitoring C-m

#start monitoring
tmux send-keys -t monitoring "$HOME/scripts/start-monitoring.sh" C-m

