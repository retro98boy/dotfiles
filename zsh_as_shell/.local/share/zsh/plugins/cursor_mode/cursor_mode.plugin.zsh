cursor_mode() {
    # https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html
    cursor_steady_block='\e[2 q'
    cursor_steady_beam='\e[6 q'
    cursor_blink_block='\e[1 q'
    cursor_blink_beam='\e[5 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_blink_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_blink_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_blink_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode
