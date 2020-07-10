#!/bin/bash
set -Eeuo pipefail

echo 'Copying .fdignore'
cp -f $(dirname $0)/.fdignore $HOME
