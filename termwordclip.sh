#!/run/current-system/sw/bin/bash

tr ' ' '\n' | grep -v '^$' | dmenu | tr -d '\n' | xclip -i
