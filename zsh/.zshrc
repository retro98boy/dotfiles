# 历史命令
export HISTFILE=$HOME/.zhistory    # 记录到该文件
setopt HIST_IGNORE_DUPS            # 连续输入的命令相同，只纪录一次
export HISTSIZE=10000              # 记录到shell进程中的命令数量
export SAVEHIST=10000              # 记录到文件的命令数量
# setopt inc_append_history          # 每次执行命令都追加到记录文件
# setopt share_history               # 每次尝试调用历史命令前会加载记录文件


# 别名
alias ls='ls --color=auto'
alias ll='ls -Alh'
alias l.='ls -dlh'
alias grep='grep --color=auto -i'


# https://neovim.io/doc/user/filetype.html#ft-man-plugin
export MANPAGER='nvim +Man!'


# 按键映射
bindkey -e
# cat -v，然后按下组合键可得到按键序列
bindkey '^K' kill-whole-line      # Ctrl+k
bindkey '^A' beginning-of-line    # Ctrl+a
bindkey '^E' end-of-line          # Ctrl+e


# 光标形状
# https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html
cursor_steady_block='\e[2 q'
cursor_steady_beam='\e[6 q'
cursor_blink_block='\e[1 q'
cursor_blink_beam='\e[5 q'

zle-keymap-select() {
    if [[ $KEYMAP == vicmd ]] ||
        [[ $1 = 'block' ]]; then
        echo -ne $cursor_blink_block
    elif [[ $KEYMAP == main ]] ||
        [[ $KEYMAP == viins ]] ||
        [[ $KEYMAP = '' ]] ||
        [[ $1 = 'beam' ]]; then
        echo -ne $cursor_blink_beam
    fi
}

zle-line-init() {
    echo -ne $cursor_blink_beam
}

zle -N zle-keymap-select
zle -N zle-line-init


# 目录堆栈
# https://zsh.sourceforge.io/Doc/Release/Options.html
setopt AUTO_CD              # 直接输入路径进入目录，不需要输入cd
setopt AUTO_PUSHD           # 执行cd后自动将旧目录推入目录堆栈
setopt PUSHD_IGNORE_DUPS    # 不在目录堆栈中存储重复项
setopt PUSHD_SILENT         # 在pushd或popd之后不打印目录堆栈
setopt PUSHD_TO_HOME        # pushd没有给出参数时等同于pushd ~
alias d='dirs -v'
export DIRSTACKSIZE=40
DIRSTACKFILE=$HOME/.cache/zsh/dirstack
if [[ ! -f $DIRSTACKFILE ]]; then
	mkdir -p $(dirname $DIRSTACKFILE)
	touch $DIRSTACKFILE
fi
# 从堆栈文件读取数据
if [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
fi
# 更新堆栈文件
# chpwd钩子函数，工作目录改变时会自动执行 https://zsh.sourceforge.io/Doc/Release/Functions.html
chpwd() {
  print -l $PWD ${(u)dirstack} > $DIRSTACKFILE
}
for index in {0..39}; do
	alias $index="cd +$index"
done
unset index


# 插件保存位置
ZSH_PLUGIN_PATH=$HOME/.local/share/zsh/plugins


# zsh-completions 添加更多命令补全
source $ZSH_PLUGIN_PATH/zsh-completions/zsh-completions.plugin.zsh
# fpath=($fpath $ZSH_PLUGIN_PATH/zsh-completions/src)
# 打开命令补全系统
autoload -Uz compinit    # autoload将compinit标记成$fpath中的函数而不是$PATH中的可执行文件，函数名和文件名相同，即compinit函数定义在compinit文件中；U选项表示在加载函数过程中抑制alias，z选项表示函数使用zsh风格加载；autoload只会在需要时加载函数
compinit    # 生成.zcompdump文件
zstyle ':completion:*' rehash true    # $PATH中有新可执行文件时，命令补全系统同步更新


# zsh-autosuggestions
source $ZSH_PLUGIN_PATH/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh


# fast-syntax-highlighting
source $ZSH_PLUGIN_PATH/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh


# zsh-history-substring-search 需要在zsh-syntax-highlighting后加载
source $ZSH_PLUGIN_PATH/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
bindkey '^[[1;5A' history-substring-search-up      # Ctrl+上箭头
bindkey '^[[1;5B' history-substring-search-down    # Ctrl+下箭头


# sudo
source $ZSH_PLUGIN_PATH/sudo/sudo.plugin.zsh


# pure prompt
source $ZSH_PLUGIN_PATH/pure/async.zsh
source $ZSH_PLUGIN_PATH/pure/pure.zsh
