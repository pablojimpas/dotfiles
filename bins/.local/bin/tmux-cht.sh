#!/bin/sh
selected=$(cat ~/.config/tmux/tmux-cht-languages ~/.config/tmux/tmux-cht-commands | fzf)
if [ -z "$selected" ]; then
    exit 0
fi

echo "Enter Query: "
read -r query

if grep -qs "$selected" ~/.config/tmux/tmux-cht-languages; then
	query=$(echo "$query" | tr ' ' '+')
	tmux neww sh -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
	tmux neww sh -c "curl -s cht.sh/$selected~$query | more"
fi

