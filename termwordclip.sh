#!/run/current-system/sw/bin/bash

tee /tmp/termout | tr ' ' '\n' | sed '/^ *$/d' >> /tmp/termout
cat /tmp/termout | dmenu | tr -d '\n' | xclip -i

