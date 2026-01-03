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
hg_sl_fzf() {
    hg sl | fzf --phony --reverse --height=50% | sed -E 's/.*[o@x]\s*([0-9a-f]+)\s.*/\1/'
}

# Wrapper function for readline binding
_hg_sl_fzf_widget() {
    local result
    result=$(hg_sl_fzf)
    READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}${result}${READLINE_LINE:$READLINE_POINT}"
    READLINE_POINT=$((READLINE_POINT + ${#result}))
}

# Bind Ctrl+g to the widget
bind -x '"\C-g": _hg_sl_fzf_widget'
