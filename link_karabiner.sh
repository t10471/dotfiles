#!/bin/bash
PWD=$(cd $(dirname $0) && pwd)
mkdir -p ~/.config/karabiner/assets/complex_modifications/
ln -s ${PWD}/my_karabiner.json ~/.config/karabiner/assets/complex_modifications/
