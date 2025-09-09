# Setup fzf
# ---------
if [[ ! "$PATH" == */home/opeykin/tools/fzf/bin* ]]; then
  export PATH="$PATH:/home/opeykin/tools/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/opeykin/tools/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------

if [ -f /home/opeykin/toolsfzf/shell/key-bindings.bash ]; then
  . /home/opeykin/toolsfzf/shell/key-bindings.bash
fi

if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
  . /usr/share/fzf/shell/key-bindings.bash
fi

# hg sl
# ------------
hg_sl_fzf() {
    # hg sl | fzf --phony --reverse --height=50% | sed -E 's/.*[o@x]\s*([0-9a-f]*)\s.*/\1/'
    hg sl | fzf --phony --reverse --height=50% | sed -E 's/.*[o@x]\s*([0-9a-f]+)\s.*/\1/'
    #script --return --quiet -c "hg sl" /dev/null | sed 's/\x1B\[\?[0-9]*[lh]//g' | fzf --phony --reverse --height=50% | sed -E 's/.*[o@x]\s*([0-9a-f]+)\s.*/\1/'
}


if [[ ! -o vi ]]; then
    # this is not tested. There is 80% it's going to work
    bind '"\C-g": " \C-e\C-u\C-y\ey\C-u`hg_sl_fzf`\e\C-e\er\e^"'
else
    bind '"\C-g": "\C-x\C-a$a \C-x\C-addi`hg_sl_fzf`\C-x\C-e\C-x\C-a0Px$a \C-x\C-r\C-x\C-axa "'
fi
