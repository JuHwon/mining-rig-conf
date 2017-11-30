#!/bin/bash

dlFolder=.mining-rig-conf

[[ -x `command -v wget` ]] && CMD="wget --no-check-certificate -0 -"
[[ -x `command -v curl` ]] >/dev/null 2>&1 && CMD="curl -#L"

if [ -z "$CMD" ]; then
  echo "No curl or wget available. Aborting."
else
  echo "Downloading script files..."
  mkdir -p "$HOME/$dlFolder" && \
  eval "$CMD https://github.com/juhwon/mining-rig-conf/tarball/master | tar xzvf - --strip-components=1 -C ~/$dlFolder" && \
  cp -r ~/$dlFolder/scripts ~/scripts

  mkdir -p "$HOME/.config/autostart"
  mkdir -p "$HOME/.local/share/applications"

  for file in $HOME/$dlFolder/autostart/*.desktop; do
    filename=${file##*/}
    echo "Creating Launcher for $filename"
    mv "$HOME/$dlFolder/autostart/$filename" "$HOME/.local/share/applications/" && \
    ln -s "$HOME/.local/share/applications/$filename" "$HOME/.config/autostart/"
  done

  echo "Cleaning up..."
  rm -rf ~/.mining-scripts
fi

