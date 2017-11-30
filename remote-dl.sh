#!/bin/bash

[[ -x `command -v wget` ]] && CMD="wget --no-check-certificate -0 -"
[[ -x `command -v curl` ]] >/dev/null 2>&1 && CMD="curl -#L"

if [ -z "$CMD" ]; then
  echo "No curl or wget available. Aborting."
else
  echo "Downloading script files..."
  mkdir -p "$HOME/.mining-scripts" && \
  eval "$CMD https://github.com/juhwon/mining-rig-conf/tarball/master | tar xzvf - --strip-components=1 -C ~/.mining-scripts" && \
  cp -r ~/.mining-scripts/scripts ~/scripts

  mkdir -p "$HOME/.config/autostart"
  mkdir -p "$HOME/.local/share/applications"

  for file in $HOME/.mining-scripts/autostart/*.desktop; do
    filename=${file##*/}
    echo "Creating Launcher for ${filename}"
    cp ~/.mining-scripts/autostart/$filename ~/.local/share/applications/ && \
    ln -s ~/.local/share/applications/$filename ~/.config/autostart/
  done

  rm -rf ~/.mining-scripts
fi

