#!/run/current-system/sw/bin/bash

tr -d '\0' | tee /tmp/termout | awk -v OFS="\n" '{$1=$1}1' | cat - /tmp/termout | sed -r 's/^[ \t]*//g' | sed -r 's/[ \t]*$//g' | sort -r | uniq | tee /tmp/termout | dmenu -i | tr -d '\n' | xclip -i

# sed '/^$/d' | sed '/^ *$/d' | tee /tmp/termout | tr ' ' '\n' | sed '/^ *$/d' | sed '/^$/d' >> /tmp/termout
# sed -e 's/^[ \t]*//g' /tmp/termout | dmenu | tr -d '\n' | xclip -i


# xclip -i -selection clipboard
# sed '/^ *$/d' | tee /tmp/termout | tr ' ' '\n' | sed '/^ *$/d' >> /tmp/termout
# cat /tmp/termout | sed -e 's/^[ \t]*//' | dmenu | tr -d '\n' | xclip -i
