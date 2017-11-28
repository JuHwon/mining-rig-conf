#!/bin/bash

[[ -x `command -v wget` ]] && CMD="wget --no-check-certificate -0 -"
[[ -x `command -v curl` ]] >/dev/null 2>&1 && CMD="curl -#L"

if [ -z "$CMD" ]; then
  echo "No curl or wget available. Aborting."
else
  echo "Downloading script files..."
  mkdir -p "$HOME/scripts" && \
  #eval "$CMD https://github.com/juhwon/mining-rig-conf/tarball/master | tar xzv - -C ~/scripts --strip-components=1 scripts "
  eval "$CMD https://github.com/juhwon/mining-rig-conf/tarball/master | tar xzvf - --strip-components=2 -C ~/scripts"
fi

