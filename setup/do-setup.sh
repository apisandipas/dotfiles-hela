#!/bin/bash

sudo -v
# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
set -e

source ./_utils.sh

source defaults.sh
source tools.sh
source casks.sh
source optimizations.sh
source summary.sh
